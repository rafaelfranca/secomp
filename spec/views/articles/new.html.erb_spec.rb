#encoding: utf-8

require 'spec_helper'

describe "articles/new.html.erb" do
  before do
    assigns['article'] = mock_model(Article).as_new_record.as_null_object
  end

  it "deveria renderizar um formulário para adicionar um novo artigo" do
    render
    response.should have_selector("form", :method => "post", :action => articles_path) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end

  it "deveria renderizar um campo texto para o título" do
    assigns['article'].stub(:title).and_return("Título")
    render
    response.should have_selector("form") do |form|
      form.should have_selector("input", :type => "text", :name => "article[title]", :value => "Título")
    end
  end

  it "deveria renderizar um campo de área de texto para o corpo" do
    assigns['article'].stub(:body).and_return("Corpo")
    render
    response.should have_selector("form") do |form|
      form.should have_selector("textarea", :name => "article[body]", :content => "Corpo")
    end
  end
end
