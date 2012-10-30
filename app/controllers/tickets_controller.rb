class TicketsController < ApplicationController
load_and_authorize_resource :except => [:new]

  # GET /tickets

  # GET /tickets.json
  def index
    if current_user
    @tickets = Ticket.all.accessible_by(current_ability, :index)
    else 
      redirect_to new_user_session_path  and return
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end
  
  # GET /tickets/1
  # GET /tickets/1.json
  def show
   
    @ticket = Ticket.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
 
  
 def edit
      @ticket = Ticket.get(params[:id])
 
 end
 

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:ticket])
    	respond_to do |format|
      	if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
   # @ticket = Ticket.get(params[:id])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.get(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end
end
