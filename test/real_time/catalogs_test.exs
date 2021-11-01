defmodule RealTime.CatalogsTest do
  use RealTime.DataCase

  alias RealTime.Catalogs

  describe "products" do
    alias RealTime.Catalogs.Product

    import RealTime.CatalogsFixtures

    @invalid_attrs %{avalability: nil, name: nil, price: nil, sku: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalogs.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalogs.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{avalability: 42, name: "some name", price: 42, sku: 42}

      assert {:ok, %Product{} = product} = Catalogs.create_product(valid_attrs)
      assert product.avalability == 42
      assert product.name == "some name"
      assert product.price == 42
      assert product.sku == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalogs.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{avalability: 43, name: "some updated name", price: 43, sku: 43}

      assert {:ok, %Product{} = product} = Catalogs.update_product(product, update_attrs)
      assert product.avalability == 43
      assert product.name == "some updated name"
      assert product.price == 43
      assert product.sku == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalogs.update_product(product, @invalid_attrs)
      assert product == Catalogs.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalogs.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalogs.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalogs.change_product(product)
    end
  end
end
