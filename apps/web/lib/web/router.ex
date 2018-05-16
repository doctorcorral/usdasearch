defmodule Web.Router do
  use Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Web do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/api/v1", Web.V1 do
    pipe_through(:api)

    get("/catalog", CatalogController, :search)
  end

  scope "/g" do
    pipe_through(:api)

    forward("/api", Absinthe.Plug, schema: Web.Schema)

    forward(
      "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: Web.Schema,
      interface: :simple
    )
  end
end
