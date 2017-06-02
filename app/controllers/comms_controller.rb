class CommsController < ApplicationController
  before_action :set_comm, only: [:show, :edit, :update, :destroy]

  # GET /comms
  # GET /comms.json
  def index
    @comms = Comm.all
  end

  # GET /comms/1
  # GET /comms/1.json
  def show
  end

  # GET /comms/new
  def new
    @comm = Comm.new
  end

  # GET /comms/1/edit
  def edit
  end

  # POST /comms
  # POST /comms.json
  def create
    @comm = Comm.new(comm_params)

    respond_to do |format|
      if @comm.save
        format.html { redirect_to @comm, notice: 'Comm was successfully created.' }
        format.json { render :show, status: :created, location: @comm }
      else
        format.html { render :new }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comms/1
  # PATCH/PUT /comms/1.json
  def update
    respond_to do |format|
      if @comm.update(comm_params)
        format.html { redirect_to @comm, notice: 'Comm was successfully updated.' }
        format.json { render :show, status: :ok, location: @comm }
      else
        format.html { render :edit }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comms/1
  # DELETE /comms/1.json
  def destroy
    @comm.destroy
    respond_to do |format|
      format.html { redirect_to comms_url, notice: 'Comm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comm
      @comm = Comm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comm_params
      params.require(:comm).permit(:content, :user_id, :micropost_id)
    end
end
