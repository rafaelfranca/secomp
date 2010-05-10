# encoding: utf-8
require 'spec_helper'

describe "articles/show.html.erb" do
  before do
    assigns['article'] = mock_model(Article, :title => "Título", :body => "Texto").as_null_object
  end

  it "deveria mostrar o artigo" do
    render
    response.should have_selector("div", :class => "article") do |div|
      div.should have_selector("h1", :content => "Título")
      div.should have_selector("div", :class => "body", :content => "Texto")
    end
  end
end
