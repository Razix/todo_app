class Todo < ActiveRecord::Base
  attr_accessible :value, :tag_ids
  belongs_to :project
  has_and_belongs_to_many :tags
  has_many :comments, as: :commentable
  has_many :documents
  validates :value, presence: true
end
