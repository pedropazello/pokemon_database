defmodule PokemonDatabaseWeb.PokemonController do
  use PokemonDatabaseWeb, :controller
  alias PokemonDatabase.Pokemon

  def index(conn, %{ "q" => query }) do
    all_pokemon = Pokemon.list_all
    render conn, "result.html", all_pokemon: all_pokemon
  end

  def index(conn, _) do
    render conn, "index.html"
  end
end
