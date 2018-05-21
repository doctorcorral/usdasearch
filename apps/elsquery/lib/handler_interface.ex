defmodule ELSquery.Interfaces.Handler do
  @moduledoc """
  This module is intended to expose interface functions
  to ELSquery
  """
  alias ELSquery.Handler

  defdelegate search(name), to: Handler
end
