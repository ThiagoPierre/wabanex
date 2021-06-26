defmodule Wabanex.Training do
  # importando macros e qualquer tipo de codigo
  use Ecto.Schema
  # importando funções
  import Ecto.Changeset

  alias Wabanex.{Exercise, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Variável de módulo
  @fields [:end_date, :start_date, :user_id]

  schema "trainings" do
    field :end_date, :date
    field :start_date, :date

    belongs_to :user, User
    has_many :exercises, Exercise

    timestamps()
  end

  def changeset(params) do
    # é a mesma coisa que digitar o nome do modulo(WABANEX.USER)
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:email])
    |> cast_assoc(:exercises)
  end
end
