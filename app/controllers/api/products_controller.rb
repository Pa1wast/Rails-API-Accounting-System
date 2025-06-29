class Api::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
 def index
  @products = Product.all.includes(:transactions) # eager load transactions to avoid N+1
  render json: @products
end


  # GET /products/1
  def show
    render json: @product
  end

   def by_company
    @products = Product.where(company_id: params[:company_id])
    render json: @products
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: api_company_url(@product)
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
    @product.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :name, :image_url, :company_id ])
    end
end
