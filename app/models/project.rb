class Project < ActiveRecord::Base
  belongs_to :user
  has_many :todos
  has_many :comments, as: :commentable
  attr_accessible :name
  validates :name, presence: true
end
