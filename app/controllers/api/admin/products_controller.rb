module Api
  module Admin
    class ProductsController < Api::BaseController
      before_action :authenticate, except: %i[show_items_price]
      before_action :set_product, only: %i[show update destroy]

      # GET /products
      def index
        @products = Product.all

        render json: @products
      end

      # GET /products/1
      def show
        render json: @product
      end

      # POST /products
      def create
        @product = Product.new(product_params)
        @product.user = current_user

        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /products/1
      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /products/1
      def destroy
        @product.destroy
      end

      def show_items_price
        items = params[:items].map(&:upcase)
        calculation = CalculatePrice.new(items)

        if calculation.validate
          render json: { Items: items, Total: calculation.total }, status: 200
        else
          render json: { errors: [{ source: 'items[]', title: 'Not found' }] }, status: :bad_request
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def product_params
        permitted_params = %i[name price code]
        permitted_params.delete_if { |item| item =~ /name|code/i } if action_name == 'update'
        params.require(:product).permit(permitted_params)
      end
    end
  end
end
