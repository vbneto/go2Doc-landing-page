
class DoctorsController < ApplicationController
  def index
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        format.html do
          flash.notice = 'Agradecemos seu cadastro! Ate breve!'
          redirect_to :action => "index"
        end 
        format.json { render json: @doctor, status: :created, location: @doctor }
      else
        format.html { render action: "index" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

end
