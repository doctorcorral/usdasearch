Code.load_file("test/support/factory.ex")
Code.load_file("test/support/data_case.ex")
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Catalog.Repo, :auto)
