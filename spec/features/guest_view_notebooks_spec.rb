require "rails_helper"

feature "Guest view notebooks" do
  scenario "guest can only see his notebooks" do
    current_user = User.create email: 'user@example.com', password: '123456'
    user1 = User.create email: 'vasco@gmail.com', password: 'iasdodioas'
    user2 = User.create email: 'migpfernandes@gmail.com', password: 'iasdodioas'

    Notebook.create description: "First Notebook", user: current_user
    Notebook.create description: "Second Notebook", user: user1
    Notebook.create description: "Third Notebook", user: user2

    visit notebooks_path(as: current_user)

    expect(page).to have_text "First Notebook"
    expect(page).not_to have_text "Second Notebook"
    expect(page).not_to have_text "Third Notebook"
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
    user = User.create email: 'user@example.com', password: '123456'
    notebook = Notebook.create description: "First Notebook", user: user
    visit notebooks_path(as: user)

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
