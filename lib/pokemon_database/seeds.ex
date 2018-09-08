defmodule PokemonDatabase.Seeds do
  alias PokemonDatabase.Repo
  alias PokemonDatabase.Pokeapi
  alias PokemonDatabase.Pokemon

  def insert_pokemon do
    {:ok, response} = Pokeapi.pokemon
    insert_results(response)
  end

  defp insert_results(response) do
    for result <- response.body["results"]  do
      Repo.insert!(%Pokemon{
        name:   result["name"],
        number: get_number(result["url"])
      })
    end

    insert_paginated_pokemon(get_offset(response.body["next"]))
  end

  defp get_number(url) do
    { number, "" } = Regex.run(~r/\/[0-9]+\//, url)
                     |> Enum.at(0)
                     |> String.replace("/", "")
                     |> Integer.parse
    number
  end

  defp get_offset(nil) do
  end

  defp get_offset(url) do
    Regex.run(~r/offset=[0-9]+/, url)
    |> Enum.at(0)
    |> String.replace("offset=", "")
  end

  defp insert_paginated_pokemon(nil) do
  end

  defp insert_paginated_pokemon(offset) do
    Process.sleep(5000)
    {:ok, response} = Pokeapi.pokemon(%{offset: offset})
    insert_results(response)
  end
end
