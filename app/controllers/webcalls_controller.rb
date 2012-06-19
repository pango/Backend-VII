class WebcallsController < ApplicationController
  skip_before_filter :authorize
  
  # GET /webcontrollers
  # GET /webcontrollers.json
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usagerecords }
    end
  end

  
end
