defmodule Web.GraphqlTest do
  use Web.ConnCase, async: true

  @query """
  {
    usdaItems(matching: "salmon") {
      longDesc
    }
  }
  """
  test "get USDA item containing salmon" do
    response = get(build_conn(), "/g/api", query: @query)
    items = Enum.map(json_response(response, 200)["data"]["usdaItems"], & &1["longDesc"])
    assert "Fish oil, salmon" in items
  end
end
