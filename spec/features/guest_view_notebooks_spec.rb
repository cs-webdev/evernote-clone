require "rails_helper"

feature "Guest view notebooks" do
  scenario "guest can only see his notebooks" do
    
    current_user = create(:user)
    user1 = create(:user)

    notebook1 = create(:notebook, user: current_user)
    notebook2 = create(:notebook, user: user1)

    visit notebooks_path(as: current_user)

    expect(page).to have_text notebook1.description
    expect(page).not_to have_text notebook2.description
  end

  scenario "view notebook" do   
    user = create(:user)
    notebook = create(:notebook, user: user)
    visit notebook_path(notebook, as: user)

    expect(page).to have_text notebook.description
  end

  scenario "create notebook" do
    user = create(:user)
    notebook = build(:notebook, user: user)

    visit new_notebook_path(as: user)

    within "form" do
      fill_in "Description", with: notebook.description

      click_on "Create Notebook"
    end
    expect(page).to have_text notebook.description
  end

  scenario "delete notebook" do
    user = User.create email: 'user@example.com', password: '123456'
    notebook = Notebook.create description: "First Notebook", user: user
    visit notebooks_path(as: user)

    click_on "Delete"

    expect(page).not_to have_text("First Notebook")
  end

  scenario "edit notebook" do
    user = create(:user)
    notebook = create(:notebook, user: user)

    visit edit_notebook_path(notebook, as: user)

    within "form" do
      fill_in "Description", with: "xpto"

      click_on "Update Notebook"
    end

    expect(page).not_to have_text(notebook.description)
    expect(page).to have_text("xpto")
  end
end
