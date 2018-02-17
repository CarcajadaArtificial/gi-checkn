class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # # GET /tickets
  # # GET /tickets.json
  # def index
  #   @tickets = Ticket.all
  # end
  #
  #
  # GET /tickets/1
  # GET /tickets/1.json
  # def show
  # end
  #
  # # GET /tickets/new
  # def new
  #   @ticket = Ticket.new
  # end
  #
  # # GET /tickets/1/edit
  # def edit
  # end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    event = @ticket.ticket_type.event
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to action: "sale", controller: "events", id: event.id, reference: @ticket.reference }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { redirect_to action: "sale", controller: "events", id: event.id }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        case @ticket.status
        when "new"
          @ticket.status = "sold"
          @ticket.rollNumber = @ticket.create_rollNumber
          @ticket.save
          TicketMailer.sale_email(@ticket).deliver_later
          format.html { redirect_to action: "sale", controller: "events", id: @ticket.ticket_type.event.id, reference: @ticket.reference }
        when "sold"
          @ticket.status = "preregistered"
          @ticket.save
          TicketMailer.preregister_email(@ticket).deliver_later
          format.html { redirect_to action: "checkout", controller: "events", id: @ticket.ticket_type.event.id, reference: @ticket.reference }
        end
      else
        format.html { redirect_to action: "preregister", controller: "events", id: @ticket.ticket_type.event.urlName, reference: @ticket.reference }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:fullName, :email, :sex, :state, :ticket_type_id, activity_ids:[])
    end
end
