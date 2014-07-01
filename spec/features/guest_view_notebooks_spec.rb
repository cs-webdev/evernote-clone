require "rails_helper"

feature "Guest view notebooks" do
  scenario "view all notebooks" do
    Notebook.create description: "First Notebook"
    Notebook.create description: "Second Notebook"

    visit notebooks_path

    expect(page).to have_text "First Notebook"
    expect(page).to have_text "Second Notebook"
  end

  scenario "guest can only see his notebooks" do
    user1 = User.create email: 'vasco@gmail.com', password: 'iasdodioas'
    user2 = User.create email: 'migpfernandes@gmail.com', password: 'iasdodioas'

    Notebook.create description: "First Notebook" user: user1
    Notebook.create description: "Second Notebook" user: user2

    visit sign_in_path

    within 'form' do
      fill_in 'Email', with: user1.email
      fill_in 'Password', with: 'iasdodioas'

      click_on 'Sign in'
    end

    expect(page).to have_text "First Notebook"
    expect(page).not_to have_text "Second Notebook"
  end

  scenario "view notebook" do
    notebook = Notebook.create description: "First Notebook"
    Notebook.create description: "Second Notebook"

    visit notebook_path(notebook)

    expect(page).to have_text "First Notebook"
    expect(page).not_to have_text "Second Notebook"
  end

  scenario "create notebook" do
    visit new_notebook_path

    within "form" do
      fill_in "Description", with: "xpto"

      click_on "Create Notebook"
    end
    expect(page).to have_text "xpto"
  end

  scenario "delete notebook" do
    notebook = Notebook.create description: "First Notebook"
    visit notebooks_path

    click_on "Delete"

    expect(page).not_to have_text("First Notebook")
  end

  scenario "edit notebook" do
    notebook = Notebook.create description: "First Notebook"
    visit edit_notebook_path(notebook)

    within "form" do
      fill_in "Description", with: "xpto"

      click_on "Update Notebook"
    end

    expect(page).not_to have_text("First Notebook")
    expect(page).to have_text("xpto")
  end
end
