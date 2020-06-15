class SkiresortsController < ApplicationController
  before_action :set_skiresort, only: [:show, :edit, :update, :destroy]

  # GET /skiresorts
  # GET /skiresorts.json
  def index
    @skiresorts = Skiresort.all
  end

  # GET /skiresorts/1
  # GET /skiresorts/1.json
  def show
  end

  # GET /skiresorts/new
  def new
    @skiresort = Skiresort.new
  end

  # GET /skiresorts/1/edit
  def edit
  end

  # POST /skiresorts
  # POST /skiresorts.json
  def create
    @skiresort = Skiresort.new(skiresort_params)

    respond_to do |format|
      if @skiresort.save
        format.html { redirect_to @skiresort, notice: 'Skiresort was successfully created.' }
        format.json { render :show, status: :created, location: @skiresort }
      else
        format.html { render :new }
        format.json { render json: @skiresort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skiresorts/1
  # PATCH/PUT /skiresorts/1.json
  def update
    respond_to do |format|
      if @skiresort.update(skiresort_params)
        format.html { redirect_to @skiresort, notice: 'Skiresort was successfully updated.' }
        format.json { render :show, status: :ok, location: @skiresort }
      else
        format.html { render :edit }
        format.json { render json: @skiresort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skiresorts/1
  # DELETE /skiresorts/1.json
  def destroy
    @skiresort.destroy
    respond_to do |format|
      format.html { redirect_to skiresorts_url, notice: 'Skiresort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skiresort
      @skiresort = Skiresort.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skiresort_params
      params.require(:skiresort).permit(:name, :ancestry, :address, :latitude, :longitude)
    end
end
