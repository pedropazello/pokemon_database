defmodule PokemonDatabaseWeb.PokemonController do
  use PokemonDatabaseWeb, :controller
  alias PokemonDatabase.Pokemon
  alias PokemonDatabase.PokemonElasticsearch

  def index(conn, %{ "q" => term }) do
    all_pokemon = PokemonElasticsearch.get_by(term)
    render conn, "result.html", all_pokemon: all_pokemon
  end

  def index(conn, _) do
    render conn, "index.html"
  end
end
