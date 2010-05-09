require 'spec_helper'

describe Article do
  it "deveria ser valido com atributos validos" do
    article = Factory.build(:article)
    article.should be_valid
  end

  it "deveria ter um titulo" do
    article = Factory.build(:article, :title => nil)
    article.should_not be_valid
  end

  it "deveria ter um texto" do
    article = Factory.build(:article, :body => nil)
    article.should_not be_valid
  end
end
