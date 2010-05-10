class Article < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  validates :body, :presence => true

  has_friendly_id :title, :use_slug => true, :approximate_ascii => true
end
