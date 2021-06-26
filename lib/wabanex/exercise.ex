defmodule Wabanex.Exercise do
  # importando macros e qualquer tipo de codigo
  use Ecto.Schema
  # importando funções
  import Ecto.Changeset

  alias Wabanex.{Training}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  # Variável de módulo
  @fields [:name, :protocol_description, :repetitions, :youtube_video_url]

  schema "exercises" do
    field :name, :string
    field :protocol_description, :string
    field :repetitions, :string
    field :youtube_video_url, :string

    belongs_to :training, Training

    timestamps()
  end

  def changeset(exercise, params) do
    # é a mesma coisa que digitar o nome do modulo(WABANEX.USER)
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
