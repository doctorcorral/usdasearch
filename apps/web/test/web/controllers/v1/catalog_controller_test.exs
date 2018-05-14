defmodule Web.CatlogControllerTest do
  use Web.ConnCase
  import Catalog.Factory
  test "GET /", %{conn: conn} do
    last_word =
      insert(:food).long_desc
      |> String.split(" ")
      |> List.last()
    conn = get conn, "/api/v1/catalog?search_term='#{last_word}'"
    assert %{"data" => [_]} = Poison.decode!(conn.resp_body)
  end
end
