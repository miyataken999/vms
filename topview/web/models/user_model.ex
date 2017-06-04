defimpl Poison.Encoder, for: BSON.ObjectId do
  def encode(id, options) do
    BSON.ObjectId.encode!(id) |> Poison.Encoder.encode(options)
  end
end

defmodule Topview.UserModel do
  use Topview.Web, :model
  require Logger

  @derive [Poison.Encoder]
  @primary_key {:id, :binary_id, autogenerate: true}  # the id maps to uuid
  schema "users" do
    field :email,         :string
    field :phone_number,  :string
    field :first_name,    :string
    field :last_name,     :string
    field :status,        :string
    timestamps()
  end

  def objectid(id) do
    {_, idbin} = Base.decode16(id, case: :mixed)
    %BSON.ObjectId{value: idbin}
  end

  def index(params) do
    Mongo.find(:mongo, "users", %{}, limit: 20)
    |> Enum.to_list
    |> Poison.encode!
  end

  def show(%{"id" => id}) do
    Mongo.find_one(:mongo, "users", %{"_id"=> objectid(id)})
    |> Poison.encode!
  end

  def create(params) do
    case Mongo.insert_one :mongo, "users", params do
      {:ok, _} -> :ok
      _ -> :error
    end
  end

  def update_one(query, params) do
    Mongo.update_one(:mongo, "users",query, %{"$set": params})
    # |> Poison.encode!
  end

  def delete_one(query) do
    Mongo.delete_one(:mongo, "users",query)
    # |> Poison.encode!
  end

end
