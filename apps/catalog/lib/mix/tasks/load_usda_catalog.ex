defmodule Mix.Tasks.LoadUsdaCatalog do
  use Mix.Task
  alias Mix.Tasks.Ecto.Load

  @moduledoc """
  Mix task for unzipping and loading catalog sql.
  """

  @shortdoc "Unzip structure.sql.zip file."
  def run(_) do
    unzip_file()
    move_file()
    load_sql()
  end

  defp path, do: "#{System.cwd()}/apps/catalog/priv/repo/"
  defp file_name, do: "structure.sql"
  defp zip_file, do: "#{path()}#{file_name}.zip"

  defp unzip_file do
    {:ok, _} =
      zip_file()
      |> String.to_char_list()
      |> :zip.unzip()
  end

  defp move_file do
    sql_file = "#{System.cwd()}/structure.sql"
    File.cp!(sql_file, "#{path}structure.sql")
    File.rm!(sql_file)
  end

  defp load_sql, do: Load.run(["-r", "Catalog.Repo"])
end
