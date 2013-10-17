class Document < ActiveRecord::Base
  belongs_to :todo
  attr_accessible :document
  mount_uploader :document, DocumentUploader
end
