require 'rails_helper'

feature 'access to account page' do
  scenario 'guest goes to account page' do
    visit account_path

    expect(page).to have_content('not authorize')
  end

  scenario 'user goes to his account page' do
    user = create(:user)

    visit account_path(as: user)
    expect(page).to have_content('Your Account')
  end
end

feature 'account edition' do
  before :each do
    @user = create(:user)
  end

  scenario 'user deletes his account' do
    visit account_path(as: @user)
    click_link 'delete_account_link'

    expect(page).to have_content('You deleted your account successfuly.')
  end

  scenario 'user edits his name successfuly' do
    visit account_path(as: @user)

    click_link 'edit_username_link'
    within 'form' do
      fill_in 'username', with: 'pegasus'
      click_button 'save'
    end

    expect(page).to have_content('pegasus' && 'You edited your username successfuly')
  end

  scenario 'user inputs to long username' do
    visit edit_username_path(as: @user)

    within 'form' do 
      fill_in 'username', with: Faker::Internet.user_name(41)
      click_button 'save'
    end

    expect(page).to have_content('error' && 'must have at most')
  end
end

