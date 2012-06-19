class TimelinesController < ApplicationController
  skip_before_filter :authorize
  # GET /homepages
  # GET /homepages.json
  def index
    @timeline_charts = Usagerecord.select("DATE_FORMAT(timestamp, '%d.%m.%Y') as datum, count(id) as requests" ).group("datum")
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timeline_charts }
    end
	
  end

end
