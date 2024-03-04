require 'rails_helper'
RSpec.describe Article, type: :model do
  it "is valid with valid attributes" do
    article = Article.new(title: "notebook", body: "noteaaaaaaaa " ,status:"public")
    expect(article).to be_valid
  end
end



