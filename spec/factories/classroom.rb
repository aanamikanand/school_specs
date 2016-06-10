FactoryGirl.define do
	factory :classroom, class: Classroom do
		name 'Ruby on rails'
		code 'ROR'
		

		trait :active do
			active true
		end

		trait :inactive do
			active false
		end
		school
	end
end