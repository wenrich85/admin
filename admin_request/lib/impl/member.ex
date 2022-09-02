defmodule AdminRequest.Impl.Member do
  use Ecto.Schema

  import Ecto.Changeset

  embedded_schema do
    field :name, :string
    field :email, :string
  end

  def new(member) do
    %__MODULE__{}
    |> changeset(member)
    |> apply_action(:update)
  end

  def new_changeset() do
    %__MODULE__{}
    |> changeset(%{})
  end

  defp changeset(member, attrs) do
    member
    |> cast(attrs, [:name, :email, :id])
    |> validate_required( [:name, :email])
  end
end
