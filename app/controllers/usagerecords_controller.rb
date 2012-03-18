class UsagerecordsController < ApplicationController
  # GET /usagerecords
  # GET /usagerecords.json
  def index
    @usagerecords = Usagerecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usagerecords }
    end
  end

  def get_browser_charts
    @browser_charts = Usagerecord.select("browser, count(id) as requests" ).group("browser")

    #Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")

    #SELECT date(created_at) as ordered_date, sum(price) as total_price FROM orders GROUP BY date(created_at)

    #select browser, count(id) from usagerecords group by browser

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @browser_charts }
    end
  end


  # GET /usagerecords/1
  # GET /usagerecords/1.json
  def show
    @usagerecord = Usagerecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usagerecord }
    end
  end

  # GET /usagerecords/new
  # GET /usagerecords/new.json
  def new
    @usagerecord = Usagerecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usagerecord }
    end
  end

  # GET /usagerecords/1/edit
  def edit
    @usagerecord = Usagerecord.find(params[:id])
  end

  # POST /usagerecords
  # POST /usagerecords.json
  def create
    @usagerecord = Usagerecord.new(params[:usagerecord])

    respond_to do |format|
      if @usagerecord.save
        format.html { redirect_to @usagerecord, notice: 'Usagerecord was successfully created.' }
        format.json { render json: @usagerecord, status: :created, location: @usagerecord }
      else
        format.html { render action: "new" }
        format.json { render json: @usagerecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usagerecords/1
  # PUT /usagerecords/1.json
  def update
    @usagerecord = Usagerecord.find(params[:id])

    respond_to do |format|
      if @usagerecord.update_attributes(params[:usagerecord])
        format.html { redirect_to @usagerecord, notice: 'Usagerecord was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @usagerecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usagerecords/1
  # DELETE /usagerecords/1.json
  def destroy
    @usagerecord = Usagerecord.find(params[:id])
    @usagerecord.destroy

    respond_to do |format|
      format.html { redirect_to usagerecords_url }
      format.json { head :ok }
    end
  end
end
