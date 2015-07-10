class Registration < ActiveRecord::Base
  belongs_to :vehicle
  validates_presence_of :state
  validates_presence_of :expiration
  validates_presence_of :cost

  has_attached_file :image, styles: { large: "500x500>", medium: "150x150>", thumb: "50x50>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
