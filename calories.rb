require 'sinatra'
require 'data_mapper'
require 'bundler/setup'
require 'httparty'
require_relative 'models/config'
require_relative 'models/food'
require 'dotenv'
Dotenv.load('.env')

API_KEY = ENV['API_KEY']
APP_ID = ENV['APP_ID']



get '/' do
	erb :index
end

get '/new' do
	erb :new
end

get '/food-list/:id' do
	@food = Food.get(params[:id])
	erb :show
end

post '/new' do
	url = "https://api.edamam.com/api/nutrition-data?app_id=#{ENV['APP_ID']}&app_key=#{ENV['API_KEY']}&ingr=1%20#{params[:name]}"
	@food = Food.create(:name => params[:name], :calories => calorie_check(url), :weight => weight_check(url))
	redirect "/food-list/#{@food.id}"
end