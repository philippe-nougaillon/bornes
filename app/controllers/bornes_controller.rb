class BornesController < ApplicationController
  before_action :set_borne, only: [:show, :edit, :update, :destroy]

  # GET /bornes
  # GET /bornes.json
  def index
    @bornes = Borne.all

    if params[:search].present?
      @bornes = @bornes.where("n_station like ? OR ad_station like ? OR n_enseigne like ? OR n_amenageur like ? OR n_operateur like ?", 
                            "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:nearby].present?
      if params[:search].present?
        location = params[:search].upcase + ', FR'
      else
        location = (request.ip != '127.0.0.1' ? request.ip : '195.68.72.6') # si en mode 'dev' forcer l'IP de la box
      end
      @bornes = Borne.near(location, 20)
    end

    if params[:stations].present?
      @bornes = @bornes.group(:id_station)
    end

    respond_to do |format|
      format.html { @bornes = @bornes.page(params[:page]) }
      format.json
    end
  end

  # GET /bornes/1
  # GET /bornes/1.json
  def show
    @bornes = @borne.nearbys(20).where.not(id_station: @borne.id_station)
  end

  # GET /bornes/new
  def new
    @borne = Borne.new
  end

  # GET /bornes/1/edit
  def edit
  end

  # POST /bornes
  # POST /bornes.json
  def create
    @borne = Borne.new(borne_params)

    respond_to do |format|
      if @borne.save
        format.html { redirect_to @borne, notice: 'Borne was successfully created.' }
        format.json { render :show, status: :created, location: @borne }
      else
        format.html { render :new }
        format.json { render json: @borne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bornes/1
  # PATCH/PUT /bornes/1.json
  def update
    respond_to do |format|
      if @borne.update(borne_params)
        format.html { redirect_to @borne, notice: 'Borne was successfully updated.' }
        format.json { render :show, status: :ok, location: @borne }
      else
        format.html { render :edit }
        format.json { render json: @borne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bornes/1
  # DELETE /bornes/1.json
  def destroy
    @borne.destroy
    respond_to do |format|
      format.html { redirect_to bornes_url, notice: 'Borne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borne
      @borne = Borne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borne_params
      params.require(:borne).permit(:n_amenageur, :n_operateur, :n_enseigne, :id_station, :n_station, :ad_station, :code_insee, :Xlongitude, :Ylatitude, :nbre_pdc, :id_pdc, :puiss_max, :type_prise, :acces_recharge, :accessibilité, :observations, :date_maj, :source)
    end
end
