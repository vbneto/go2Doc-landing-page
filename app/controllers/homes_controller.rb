class HomesController < ApplicationController
  def index
    @home = Home.new
  end

  def create
    @home = Home.new(params[:home])

    respond_to do |format|
      if @home.save
        format.html do
          flash.notice = 'Agradecemos seu cadastro! Ate breve!'
          redirect_to :action => "index"
        end 
        format.json { render json: @home, status: :created, location: @home }
      else
        format.html { render action: "index" }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

end
