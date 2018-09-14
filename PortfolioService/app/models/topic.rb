class Topic < ApplicationRecord
  validates_presence_of :title, :skill_percent

  has_many :posts
end
