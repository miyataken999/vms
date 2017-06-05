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
  schema "posts" do
    field :user,          :string
    field :header_img,    :string
    field :title,         :string
    field :content,       :string
    field :markdown,      :string
    field :html,          :string
    field :status,        :string
    timestamps()
  end

  def objectid(id) do
    {_, idbin} = Base.decode16(id, case: :mixed)
    %BSON.ObjectId{value: idbin}
  end

  def index(params) do
    Mongo.find(:mongo, "posts", %{}, limit: 20)
    |> Enum.to_list
    |> Poison.encode!
  end

  def show(%{"id" => id}) do
    Mongo.find_one(:mongo, "posts", %{"_id"=> objectid(id)})
    |> Poison.encode!
  end

  def create(params) do
    case Mongo.insert_one :mongo, "posts", params do
      {:ok, _} -> :ok
      _ -> :error
    end
  end

  def update_one(query, params) do
    Mongo.update_one(:mongo, "posts",query, %{"$set": params})
    # |> Poison.encode!
  end

  def delete_one(query) do
    Mongo.delete_one(:mongo, "posts",query)
    # |> Poison.encode!
  end

end
