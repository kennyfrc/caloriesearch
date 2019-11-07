configure :development do
	DataMapper.setup(:default, "postgres://#{ENV['USERNAME']}:#{ENV['PASSWORD']}@localhost//test-calories")
end

configure :production do
	DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://#{ENV['USERNAME']}:#{ENV['PASSWORD']}@localhost//test-calories")
end
