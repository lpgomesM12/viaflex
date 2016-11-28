class ServiceordemservicesController < ApplicationController
  before_action :set_serviceordemservice, only: [:show, :edit, :update, :destroy]

 include ActionView::Helpers::NumberHelper

 def exclui_service_ordem
   @serviceordemservice = Serviceordemservice.find(params[:id])
   @serviceordemservice.destroy
   render :json => true
 end

  def busca_servico_ordem
    serviceordems = Serviceordemservice.where(serviceordem_id: params[:ordemservico])

    valor_total_servico = 0

    for ser in serviceordems
      valor_total_servico += (ser.valor_service * ser.qtd_service)
    end

    servicos_json = serviceordems.map {|item| {:id => item.id,
                                               :nome_servico => item.service.nome_servico,
                                               :valor_servico => number_to_currency(item.valor_service, unit: "R$", separator: ",", delimiter: ""),
                                               :qtd_servico => item.qtd_service,
                                               :valor_total => number_to_currency((item.qtd_service * item.valor_service), unit: "R$", separator: ",", delimiter: ""),
                                               :valor_total_servico => number_to_currency(valor_total_servico, unit: "R$", separator: ",", delimiter: ".")}}
    render :json => servicos_json

  end

  def add_service_ordem

      valor_service = params[:valor_service].gsub('R$', '')
      valor_service = valor_service.gsub('.', '')
      valor_service = valor_service.gsub(',', '.').to_f

      @serviceordem = Serviceordemservice.new
      @serviceordem.serviceordem_id = params[:ordemservico]
      @serviceordem.service_id = params[:service_id]
      @serviceordem.valor_service = valor_service
      @serviceordem.qtd_service = params[:qtd_service]
      @serviceordem.save

      render :json => true
  end

  # GET /serviceordemservices
  # GET /serviceordemservices.json
  def index
    @serviceordemservices = Serviceordemservice.all
  end

  # GET /serviceordemservices/1
  # GET /serviceordemservices/1.json
  def show
  end

  # GET /serviceordemservices/new
  def new
    @serviceordemservice = Serviceordemservice.new
  end

  # GET /serviceordemservices/1/edit
  def edit
  end

  # POST /serviceordemservices
  # POST /serviceordemservices.json
  def create
    @serviceordemservice = Serviceordemservice.new(serviceordemservice_params)

    respond_to do |format|
      if @serviceordemservice.save
        format.html { redirect_to @serviceordemservice, notice: 'Serviceordemservice was successfully created.' }
        format.json { render :show, status: :created, location: @serviceordemservice }
      else
        format.html { render :new }
        format.json { render json: @serviceordemservice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serviceordemservices/1
  # PATCH/PUT /serviceordemservices/1.json
  def update
    respond_to do |format|
      if @serviceordemservice.update(serviceordemservice_params)
        format.html { redirect_to @serviceordemservice, notice: 'Serviceordemservice was successfully updated.' }
        format.json { render :show, status: :ok, location: @serviceordemservice }
      else
        format.html { render :edit }
        format.json { render json: @serviceordemservice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serviceordemservices/1
  # DELETE /serviceordemservices/1.json
  def destroy
    @serviceordemservice.destroy
    respond_to do |format|
      format.html { redirect_to serviceordemservices_url, notice: 'Serviceordemservice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serviceordemservice
      @serviceordemservice = Serviceordemservice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serviceordemservice_params
      params.require(:serviceordemservice).permit(:serviceordem_id, :service_id, :valor_service, :qtd_service)
    end
end
