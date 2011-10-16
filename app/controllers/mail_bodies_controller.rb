class MailBodiesController < ApplicationController
  # GET /mail_bodies
  # GET /mail_bodies.json
  def index
    @mail_bodies = MailBody.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mail_bodies }
    end
  end

  # GET /mail_bodies/1
  # GET /mail_bodies/1.json
  def show
    @mail_body = MailBody.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mail_body }
    end
  end

  # GET /mail_bodies/new
  # GET /mail_bodies/new.json
  def new
    @mail_body = MailBody.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail_body }
    end
  end

  # GET /mail_bodies/1/edit
  def edit
    @mail_body = MailBody.find(params[:id])
  end

  # POST /mail_bodies
  # POST /mail_bodies.json
  def create
    @mail_body = MailBody.new(params[:mail_body])

    respond_to do |format|
      if @mail_body.save
        format.html { redirect_to @mail_body, notice: 'Mail body was successfully created.' }
        format.json { render json: @mail_body, status: :created, location: @mail_body }
      else
        format.html { render action: "new" }
        format.json { render json: @mail_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mail_bodies/1
  # PUT /mail_bodies/1.json
  def update
    @mail_body = MailBody.find(params[:id])

    respond_to do |format|
      if @mail_body.update_attributes(params[:mail_body])
        format.html { redirect_to @mail_body, notice: 'Mail body was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @mail_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_bodies/1
  # DELETE /mail_bodies/1.json
  def destroy
    @mail_body = MailBody.find(params[:id])
    @mail_body.destroy

    respond_to do |format|
      format.html { redirect_to mail_bodies_url }
      format.json { head :ok }
    end
  end
  def send_mail
#    @users = User.all
    #@mail_body = MailBody.find(params[:id])
    @mail_body = MailBody.find(params[:id])
#    @mail_body.body = my_format(@mail_body.body)
    @mail_body.flag = 1
    if @mail_body.save
      @users = User.all
      @users.each do |user|
        UserMailer.welcome_email(user,@mail_body).deliver
      end
    end
    respond_to do |format|
      format.html { redirect_to mail_bodies_url }
      format.json { head :ok }
    end
  end
  def my_format(text)
    text.gsub(/(\r\n)|(\n)/, '<br />')
  end

end
