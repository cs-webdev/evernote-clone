require 'rails_helper'

feature 'User signs in' do
  scenario 'success login' do
    user = create(:user)
    visit sign_in_path

    within 'form' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Sign in'
    end

    expect(page).to have_content "Welcome, #{user.username} "
  end 
end

feature 'Account creation' do
  scenario 'Guest creates account with username' do
    user = build(:user)
    visit sign_up_path

    within 'form' do
      fill_in 'Email', with: user.email
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password

      click_on 'Sign up'
    end

    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'Guest creates account without username' do
    user = build(:user, username: '')
    visit sign_up_path

    within 'form' do 
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Sign up'
    end

    expect(page).to have_content "Welcome, #{user.email}"
    visit account_path
    expect(page).to have_content "not defined"
  end

end