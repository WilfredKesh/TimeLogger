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
	
end