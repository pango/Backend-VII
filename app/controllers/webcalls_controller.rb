class WebcallsController < ApplicationController
  # GET /webcontrollers
  # GET /webcontrollers.json
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usagerecords }
    end
  end

  
end
