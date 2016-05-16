defmodule BirdWatch.Couchdb do


  @database_properties %{
    protocol: Application.get_env(:couchdb_connector, :protocol),
    hostname: Application.get_env(:couchdb_connector, :hostname),
    database: Application.get_env(:couchdb_connector, :database),
    port: Application.get_env(:couchdb_connector, :port)
  }

  @server_uri "#{@database_properties[:protocol]}://#{@database_properties[:hostname]}:#{@database_properties[:port]}/"
  @database_uri "#{@server_uri}/#{@database_properties[:database]}"

  alias Couchdb.Connector.Reader
  alias Couchdb.Connector.Writer
  alias Couchdb.Connector.View
  alias Couchdb.Connector.Storage

  def test_database_server_connection do
    case HTTPoison.get @server_uri do
      {:error, %HTTPoison.Error{reason: :econnrefused}} ->
        raise RuntimeError, message: "Connection refused. Is the database running?"
      {:ok, %HTTPoison.Response{status_code: 200}} ->
        {:ok, :connection_accepted}
    end
  end

  def create do
    case HTTPoison.get "#{@database_uri}" do
      {:ok, %HTTPoison.Response{status_code: 200}} ->
        {:ok, :database_exists}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        case Storage.storage_up @database_properties do
          {:ok, body} -> {:ok, body}
          {:error, body} -> {:error, body}
        end
    end
  end

  def destroy! props do
    Couchdb.Connector.Storage.storage_down props
  end

  def insert document do
    Writer.create_generate @database_properties, document
  end

  def read id do
    {:ok, bird_json} = Reader.get @database_properties, id
    bird_json
  end

  def all_birds do
    {:ok, birds_json} = View.fetch_all @database_properties, "bird", "by_link"
    birds_json
  end

  def bird_by_link link do
    {:ok, birds_json} = View.document_by_key @database_properties, "bird", "by_link", link
    result_set = Poison.Parser.parse! birds_json
    case result_set["rows"] do
      [] -> not_found()
      _ -> first_result result_set
    end
  end

  def sightings_by_bird_link link do
    {:ok, sightings_json} = View.document_by_key @database_properties, "sightings", "by_bird_link", link
    result_set = Poison.Parser.parse! sightings_json
    case result_set["rows"] do
      [] -> []
      _ -> {:ok, result_set["rows"]}
    end
  end

  defp not_found do
    {:error, :not_found}
  end

  defp first_result result_set do
    {:ok, hd(result_set["rows"])["value"]}
  end

  def create_view design_name, code do
    View.create_view @database_properties, design_name, code
  end
end
