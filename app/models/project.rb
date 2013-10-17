class Project < ActiveRecord::Base
  attr_accessible :name, :image, :remote_image_url
  belongs_to :user
  has_many :todos
  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploader
  validates :name, presence: true
end
