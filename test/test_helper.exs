ExUnit.start

BirdWatch.Couchdb.destroy!()

Code.eval_file("priv/repo/seeds.exs")
