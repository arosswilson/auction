class User < ActiveRecord::Base
  has_many :bids
  has_many :items
  has_many :biditems, through: :bids, source: :item
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}, presence: true
end
