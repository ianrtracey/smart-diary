require 'sinatra'
require 'rufus-scheduler'
require 'date'

class SmartDiary < Sinatra::Base

  configure do
    scheduler = Rufus::Scheduler.new
    set :scheduler, scheduler 
  	  ##scheduler.every('2s') do
  	  	##puts "hi"
  	  ##end
 end



end

get '/' do
 	@data = { :date => convert_date("1/13/15"), :messages => ["I: How are you?",
			 "S: Just woke up:] i feel alright",
			 "S: i am so incredibly sorry by the way:[ i dont remember much of what i said but the stuff i do remember makes me cringe. I suck :[",
			 "I: You don't suck. Hhaha trust me it was no problem.",
			 "S: :[ i feel so horrible about last night. Are u okay?",
			 "I: Don't feel horrible, seriously. I am good! Dodged a hangover surprisingly have my shit together today - which is a surprise. Haha",
			 "S: Thats good! I had the worst hangover of my entire life and i pretty sure i barfed like 3 times:[ definitely not my finest",
			 "I: Oh jeez. Well I hope you feel better. Don't you work today?",
			 "S: Yeah. In an hourish. Are u working or just doing ra stuff?",
			 "I: That does not sound like fun, haha. I had a few meetings this morning but I don't have to work today.", 
			 "S: Thats good! you can relax before the hell starts tomorrow haha",
			 "I: Yeah, definitely. Well best of luck today at Starbs, I would not be able to handle it.",
			 "S: thanks! Haha i hoping i can survive"] }
 	haml :index
 end


 def convert_date(date_string)
 	d = Date.strptime(date_string, '%M/%d/%y')
 	return d.strftime("%b %d %Y")
 end
