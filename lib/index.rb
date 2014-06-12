require 'sinatra'

get '/' do
   greeting = "He l, World!"
    erb :index, :locals => {:greeting => greeting} 
end

get '/hello' do
	erb :hello_form
end

post '/hello' do
	greeting = "#{params[:greet] || "Hello"}, #{params[:name] || "Nobody"}"
	erb :index, :locals => {:greeting => greeting} 
end
