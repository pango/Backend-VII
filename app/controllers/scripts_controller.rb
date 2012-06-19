class ScriptsController < ApplicationController
  skip_before_filter :authorize
  
  def show
    @script = File.read('/assets/collect-usage-data.js')
  end

  def download
    send_file('/assets/collect-usage-data.js')
  end

end
