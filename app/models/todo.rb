class Todo < ActiveRecord::Base
  attr_accessible :value, :tag_ids
  belongs_to :user
  has_and_belongs_to_many :tags
  validates :value, presence: true
end
