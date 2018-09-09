defmodule PokemonDatabase.PokemonElasticsearch do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://localhost:9200/pokemon_database/"
  plug Tesla.Middleware.Headers, [
    {"Accept", "Application/json"},
    {"content-type", "Application/json"}
  ]
  plug Tesla.Middleware.JSON

  alias PokemonDatabase.Pokemon

  def insert(pokemon) do
    post("/pokemon/", convert_to_json(pokemon))
  end

  def get_by(term) do
    {:ok, response} = get("/pokemon/_search?q=#{term}")
    Enum.map(response.body["hits"]["hits"], fn hit ->
      result = Map.new(hit["_source"], fn {k, v} ->
        {String.to_atom(k), v}
      end)
      Map.merge(%Pokemon{}, result)
    end)
  end

  def convert_to_json(pokemon) do
    Poison.encode!(%{
      "id" => pokemon.id,
      "name" => pokemon.name,
      "number" => pokemon.number
    })
  end
end
