class PagesController < ApplicationController
  skip_before_filter :authorize

  # GET /homepages
  # GET /homepages.json
  def index
    @page_charts = Usagerecord.select("homepage, count(id) as requests" ).group("homepage")

    #Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")

    #SELECT date(created_at) as ordered_date, sum(price) as total_price FROM orders GROUP BY date(created_at)

    #select browser, count(id) from usagerecords group by browser

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page_charts }
    end
	
  end

end
