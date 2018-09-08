defmodule PokemonDatabase.Pokeapi do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2/"
  plug Tesla.Middleware.Headers, [{"Accept", "Application/json"}]
  plug Tesla.Middleware.JSON

  def pokemon() do
    get("/pokemon/")
  end

  def pokemon(%{offset: offset}) do
    get("/pokemon/?limit=20&offset=#{offset}")
  end

  def pokemon(pokemon) do
    get("/pokemon/#{pokemon}/")
  end
end
