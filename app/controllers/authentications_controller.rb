class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.json
  def index
    #@authentications = Authentication.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @authentications }
    #end
    @authentications = current_user.authentications if current_user
  end

  # GET /authentications/1
  # GET /authentications/1.json
  def show
    @authentication = Authentication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @authentication }
    end
  end

  # GET /authentications/new
  # GET /authentications/new.json
  def new
    @authentication = Authentication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @authentication }
    end
  end

  # GET /authentications/1/edit
  def edit
    @authentication = Authentication.find(params[:id])
  end

  # POST /authentications
  # POST /authentications.json
  def create
    auth = request.env["rack.auth"]
    current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
  
    redirect_to authentications_url
    
    #@authentication = Authentication.new(params[:authentication])

    #respond_to do |format|
    #  if @authentication.save
    #    format.html { redirect_to @authentication, notice: 'Authentication was successfully created.' }
    #    format.json { render json: @authentication, status: :created, location: @authentication }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @authentication.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PUT /authentications/1
  # PUT /authentications/1.json
  def update
    @authentication = Authentication.find(params[:id])

    respond_to do |format|
      if @authentication.update_attributes(params[:authentication])
        format.html { redirect_to @authentication, notice: 'Authentication was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
     @authentication = current_user.authentications.find(params[:id])
      @authentication.destroy
  
    redirect_to authentications_url
    #@authentication = Authentication.find(params[:id])
    #@authentication.destroy

    #respond_to do |format|
    #  format.html { redirect_to authentications_url }
    #  format.json { head :ok }
    #end
  end
  
  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
