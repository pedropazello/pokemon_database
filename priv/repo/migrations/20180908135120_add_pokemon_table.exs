defmodule PokemonDatabase.Repo.Migrations.AddPokemonTable do
  use Ecto.Migration

  def change do
    create table(:pokemon, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :number, :integer

      timestamps()
    end
  end
end
