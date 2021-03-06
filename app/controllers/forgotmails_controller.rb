require "mailgun"

class ForgotmailsController < ApplicationController
  before_action :set_forgotmail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /forgotmails
  # GET /forgotmails.json
  def index
    @forgotmails = Forgotmail.all
  end

  # GET /forgotmails/1
  # GET /forgotmails/1.json
  def show
  end

  # GET /forgotmails/new
  def new
    @forgotmail = Forgotmail.new
  end

  # GET /forgotmails/1/edit
  def edit
  end

  # POST /forgotmails
  # POST /forgotmails.json
  def create
    @user = current_user;
    @forgotmail = Forgotmail.new(forgotmail_params)
    
    Usermailer.welcome_email(@user, @forgotmail.sender, @forgotmail.reciever, @forgotmail.title, @forgotmail.content).deliver_now

    respond_to do |format|
      if @forgotmail.save
        format.html { redirect_to @forgotmail, notice: 'Forgotmail was successfully created.' }
        format.json { render :show, status: :created, location: @forgotmail }
      else
        format.html { render :new }
        format.json { render json: @forgotmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forgotmails/1
  # PATCH/PUT /forgotmails/1.json
  def update
    respond_to do |format|
      if @forgotmail.update(forgotmail_params)
        format.html { redirect_to @forgotmail, notice: 'Forgotmail was successfully updated.' }
        format.json { render :show, status: :ok, location: @forgotmail }
      else
        format.html { render :edit }
        format.json { render json: @forgotmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forgotmails/1
  # DELETE /forgotmails/1.json
  def destroy
    @forgotmail.destroy
    respond_to do |format|
      format.html { redirect_to forgotmails_url, notice: 'Forgotmail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forgotmail
      @forgotmail = Forgotmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forgotmail_params
      params.require(:forgotmail).permit(:sender, :reciever, :title, :content)
    end
end
