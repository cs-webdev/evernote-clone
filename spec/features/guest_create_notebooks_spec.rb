require 'rails_helper'

feature 'Guest create notebooks' do
	scenario 'from the index' do
		Notebook.create description: 'First Notebook'
		visit root_path

		expect(page).to have_text 'First Notebook'
	end
end
