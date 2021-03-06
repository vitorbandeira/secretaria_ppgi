##
# Esta Classe controla o funcionamento dos processos de Atendimento da aplicacao web da secretaria de Pós Graduação.

class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  # comentario
  # GET /attendances
  # GET /attendances.json

  ##
  # Cria a pagina incial .
  #
  # @attendances - variavel global responsavel por carregar os elementos na pagina
  #

  def index
    @attendances = Attendance.includes(:comments)
  end
  
  ##
  # Realiza uma busca do elemento no banco de dados.
  #
  # @attendances - retorna o elemento resultado da busca na pagina
  #
  # POST /attendances/search

  def search
    if params[:search].blank?  
      redirect_to(attendances_path, alert: "Empty field!") and return  
    else
      @attendances = Attendance.includes(:comments).where("title LIKE?","%" + params[:search] + "%").order("created_at DESC")
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  ##
  # Cria um novo objeto do tipo attendance.
  #
  # @attendances - gera um objeto do tipo attendance.
  #
  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  ##
  # Solicita a criacao de um objeto formulario passando os parametros para attendance.new
  # e mostra na tela que o objeto foi criado com sucesso.
  # @attendances - recebe os parametros para criacao de objeto
  #
  # POST /attendances
  # POST /attendances.json

  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Atualiza um objeto ja criado com novos parametros passados.
  #
  # @attendances - tem seus valores alterados de acordo com os parametros passados.
  #
  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Deleta um elemento do banco de dados.
  #
  # @attendances - variavel deletada do banco de dados
  #
  # DELETE /attendances/1
  # DELETE /attendances/1.json

  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ##
  # Deleta o arquivo anexado.
  #
  # @attendances - variavel global responsavel por carregar os elementos na pagina
  #

  def delete_file_attachment
    @file = ActiveStorage::Blob.find_signed(params[:id])
    @file.attachments.first.purge
    redirect_back(fallback_location: attendances_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.with_attached_files.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:title, :content, :files)
    end
end
