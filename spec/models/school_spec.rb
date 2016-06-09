require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'validations' do
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :year_built }
  	it { should validate_presence_of :rating }
  end

  describe '#name_year_built' do
  	it 'returns name and year_built message' do
  		school = School.create(	name: 'Devpoint labs',
  														year_built: '1990',
  														rating: 10	)
  		expect(school.name_year_built).to eq("#{school.name} is built in: #{school.year_built}")
  	end
  end

  describe "#school_rating" do
  	it "returns not good if school rating is < 6 " do
  		school = School.create(	name: 'Dev Mountain',
  														year_built: '1990',
  														rating: 4	)
  		expect(school.school_rating).to eq('Not a good school')
  	end

  	it "returns not good if school rating is == 6 " do
  		school = School.create(	name: 'Dev Mountain',
  														year_built: '1990',
  														rating: 6	)
  		expect(school.school_rating).to eq('Not a good school')
  	end

  	it "returns good if school rating is == 10 " do
  		school = School.create(	name: 'Dev Point Labs',
  														year_built: '1990',
  														rating: 10	)
  		expect(school.school_rating).to eq('Good school')
  	end

  	it "returns good if school rating is < 10 " do
  		school = School.create(	name: 'Devpoint Labs',
  														year_built: '1990',
  														rating: 7	)
  		expect(school.school_rating).to eq('Good school')
  	end

  	it "returns school rating ranges from 1 to 10 if school rating is > 10 " do
  		school = School.create(	name: 'Dev Mountain',
  														year_built: '1990',
  														rating: 12	)
  		expect(school.school_rating).to eq('School Rating ranges from 1 to 10')
  	end
  end
end
