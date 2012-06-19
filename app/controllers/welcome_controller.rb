class WelcomeController < ApplicationController
  skip_before_filter :authorize

  # GET /homepages
  # GET /homepages.json
  def index
  end

end
