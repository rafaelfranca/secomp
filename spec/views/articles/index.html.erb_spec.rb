# encoding: utf-8
require 'spec_helper'

describe "articles/index.html.erb" do
  before do
    assigns['articles'] = [mock_model(Article, :title => "Título", :body => "Texto").as_null_object]
  end

  it "deveria conter o link para adicionar um novo artigo" do
    render
    response.should have_selector("a", :href => new_article_path)
  end

  it "deveria mostrar todos os artigos" do
    render
    response.should have_selector("div", :class => "article") do |div|
      div.should have_selector("h1", :content => "Título")
      div.should have_selector("div", :class => "body", :content => "Texto")
    end
  end
end
