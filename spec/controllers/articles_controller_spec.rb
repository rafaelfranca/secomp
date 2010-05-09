require 'spec_helper'

describe ArticlesController do

  describe "GET 'index'" do
    before do
      @articles = [Factory.create(:article), Factory.create(:other_article)]
    end

    it "deveria setar @articles" do
      act!
      assigns['articles'].should == @articles
    end

    it "deveria renderizar index.html.erb" do
      act!
      response.should render_template('index')
    end

    it "deveria ter sucesso" do
      act!
      response.should be_success
    end

    it "deveria renderizar um html" do
      act!
      response.content_type.should == Mime::HTML
    end

    def act!
      get 'index'
    end
  end

  describe "GET 'new'" do
    it "deveria setar @article" do
      get 'new'
      assigns['article'].should be_new_record
    end
  end
end
