defmodule RealTime.CatalogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RealTime.Catalogs` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        avalability: 42,
        name: "some name",
        price: 42,
        sku: 42
      })
      |> RealTime.Catalogs.create_product()

    product
  end
end
