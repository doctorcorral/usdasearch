defmodule Web.V1.CatalogController do
  use Web, :controller
  alias Catalog.CatalogService

  def search(conn, %{"search_term" => search_term}) do
    CatalogService
    |> GenServer.call({:search, search_term})
    |> send_response(conn)
  end

  defp send_response(result, conn) do
    conn
    |> put_status(200)
    |> json(%{data: result})
  end
end
