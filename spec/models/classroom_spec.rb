require 'rails_helper'

RSpec.describe Classroom, type: :model do
	let(:school) { FactoryGirl.create(:school) }
	let(:classroom) { FactoryGirl.create(:classroom, :active) }
	let(:no_classroom) { FactoryGirl.create(:classroom, :inactive) }

	describe 'attributes' do
		it { should belong_to :school }
	end

	describe 'validations' do
		it { should validate_presence_of :name}
		it { should validate_presence_of :code}
	end

	describe '#name_code' do 
		it 'returns name and code message' do
  		expect(classroom.classroom_code).to eq("#{classroom.name} has code: #{classroom.code}")
  	end
	end

	describe '#name_active' do
		it 'returns school active if true' do
			expect(classroom.status).to eq('Active')
		end

		it 'returns school not active if false' do
			expect(no_classroom.status).to eq('Not Active')
		end
	end
end
