class RoomsController < ApplicationController
  before_action :authenticate_job_offerer!
  before_action :authenticate_job_seeker!
  
  def show
    @messages = Message.all
  end
end
