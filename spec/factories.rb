Factory.define :article do |a|
  a.title "Artigo teste"
  a.body "Artigo de teste"
end

Factory.define :other_article, :class => 'article' do |a|
  a.title "Outro artigo teste"
  a.body "Outro artigo de teste"
end
