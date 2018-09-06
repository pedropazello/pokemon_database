defmodule PokemonDatabaseWeb.PageController do
  use PokemonDatabaseWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
