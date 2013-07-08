class TourdatesController < ApplicationController
  before_action :set_tourdate, only: [:show, :edit, :update, :destroy]

  # GET /tourdates
  # GET /tourdates.json
  def index
    @tourdates = Tourdate.all
  end

  # GET /tourdates/1
  # GET /tourdates/1.json
  def show
  end

  # GET /tourdates/new
  def new
    @tourdate = Tourdate.new
  end

  # GET /tourdates/1/edit
  def edit
  end

  # POST /tourdates
  # POST /tourdates.json
  def create
    @tourdate = Tourdate.new(tourdate_params)

    respond_to do |format|
      if @tourdate.save
        format.html { redirect_to @tourdate, notice: 'Tourdate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tourdate }
      else
        format.html { render action: 'new' }
        format.json { render json: @tourdate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tourdates/1
  # PATCH/PUT /tourdates/1.json
  def update
    respond_to do |format|
      if @tourdate.update(tourdate_params)
        format.html { redirect_to @tourdate, notice: 'Tourdate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tourdate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tourdates/1
  # DELETE /tourdates/1.json
  def destroy
    @tourdate.destroy
    respond_to do |format|
      format.html { redirect_to tourdates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tourdate
      @tourdate = Tourdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tourdate_params
      params.require(:tourdate).permit(:startdate)
    end
end
