class Vehicle < ActiveRecord::Base
  has_one :insurance
  has_one :registration
  belongs_to :user
	has_many :repairs

	self.inheritance_column = :type
  has_attached_file :image,
                    styles: { large: "500x500>", medium: "150x150>", thumb: "50x50>"},
                    default_url: "default_car.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

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
    where(type: 'motoryclce')
  end

  def self.waverunner
    where(type: 'waverunner')
  end

  def self.dunebuggy
    where(type: 'dunebuggy')
  end

  def self.other
    where(type: 'other')
  end

	def talk
	  raise 'You need to override this method in your sub classes'
	end

end
