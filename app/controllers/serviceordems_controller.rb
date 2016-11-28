class ServiceordemsController < ApplicationController
  before_action :set_serviceordem, only: [:show, :edit, :update, :destroy]

 def agendamento
   @serviceordems = Serviceordem.page(params[:page]).per(20)
 end

 def relatorio
   @serviceordem = Serviceordem.find(params[:id])

   respond_to do |format|
     format.html
     format.pdf { render pdf: "reserva"
       }
   end
 end
  # GET /serviceordems
  # GET /serviceordems.json
  def index

  if params[:q]
     @q = params[:q]
     @serviceordems= Serviceordem.busca(params[:q]).page(params[:page]).per(6)
    else
      @serviceordems = Serviceordem.page(params[:page]).per(6)
   end

  end

  # GET /serviceordems/1
  # GET /serviceordems/1.json
  def show
  end

  # GET /serviceordems/new
  def new
    @serviceordem = Serviceordem.new
    @serviceordem.situacao = "Orçamento"

    @serviceordem.save


    redirect_to edit_serviceordem_path(@serviceordem)

  end

  # GET /serviceordems/1/edit
  def edit
    @serviceordem.data_venda = @serviceordem.data_venda.blank? ? '' : @serviceordem.data_venda.strftime("%d/%m/%Y")
    @serviceordem.data_instalacao = @serviceordem.data_instalacao.blank? ? '' : @serviceordem.data_instalacao.strftime("%d/%m/%Y")
  end

  # POST /serviceordems
  # POST /serviceordems.json
  def create
    @serviceordem = Serviceordem.new(serviceordem_params)

    respond_to do |format|
      if @serviceordem.save
        format.html { redirect_to @serviceordem, notice: 'Ordem de serviço cadastrada com sucesso.' }
        format.json { render :show, status: :created, location: @serviceordem }
      else
        format.html { render :new }
        format.json { render json: @serviceordem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serviceordems/1
  # PATCH/PUT /serviceordems/1.json
  def update
    respond_to do |format|
      if @serviceordem.update(serviceordem_params)
        format.html { redirect_to @serviceordem, notice: 'Ordem de serviço alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @serviceordem }
      else
        format.html { render :edit }
        format.json { render json: @serviceordem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serviceordems/1
  # DELETE /serviceordems/1.json
  def destroy
    @serviceordem.destroy
    respond_to do |format|
      format.html { redirect_to serviceordems_url, notice: 'Ordem de serviço excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serviceordem
      @serviceordem = Serviceordem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serviceordem_params
      params.require(:serviceordem).permit(:desc_produto, :nome_tecnicoatendimento, :data_venda, :data_instalacao, :desc_formapagamento, :tele_parente1, :tele_parente2, :client_id, :situacao, :turno, :dias_validadeproposta, :dias_prazoentrega, :horainicio, :horafim, fotoordemservice_attributes: [:id, :_destroy, :foto])
    end
end
