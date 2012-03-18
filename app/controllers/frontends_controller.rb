class FrontendsController < ApplicationController
  # GET /homepages
  # GET /homepages.json
  def index
    @browser_charts = Usagerecord.select("browser, count(id) as requests" ).group("browser")

    #Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")

    #SELECT date(created_at) as ordered_date, sum(price) as total_price FROM orders GROUP BY date(created_at)

    #select browser, count(id) from usagerecords group by browser

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @browser_charts }
    end
	
  end

end
