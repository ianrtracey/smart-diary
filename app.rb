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
