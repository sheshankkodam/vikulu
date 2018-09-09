defmodule VikuluWeb.StatusController do
  @moduledoc false

  use VikuluWeb, :controller

  def show(conn, _params) do
    json(conn, %{
      application: app(),
      version: "0.0.1",
      status: "Up and running",
      environment: Mix.env(),
      uptime: to_string(uptime())
    })
  end

  @app Mix.Project.config[:app]
  def app(), do: Atom.to_string(@app)

  @ver Mix.Project.config[:version]
  def app(), do: Atom.to_string(@ver)

  defp uptime() do
    {uptime, _} = :erlang.statistics(:wall_clock)
    {d, {h, m, s}} = :calendar.seconds_to_daystime(div(uptime, 1000))

    :lists.flatten(
      :io_lib.format("~p days, ~p hours, ~p minutes and ~p seconds", [
        d,
        h,
        m,
        s
      ])
    )
  end
end
