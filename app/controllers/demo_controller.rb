class DemoController < ApplicationController
  
  layout 'application'
  
  
  
  
  def index
  	@array = [1,2,3,4,5]
  end

  def hello
  	#render('demo/index')
  	@array = [1,2,3,4,5]
  	@id = params['id'].to_i
  	@page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def lynda
  	redirect_to("http://lynda.com")
  end

  def data
  	redirect_to("http://pub.data.gov.bc.ca/datasets/174267/hlbc_walkinclinics.txt")
  end

  def text_helpers
  end

  def escape_output
    
  end

  

end
