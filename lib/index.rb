require 'sinatra'
require 'i18n'
require 'i18n/backend/fallbacks'

configure do
  I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
 I18n.load_path = Dir[File.join(settings.root, 'locales', '*.yml')]
  I18n.backend.load_translations
  I18n.default_locale = :en
end

get '/' do
    pics = Dir.entries(File.dirname(__FILE__) + "/public/images/thumbs").select {|f| !File.directory? f}
    erb :index, :locals => {:pics => pics} 
end

post '/contact' do
	contact =  params[:contact]
	puts contact['name']
	redirect '/#/contact'
end

post '/locale' do 
	I18n.locale = params[:locale] || I18n.default_locale
	redirect '/'
end