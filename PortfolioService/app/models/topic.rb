class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :posts

  def self.with_published_posts
    includes(:posts).where.not(posts: { id: nil, status: :draft })
  end
end
