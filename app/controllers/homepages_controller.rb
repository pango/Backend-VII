class HomepagesController < ApplicationController
  skip_before_filter :authorize

  # GET /homepages
  # GET /homepages.json
  def index
    @homepages = Homepage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homepages }
    end
  end

  # GET /homepages/1
  # GET /homepages/1.json
  def show
    @homepage = Homepage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @homepage }
    end
  end

  # GET /homepages/new
  # GET /homepages/new.json
  def new
    @homepage = Homepage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @homepage }
    end
  end

  # GET /homepages/1/edit
  def edit
    @homepage = Homepage.find(params[:id])
  end

  # POST /homepages
  # POST /homepages.json
  def create
    @homepage = Homepage.new(params[:homepage])

    respond_to do |format|
      if @homepage.save
        format.html { redirect_to @homepage, notice: 'Homepage was successfully created.' }
        format.json { render json: @homepage, status: :created, location: @homepage }
      else
        format.html { render action: "new" }
        format.json { render json: @homepage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /homepages/1
  # PUT /homepages/1.json
  def update
    @homepage = Homepage.find(params[:id])

    respond_to do |format|
      if @homepage.update_attributes(params[:homepage])
        format.html { redirect_to @homepage, notice: 'Homepage was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @homepage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homepages/1
  # DELETE /homepages/1.json
  def destroy
    @homepage = Homepage.find(params[:id])
    @homepage.destroy

    respond_to do |format|
      format.html { redirect_to homepages_url }
      format.json { head :ok }
    end
  end
end
