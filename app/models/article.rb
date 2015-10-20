class Article < ActiveRecord::Base

  #validates :title, presence: true, length: { minimum: 0 }
  validates :text, presence: true, length: { maximum: 140 }

end
