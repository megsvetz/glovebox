class Vehicle < ActiveRecord::Base
  has_one :insurance, dependent: :destroy
  has_one :registration, dependent: :destroy
  belongs_to :user
	has_many :repairs, dependent: :destroy

	self.inheritance_column = :type

  has_attached_file :image,
                    styles: { large: "500x500>", medium: "150x150>", thumb: "50x50>"}

  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
  validates :make, :model, :name, :state, :presence => {:message => "empty value found"}

	def self.type
	  %w(Car Truck Boat Trailer ATV Motorcycle Waverunner Dunebuggy Other)
	end

	#scopes
	def self.car
		where(type: 'Car')
	end

	def self.truck
		where(type: 'Truck')
	end

	def self.boat
		where(type: 'Boat')
	end

	def self.trailer
		where(type: 'Trailer')
	end

  def self.atv
    where(type: 'ATV')
  end

  def self.motorcycle
    where(type: 'Motorcycle')
  end

  def self.waverunner
    where(type: 'Waverunner')
  end

  def self.dunebuggy
    where(type: 'Dunebuggy')
  end

  def self.other
    where(type: 'Other')
  end

	# def talk
	#   raise 'You need to override this method in your sub classes'
	# end

end
