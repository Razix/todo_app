class Project < ActiveRecord::Base
  belongs_to :user
  has_many :todos
  attr_accessible :name
  validates :name, presence: true
end
