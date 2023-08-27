class ShotsController < ApplicationController
  before_action :set_shot, only: %i[ show edit update destroy ]

  # GET /shots or /shots.json
  def index
    @shots = Shot.all
  end

  # GET /shots/1 or /shots/1.json
  def show
    @shot = Shot.find(params[:id])
  end

  # GET /shots/new
  def new
    @shot = Shot.new
  end

  # GET /shots/1/edit
  def edit
    @shot = Shot.find(params[:id])
  end

  # POST /shots or /shots.json
  def create
    @shot = Shot.new(shot_params)
    @shot.image.attach(params[:shot][:image]) # Attach the image here
    if @shot.save
      redirect_to @shot, notice: 'Shot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shots/1 or /shots/1.json
  def update
    if @shot.update(shot_params)
      @shot.image.attach(params[:shot][:image]) # Attach the image here
      redirect_to @shot, notice: 'Shot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shots/1 or /shots/1.json
  def destroy
    @shot.destroy

    respond_to do |format|
      format.html { redirect_to shots_url, notice: "Shot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot
      @shot = Shot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shot_params
      params.require(:shot).permit(:title, :description, :image)
    end
end
