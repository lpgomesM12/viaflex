class ProductordemsController < ApplicationController
  before_action :set_productordem, only: [:show, :edit, :update, :destroy]

include ActionView::Helpers::NumberHelper


 def exclui_produto_ordem
   @productordem = Productordem.find(params[:id])
   @productordem.destroy

   render :json => true
 end
 def add_produto_ordem

     valor_produto = params[:valor_produto].gsub('R$', '')
     valor_produto = valor_produto.gsub('.', '')
     valor_produto = valor_produto.gsub(',', '.').to_f

     @productordem = Productordem.new
     @productordem.serviceordem_id = params[:ordemservico]
     @productordem.product_id = params[:produto_id]
     @productordem.valor_product = valor_produto
     @productordem.qtd_product = params[:qtd_produto]
     @productordem.save

     render :json => true
 end

 def busca_produto_ordem
   productordems = Productordem.where(serviceordem_id: params[:ordemservico])

   valor_total_produtos = 0

   for pro in productordems
     valor_total_produtos += (pro.valor_product * pro.qtd_product)
   end

   produtos_json = productordems.map {|item| {:id => item.id,
                                              :nome_produto => item.product.nome_produto,
                                              :valor_product => number_to_currency(item.valor_product, unit: "R$", separator: ",", delimiter: ""),
                                              :qtd_product => item.qtd_product,
                                              :valor_total => number_to_currency((item.qtd_product * item.valor_product), unit: "R$", separator: ",", delimiter: ""),
                                              :valor_total_produtos => number_to_currency(valor_total_produtos, unit: "R$", separator: ",", delimiter: ".")}}
   render :json => produtos_json

 end

  # GET /productordems
  # GET /productordems.json
  def index
    @productordems = Productordem.all
  end

  # GET /productordems/1
  # GET /productordems/1.json
  def show
  end

  # GET /productordems/new
  def new
    @productordem = Productordem.new
  end

  # GET /productordems/1/edit
  def edit
  end

  # POST /productordems
  # POST /productordems.json
  def create
    @productordem = Productordem.new(productordem_params)

    respond_to do |format|
      if @productordem.save
        format.html { redirect_to @productordem, notice: 'Productordem was successfully created.' }
        format.json { render :show, status: :created, location: @productordem }
      else
        format.html { render :new }
        format.json { render json: @productordem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productordems/1
  # PATCH/PUT /productordems/1.json
  def update
    respond_to do |format|
      if @productordem.update(productordem_params)
        format.html { redirect_to @productordem, notice: 'Productordem was successfully updated.' }
        format.json { render :show, status: :ok, location: @productordem }
      else
        format.html { render :edit }
        format.json { render json: @productordem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productordems/1
  # DELETE /productordems/1.json
  def destroy
    @productordem.destroy
    respond_to do |format|
      format.html { redirect_to productordems_url, notice: 'Productordem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productordem
      @productordem = Productordem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productordem_params
      params.require(:productordem).permit(:serviceordem_id, :product_id, :valor_product, :qtd_product)
    end
end
