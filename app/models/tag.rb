class Tag < ActiveRecord::Base
  attr_accessible :name, :todo_ids
  belongs_to :user
  has_and_belongs_to_many :todos
  validates :name, presence: true
end
