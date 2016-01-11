# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias BirdWatch.Couchdb
alias BirdWatch.Bird

Couchdb.test_database_server_connection

case Couchdb.create do
  {:ok, :database_exists} ->
    IO.puts "Database could not be created. Please check if it already exists"
  {:ok, _} ->
    robin = Poison.encode! %Bird{
      name: "European Robin (Erithacus rubecula)",
      link: "European_robin",
      location: "53° 35′ 39.8″ N, 2° 40′ 31.39″ W",
      image: "Erithacus_rubecula_with_cocked_head.jpg",
      date: "27 February 2014, 17:42:10",
      attribution: "\"Erithacus rubecula with cocked head\" by © Francis C. Franklin / CC-BY-SA-3.0. Licensed under CC BY-SA 3.0 via Commons",
      attribution_link: "https://commons.wikimedia.org/wiki/File:Erithacus_rubecula_with_cocked_head.jpg"}
    Couchdb.insert robin

    mockingbird = Poison.encode! %Bird{
      name: "Northern Mockingbird (Mimus polyglottos)",
      link: "Northern_mockingbird",
      location: "New Hampshire, USA",
      image: "Mimus_polyglottos_adult_02_cropped.jpg",
      date: "23 May 2009",
      attribution: "\"Mimus polyglottos adult 02 cropped\" by Captain-tucker - Own work. Licensed under CC BY-SA 3.0 via Commons",
      attribution_link: "https://commons.wikimedia.org/wiki/File:Mimus_polyglottos_adult_02_cropped.jpg"}
    Couchdb.insert mockingbird

    nuthatch = Poison.encode! %Bird{
      name: "Eurasian Nuthatch (Sitta europaea)",
      link: "Eurasian_nuthatch",
      location: "Kent, UK",
      image: "Sitta_europaea_-Kent,_England-8.jpg",
      date: "5 March 2014, 13:17:58",
      attribution: "\"Sitta europaea -Kent, England-8\" by Smudge 9000 - Flickr: Nuthatch (Sitta europaea). Licensed under CC BY-SA 2.0 via Commons",
      attribution_link: "https://commons.wikimedia.org/wiki/File:Sitta_europaea_-Kent,_England-8.jpg"}
    Couchdb.insert nuthatch

    bluetit = Poison.encode! %Bird{
      name: "Eurasian Blue Tit (Cyanistes caeruleus)",
      link: "Eurasian_blue_tit",
      location: "Unknown",
      image: "Parus_caeruleus01.jpg",
      date: "10 January 2007, 20:06",
      attribution: "\"Parus caeruleus01\". Lizenziert unter CC BY-SA 3.0 über Wikimedia Commons",
      attribution_link: "https://commons.wikimedia.org/wiki/File:Parus_caeruleus01.jpg"}
    Couchdb.insert bluetit

    woodpecker = Poison.encode! %Bird{
      name: "Great Spotted Woodpecker (Dendrocopos major)",
      link: "Great_spotted_woodpecker",
      location: "Unknown",
      image: "FlyingDendrocoposMajor.jpg",
      date: "2 December 2007",
      attribution: "\"FlyingDendrocoposMajor\" von David Meisel (BlueFox at de.wikipedia) - own photography, first upload on de.wikipedia.org (de:Bild:FlyingDendrocoposMajor.jpg). Lizenziert unter CC BY-SA 2.0 de über Wikimedia Commons",
      attribution_link: "https://commons.wikimedia.org/wiki/File:FlyingDendrocoposMajor.jpg"}
    Couchdb.insert woodpecker

    kingfisher = Poison.encode! %Bird{
      name: "Common Kingfisher (Alcedo atthis)",
      link: "Common_kingfisher",
      location: "Naturschutzgebiet \"Berkelaue II\" (NSG BOR-070) in 48691 Vreden",
      image: "Eisvogel_im_Schwebflug.jpg",
      date: "14 June 2011, 11:12:11",
      attribution: "\"Ein Eisvogel im Schwebflug\" von Joefrei - Eigenes Werk. Lizenziert unter CC BY-SA 3.0 über Wikimedia Commons",
      attribution_link: "https://commons.wikimedia.org/wiki/File:Ein_Eisvogel_im_Schwebflug.jpg"}
    Couchdb.insert kingfisher

    jay = Poison.encode! %Bird{
      name: "Eurasian Jay (Garrulus glandarius)",
      link: "Eurasian_jay",
      location: "50° 20′ 27.27″ N, 5° 09′ 46.54″ E",
      image: "Garrulus_glandarius_B_Luc_Viatour.jpg",
      date: "2008",
      attribution: "\"Garrulus glandarius B Luc Viatour\" von I, Luc Viatour. Lizenziert unter CC BY-SA 3.0 über Wikimedia Commons",
      attribution_link: "https://commons.wikimedia.org/wiki/File:Garrulus_glandarius_B_Luc_Viatour.jpg"}
    Couchdb.insert jay

    blackbird = Poison.encode! %Bird{
      name: "Common Blackbird (Turdus merula)",
      link: "Common_blackbird",
      location: "Unknown",
      image: "Blackbird_2.jpg",
      date: "30 May 2007",
      attribution: "\"Blackbird 2\" by w:User:SonNy cZ - Originally uploaded to wikipedia by w:User:SonNy cZ on 30 May 2007. Licensed under CC BY-SA 3.0 via Commons",
      attribution_link: "https://commons.wikimedia.org/wiki/File:Blackbird_2.jpg"}
    Couchdb.insert blackbird

    by_link_code = File.read! "priv/repo/views/bird_by_link.json"
    Couchdb.create_view "bird", by_link_code

    IO.puts "Database has been seeded successfully"

  {:error, body} ->
    IO.puts "Database could not be created. An error occured:"
    IO.puts body
end
