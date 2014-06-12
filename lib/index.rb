require 'sinatra'

get '/' do
   pics = Dir.entries(File.dirname(__FILE__) + "/public/images/thumbs").select {|f| !File.directory? f}
    erb :index, :locals => {:pics => pics} 
end

post '/contact' do
	contact =  params[:contact]
	puts contact['name']
	redirect '/#/contact'
end
