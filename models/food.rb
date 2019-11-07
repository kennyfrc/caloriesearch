class Food
	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :calories, Integer
	property :weight, Integer
end

def calorie_check(url)
	response = HTTParty.get(url, format: :plain)
	json = JSON.parse(response, symbolize_names: true)
	json[:calories]
end

def weight_check(url)
	response = HTTParty.get(url, format: :plain)
	json = JSON.parse(response, symbolize_names: true)
	json[:totalWeight]
end

def broccoli_check()
	url = "https://api.edamam.com/api/nutrition-data?app_id=#{ENV['APP_ID']}&app_key=#{ENV['API_KEY']}&ingr=1%20broccoli"
	response = HTTParty.get(url, format: :plain)
	json = JSON.parse(response, symbolize_names: true)
	{:calories => json[:calories], :weight => json[:totalWeight]}
end

DataMapper.finalize
# DataMapper.auto_migrate! # clears out the db
DataMapper.auto_upgrade!