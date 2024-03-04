require 'rails_helper'
require 'capybara/rspec'
RSpec.describe "Notebooks", type: :system do
    it "User Log in" do
    
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        expect(page).to have_content ''
    end
    it "creates a new notebook" do
        visit new_article_path
        fill_in "Title", with: "Wanderlust Words"
        sleep(1)
        fill_in "Body", with: " Unearth the mysteries of uncharted territories within
         the pages of this notebook. With meticulously drawn maps and cryptic annotations, 
         it beckons the reader to embark on a cartographer's quest, navigating through realms both real and imagined,
        where the boundaries of the known world dissolve."
        sleep(1)
        select "public", from: "Status"
        sleep(1)
        click_button "Create Article"
        expect(page).to have_content 'New Notebook'
  
    end
    it "updates the notebook article" do
        article = create(:article)
        sleep(1)
        visit edit_article_path(article) 
        fill_in "Title", with: "Wanderlust Words"
        fill_in "Body", with: " Unearth the mysteries of uncharted territories within
         the pages of this notebook. With meticulously drawn maps and cryptic annotations, 
         it beckons the reader to embark on a cartographer's quest, navigating through realms both real and imagined,
        where the boundaries of the known world dissolve."
        sleep(1)
        select "public", from: "Status"
        sleep(1)
        click_button "Update Article"
        sleep(1)
        expect(page).to have_content ''
    end
      
    it "creates a new account" do
        visit new_user_registration_path
        fill_in "First Name", with: "Sarra"
        sleep(1)
        fill_in "Last Name", with: "Sghaier"
        sleep(1)
        fill_in "Email", with: "sarra@gmail.com"
        sleep(1)
        fill_in "Password", with: "azerty12345"
        sleep(1)
        fill_in "Password confirmation", with: "azerty12345"
        sleep(1)
        click_button "Sign up"
        expect(page).to have_content ''
    end

    it "Updates an account" do
        user = FactoryBot.create(:user) 
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        sleep(1)
        visit edit_user_registration_path
        fill_in "Email", with: user.email
        sleep(1)
        fill_in "Password", with: "azerty12345"
        sleep(1)
        fill_in "Password confirmation", with: "azerty12345"
        sleep(1)
        fill_in "Current password", with: user.password
        sleep(1)
        click_button "Update"
        expect(page).to have_content ''
    end

    it "Delete the article" do
        article = create(:article)
        sleep(1)
        visit article_path(article)
        sleep(1)
        find('a', text: 'DELETE').click
    end
    it "Delete an account" do
        user = FactoryBot.create(:user) 
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        sleep(1)
        visit edit_user_registration_path
        sleep(1)
        click_button "Cancel my account"
    end
    it "Create new comment " do
        article = create(:article)
        sleep(1)
        visit article_path(article)
        fill_in "Commenter", with: "Wanderlust Words"
        fill_in "Body", with: " Unearth the mysteries of uncharted territories within
         the pages of this notebook. With meticulously drawn maps and cryptic annotations, 
         it beckons the reader to embark on a cartographer's quest, navigating through realms both real and imagined,
        where the boundaries of the known world dissolve."
        sleep(1)
        select "public", from: "Status"
        sleep(1)
        click_button "Add Comment"
        sleep(1)
        expect(page).to have_content ''
    end
    it " Delete comment " do
        article = create(:article)
        sleep(1)
        visit article_path(article)
        fill_in "Commenter", with: "Wanderlust Words"
        fill_in "Body", with: " Unearth the mysteries of uncharted territories within
         the pages of this notebook. With meticulously drawn maps and cryptic annotations,
         it beckons the reader to embark on a cartographer's quest, navigating through realms both real and imagined,
        where the boundaries of the known world dissolve."
        sleep(1)
        select "public", from: "Status"
        sleep(1)
        click_button "Add Comment"
        sleep(1)
        find('a', text: 'DELETE COMMENT').click
    end
end

