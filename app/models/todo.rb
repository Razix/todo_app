class Todo < ActiveRecord::Base
  attr_accessible :value, :tag_ids
  belongs_to :project
  has_and_belongs_to_many :tags
  has_many :comments, as: :commentable
  validates :value, presence: true
end
