require 'rubygems'
require 'sinatra'
require 'rufus-scheduler'
require 'date'
require 'twilio-ruby'




class SmartDiary < Sinatra::Base

  # configure do
  # conn = Mongo::Client.new([ '192.168.56.102:27017' ], :database => 'convoos')
  # set :mongo_connection, conn
  # set :mongo_db, conn.db('test')
  # end

    scheduler = Rufus::Scheduler.new
  	  scheduler.every('2s') do
  	  	puts "hi"
 	 end
 	 scheduler.join



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


def send_text
account_sid = "AC955cb60855da35fcec4d03be5c4b2a3f"
auth_token = "fbd863919c6ed0dc51686e05845916f4"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+16235006454" # Your Twilio number
 
friends = {
"+16238662766" => "Ian Tracey",
"+14155557775" => "Boots",
"+14155551234" => "Virgil"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end
end