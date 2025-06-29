class Api::TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show update destroy ]

  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  def by_company
    @transactions = Transaction.where(company_id: params[:company_id])
    render json: @transactions
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: api_company_url(@transaction)
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy!
  end

  private

    def set_transaction
      @transaction = Transaction.find(params.expect(:id))
    end


   def transaction_params
  params.permit(:pricePerUnit, :quantity, :expenses, :transaction_type, :product_id, :company_id)
end

end
