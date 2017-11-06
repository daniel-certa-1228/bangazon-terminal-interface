require_relative "../../app/models/product"

# variables that will store id integers of the example entries so they can be idetified and deleted
id_1 = 0
id_2 = 0

describe '.get_products' do
    context "when calling all products" do
        it "returns an array of products from the database" do
            product = ProductModel.new
            all_products = product.get_products
            expect(all_products).to be_an(Array)
        end
    end
end


describe ".add_product - integration" do
    context "when testing" do
        it "checks Products table for 'Shoes'" do
            product = ProductModel.new
            product_arr = product.get_products
            expect(product_arr.flatten).not_to include("Shoes")
        end
        it "adds 'Shoes' to Products table" do
            product = ProductModel.new
            new_product = product.add_product(@product_name = "Shoes", @product_price = 9.99, @product_desc = "Nice shoes")
            id_1 = new_product.flatten[0]
        end
        it "checks Products table again for 'Shoes" do
            product = ProductModel.new
            product_arr = product.get_products
            expect(product_arr.flatten).to include("Shoes")
        end
    end
    context "after the method runs" do
        it "deletes test product from table" do
            product = ProductModel.new
            product.delete_product(id_1)
        end
    end
end

describe ".add_product - unit" do
    context "when called" do
        it "takes arguments for product name, price and description" do
            product = ProductModel.new
            new_product = product.add_product(@product_name = "Shoes", @product_price = 9.99, @product_desc = "Nice shoes")
            expect(@product_name).to be_an(String)
            expect(@product_price).to be_a(Float)
            expect(@product_desc).to be_a(String)
            expect(new_product.flatten[0]).to be_an(Integer)
            id_2 = new_product.flatten[0]
        end
    end
    context "after the method runs" do
        it "deletes test product from table" do
            product = ProductModel.new
            product.delete_product(id_2)
        end
    end
end

