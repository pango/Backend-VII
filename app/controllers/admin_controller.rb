class AdminController < ApplicationController
  def index
    @total_usagerecords = Usagerecord.count
  end

end
