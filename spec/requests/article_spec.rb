require 'rails_helper'
RSpec.describe Article, type: :model do
    it "is valid with valid attributes" do
      article = Article.new(title: "notebook",
      body: "notebook notebook notebook" ,
      status:"public")
      expect(article).to be_valid
    end
    it "is not valid without a title" do
      article = Article.new(body: "notebook notebook notebook",status:"public")
      expect(article).to_not be_valid
    end
    it "is not valid without a body" do
      article = Article.new(title: "notebook",status:"public")
      expect(article).to_not be_valid
    end
  end