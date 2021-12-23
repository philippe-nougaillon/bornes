class BornesController < ApplicationController
  before_action :set_borne, only: [:show, :edit, :update, :destroy]

  # GET /bornes
  # GET /bornes.json
  def index
    @bornes = Borne.all
    params[:nearby] ||= '1'

    unless params[:search].blank?
      s = "'%#{params[:search].upcase}%'"
      @bornes = @bornes.where(Arel.sql("UPPER(bornes.n_station) LIKE #{s} OR UPPER(bornes.ad_station) LIKE#{s} OR UPPER(bornes.n_amenageur) LIKE #{s}"))
    end

    if params[:nearby].present?
      unless params[:search].blank?
        location = params[:search].upcase + ', FR'
        @bornes = Borne.near(location, 20)
      end
    end

    unless params[:puissance].blank?
      @bornes = @bornes.where(Arel.sql("TO_NUMBER(bornes.puiss_max, '999999') >= #{params[:puissance].to_i}"))
    end

    respond_to do |format|
      format.html { @bornes = @bornes.page(params[:page]) }
      format.json
    end
  end

  # GET /bornes/1
  # GET /bornes/1.json
  def show
    if @bornes = @borne.nearbys(20)
      @bornes = @bornes.where.not(id_station: @borne.id_station).limit(10)
    end
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
