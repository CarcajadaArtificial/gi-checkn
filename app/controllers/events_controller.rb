class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

                                                # ======================================================
                                                # Method: show
                                                # URL: checkn.mx/events/:Urlname
                                                # Alias: event_home
                                                # Description: Display all the information of an event.
  def show
    @event = Event.find(params[:id])
    @activities_by_day = @event.activities_by_day
  end
                                                # ======================================================
                                                # Method: preregister
                                                # URL: checkn.mx/events/:Urlname/preregister
                                                # Alias: preregister
                                                # Description: Updates the information of an assistant,
                                                #   identified by the ticket's reference.
  def preregister
    @event = Event.find(params[:id])
    @ticket = Ticket.find_by!(reference: params[:reference])
    
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
    @selected_ticket_type
    @event = Event.find(params[:id])
    @ticket_types = @event.available_ticket_types
    puts @ticket_types.first.name
    @ticket = Ticket.new
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
    @event = Event.find(params[:id])
    if params[:activity]
      @activity = Activity.find(params[:activity])
    else
      @activity = Activity.new
    end
    if params[:ticket_type]
      @ticket_type = TicketType.find(params[:ticket_type])
    else
      @ticket_type = TicketType.new
    end
    if params[:single_access]
      @single_access = SingleAccess.find(params[:single_access])
    else
      @single_access = SingleAccess.new
    end
    if params[:multiple_access]
      @multiple_access = MultipleAccess.find(params[:multiple_access])
    else
      @multiple_access = MultipleAccess.new
    end
    if params[:question]
      @question = Question.find(params[:question])
    else
      @question = Question.new
    end
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
        format.html { redirect_to action: "show", controller: "events", id: @event.id, notice: 'Event was successfully created.' }
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
      # Aguas con el redirect_to
      format.html { redirect_back fallback_location: root_path, notice: "Elemento borrado" }
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
      params.require(:event).permit(:name, :description, :urlName, :startDate, :endDate, :imageUrl, :mainColor, :color2, :locationCode, :activity_id)
    end
end
