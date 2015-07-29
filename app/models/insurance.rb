class Insurance < ActiveRecord::Base
  belongs_to :vehicle

  has_attached_file :image, styles: { large: "500x500>", medium: "150x150>", thumb: "50x50>"}
  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
end
