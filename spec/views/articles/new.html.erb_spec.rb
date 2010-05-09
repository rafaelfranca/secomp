#encoding: utf-8

require 'spec_helper'

describe "articles/new.html.erb" do
  it "deveria renderizar um formulário para adicionar um novo artigo" do
    assigns['article'] = mock_model(Article).as_new_record
    render
    response.should have_selector("form", :method => "post", :action => articles_path) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end
end
