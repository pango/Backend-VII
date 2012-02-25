class FooController < ApplicationController

  def getdata
    @data = request.parameters
    @foo = @data['foo']
    @bar = @data['bar']
    render :action=> 'showdata'
  end

end

