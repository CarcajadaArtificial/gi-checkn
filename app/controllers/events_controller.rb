class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

                                                # ======================================================
                                                # Method: show
                                                # URL: checkn.mx/events/:Urlname
                                                # Alias: event_home
                                                # Description: Display all the information of an event.
  def show
  end
                                                # ======================================================
                                                # Method: preregister
                                                # URL: checkn.mx/events/:Urlname/preregister
                                                # Alias: preregister
                                                # Description: Updates the information of an assistant,
                                                #   identified by the ticket's reference.
  def preregister
  end
                                                # ======================================================
                                                # Method: checkout
                                                # URL: checkn.mx/events/:Urlname/checkout
                                                # Alias: checkout
                                                # Description: Screen that displays the ticket's barcode
                                                #   and instructions.
  def checkout
  end
                                                # ======================================================
                                                # Method: register
                                                # URL: checkn.mx/events/:Urlname/register
                                                # Alias: register
                                                # Description: Manages the attendance at the time of the
                                                #   event. Might be registering for the event in general
                                                #   or for an activity in particular.
  def register
  end
                                                # ======================================================
                                                # Method: sale
                                                # URL: checkn.mx/events/:Urlname/sale
                                                # Alias: sale
                                                # Description: Helps the staff sell tickets. Assignes
                                                #   email and full name to a particular ticket.
  def sale
  end
                                                # ======================================================
                                                # Method: new
                                                # URL: checkn.mx/events/new
                                                # Alias: event_new
                                                # Description: Manages the attendance at the time of the
                                                #   event. Might be registering for the event in general
                                                #   or for an activity in particular.
  def new
    @event = Event.new
  end
                                                # ======================================================
                                                # Method: dashboard
                                                # URL: checkn.mx/events/:Urlname/dashboard
                                                # Alias: dashboard
                                                # Description: Displays generally useful information of
                                                #   the event.
  def dashboard
  end
                                                # ======================================================
                                                # Method: manager
                                                # URL: checkn.mx/events/:Urlname/manager
                                                # Alias: manager
                                                # Description: Manages the elements (ticket types,
                                                #   questions, activities and activity types) of an
                                                #   event.
  def manager
  end
                                                # ======================================================
                                                # Method: edit
                                                # URL: checkn.mx/events/:Urlname/edit
                                                # Alias: event_edit
                                                # Description: Edits the general event information
  def edit
  end
                                                # ======================================================
                                                # Method: staff
                                                # URL: checkn.mx/events/:Urlname/staff
                                                # Alias: staff
                                                # Description: Manages the staff and permissions.
  def staff
  end
                                                # ======================================================
                                                # Method: database
                                                # URL: checkn.mx/events/:Urlname/database
                                                # Alias: database
                                                # Description: Filters, displays and groups the whole
                                                #   database of tickets.
  def database
  end

                                                # EVENT SCAFFOLD METHODS
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :urlName, :startDate, :endDate, :imageUrl, :mainColor, :color2, :locationCode)
    end
end
