defmodule Topview.UserController do
  use Topview.Web, :controller

  def index(conn, params) do
    json conn, Topview.UserModel.index params
  end

  def show(conn, params) do
    json conn, Topview.UserModel.show params
  end

  def create(conn, params) do
    json conn, Topview.UserModel.create params
  end

  def update(conn, params) do
    json conn, Topview.UserModel.update_one(params, %{})
  end

  def delete(conn, params) do
    json conn, Topview.UserModel.delete_one params
  end

end
