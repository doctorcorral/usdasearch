defmodule ELSquery.Interfaces.Handler do
  alias ELSquery.Handler

  defdelegate search(name), to: Handler
end
