require 'sinatra'
require 'rufus-scheduler'

class SmartDiary < Sinatra::Base

  configure do
    scheduler = Rufus::Scheduler.new
    set :scheduler, scheduler 
  	  scheduler.every('2s') do
  	  	puts "hi"
  	  end
 end

end