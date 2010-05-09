require 'spec_helper'

describe "articles/index.html.erb" do
  it "deveria conter o link para adicionar um novo artigo" do
    render
    response.should have_selector("a", :href => new_article_path)
  end
end
