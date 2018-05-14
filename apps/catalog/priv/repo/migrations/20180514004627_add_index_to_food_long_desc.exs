defmodule Catalog.Repo.Migrations.AddIndexToFoodLongDesc do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION pg_trgm;"
    execute "CREATE INDEX long_desc_trgm_index ON food USING gin (long_desc gin_trgm_ops);"
  end

  def down do
    execute "DROP INDEX long_desc_trgm_index;"
    execute "DROP EXTENSION pg_trgm;"
  end
end
