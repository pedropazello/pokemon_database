defmodule PokemonDatabase.Pokemon do
  use Ecto.Schema
  alias PokemonDatabase.Repo
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "pokemon" do
    field :name, :string
    field :number, :integer

    timestamps()
  end

  def list_all do
    Repo.all(__MODULE__)
  end
end
