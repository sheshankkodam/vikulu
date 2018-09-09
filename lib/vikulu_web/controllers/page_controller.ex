defmodule VikuluWeb.PageController do
  use VikuluWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
