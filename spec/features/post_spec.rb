require 'rails_helper'

describe 'navigate' do
	describe 'posts index ' do
		it 'can be reached succesfully ' do 
			visit posts_path
			expect(page.status_code).to eq(200)
		end
		it 'should have title of posts ' do 
			visit posts_path
			expect(page).to have_content(/Posts/)
		end


	end
	describe 'creation' do 
		before do
			user = User.create(email:'test@example.com', password:'blah blah', password_confirmation:'blah blah', first_name: 'john', last_name: 'doe')
			login_as(user, :scope => :user)
			visit new_post_path
		end
		it 'has a new form' do			
			expect(page.status_code).to eq(200)
		end
		it 'can be created from a new form' do		
			fill_in 'post[date]', with: Date.today 
			fill_in 'post[rationale]', with: "something" 

			click_on "save"

			expect(page).to have_content("something")
		end

		it 'will have a user associated with it' do
			fill_in 'post[date]', with: Date.today 
			fill_in 'post[rationale]', with: "User Association" 

			click_on "save"

			expect(User.last.posts.last.rationale).to eq("User Association")


		end

	end
	
end