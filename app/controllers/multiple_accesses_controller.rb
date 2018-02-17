class MultipleAccessesController < ApplicationController
  before_action :set_multiple_access, only: [:show, :edit, :update, :destroy]

  # GET /multiple_accesses
  # GET /multiple_accesses.json
  # def index
  #   @multiple_accesses = MultipleAccess.all
  # end
  #
  # # GET /multiple_accesses/1
  # # GET /multiple_accesses/1.json
  # def show
  # end
  #
  # # GET /multiple_accesses/new
  # def new
  #   @multiple_access = MultipleAccess.new
  # end
  #
  # # GET /multiple_accesses/1/edit
  # def edit
  # end

  # POST /multiple_accesses
  # POST /multiple_accesses.json
  def create
    @multiple_access = MultipleAccess.new(multiple_access_params)

    respond_to do |format|
      if @multiple_access.save
        format.html { redirect_to "/events/"+ @multiple_access.ticket_type.event.urlName + "/manager", notice: 'Multiple access was successfully created.' }
        format.json { render :show, status: :created, location: @multiple_access }
      else
        format.html { render :new }
        format.json { render json: @multiple_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multiple_accesses/1
  # PATCH/PUT /multiple_accesses/1.json
  def update
    respond_to do |format|
      if @multiple_access.update(multiple_access_params)
        format.html { redirect_to "/events/"+ @multiple_access.ticket_type.event.urlName + "/manager", notice: 'Multiple access was successfully updated.' }
        format.json { render :show, status: :ok, location: @multiple_access }
      else
        format.html { render :edit }
        format.json { render json: @multiple_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multiple_accesses/1
  # DELETE /multiple_accesses/1.json
  def destroy
    @multiple_access.destroy
    respond_to do |format|
      format.html { redirect_to "/events/"+ @multiple_access.ticket_type.event.urlName + "/manager", notice: 'Multiple access was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiple_access
      @multiple_access = MultipleAccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multiple_access_params
      params.require(:multiple_access).permit(:amount, :ticket_type_id, :activity_type_id)
    end
end
