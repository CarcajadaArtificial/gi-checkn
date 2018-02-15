class SingleAccessesController < ApplicationController
  before_action :set_single_access, only: [:show, :edit, :update, :destroy]

  # GET /single_accesses
  # GET /single_accesses.json
  def index
    @single_accesses = SingleAccess.all
  end

  # GET /single_accesses/1
  # GET /single_accesses/1.json
  def show
  end

  # GET /single_accesses/new
  def new
    @single_access = SingleAccess.new
  end

  # GET /single_accesses/1/edit
  def edit
  end

  # POST /single_accesses
  # POST /single_accesses.json
  def create
    @single_access = SingleAccess.new(single_access_params)

    respond_to do |format|
      if @single_access.save
        format.html { redirect_to "/events/"+ @single_access.ticket_type.event.urlName + "/manager", notice: 'Single access was successfully created.' }
        format.json { render :show, status: :created, location: @single_access }
      else
        format.html { render :new }
        format.json { render json: @single_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /single_accesses/1
  # PATCH/PUT /single_accesses/1.json
  def update
    respond_to do |format|
      if @single_access.update(single_access_params)
        format.html { redirect_to "/events/"+ @single_access.ticket_type.event.urlName + "/manager", notice: 'Single access was successfully updated.' }
        format.json { render :show, status: :ok, location: @single_access }
      else
        format.html { render :edit }
        format.json { render json: @single_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /single_accesses/1
  # DELETE /single_accesses/1.json
  def destroy
    @single_access.destroy
    respond_to do |format|
      format.html { redirect_to "/events/"+ @single_access.ticket_type.event.urlName + "/manager", notice: 'Single access was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_single_access
      @single_access = SingleAccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def single_access_params
      params.require(:single_access).permit(:ticket_type_id, :activity_id)
    end
end
