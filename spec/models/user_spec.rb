require 'rails_helper'

RSpec.describe User, type: :model do

	 describe 'creation' do 
	 	before do
	 		@user = User.create(email:'test@example.com', password:'blah blah', password_confirmation:'blah blah', first_name: 'john', last_name: 'doe')
	 	end
	 	it 'can be created' do 	 		
	 		expect(@user).to be_valid
	 	end

	 	it 'cannot be created without first name and last name' do 
	 		@user.first_name = nil
	 		@user.last_name = nil
	 		expect(@user).to_not be_valid

	 	end
	 end

end
