FactoryGirl.define do 
	factory :user do
		name 										"Sebastian Prokesch"
		email 									"prokesch@irt.de"
		password								"foobar"
		password_confirmation 	"foobar"
	end
end