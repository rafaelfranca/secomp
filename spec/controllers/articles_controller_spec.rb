# encoding: utf-8
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

  describe "GET 'show'" do
    before do
      @article = Factory(:article)
    end

    it "deveria setar @article" do
      get "show", :id => @article.id
      assigns['article'].should == @article
    end
  end
  
  describe "POST 'create'" do
    before do
      @article = mock_model(Article, :save => nil)
      Article.stub(:new).and_return(@article)
    end

    it "deveria criar um novo artigo" do
      Article.should_receive(:new).with("title" => "Titulo", "body" => "Corpo").and_return(@article)
      post :create, :article => { "title" => "Titulo", "body" => "Corpo" }
    end

    it "deveria salvar o artigo" do
      @article.should_receive(:save)
      post :create
    end

    context "quando o artigo é criado com sucesso" do
      before (:each) do
        @article.stub(:save).and_return(true)
      end

      it "deveria setar o flash[:notice]" do
        post :create
        flash[:notice].should == "Artigo criado com sucesso."
      end

      it "deveria redirecionar para a index dos artigos" do
        post :create
        response.should redirect_to(article_path(@article))
      end
    end

    context "quando o artigo falha ao ser salvo" do
      before(:each) do
        @article.stub(:save).and_return(false)
      end

      it "deveria setar @article" do
        post :create
        assigns['article'].should == @article
      end
    end
  end
end
