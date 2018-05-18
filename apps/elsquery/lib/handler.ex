defmodule ELSquery.Handler do
  @moduledoc """
  Module for handling Elasticsearch queries
  """
  import Tirexs.HTTP

  def search(name) when is_binary(name), do: get("/usda_v2/food/_search?q=name:#{name}")
end
