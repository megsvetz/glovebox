class Vehicle < ActiveRecord::Base

	self.inheritance_column = :type
  has_attached_file :image, styles: { large: "500x500>", medium: "150x150>", thumb: "50x50>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def self.type
	  %w(Car Truck Boat Trailer ATV Motorcycle Waverunner Dunebuggy)
	end

	#scopes
	def self.car
		where(type: 'Car')
	end

	def self.truck
		where(race: 'Truck')
	end

	def self.boat
		where(race: 'Boat')
	end

	def self.trailer
		where(race: 'Trailer')
	end

  def self.atv
    where(race: 'ATV')
  end

  def self.motorcycle
    where(race: 'motoryclce')
  end

  def self.waverunner
    where(race: 'waverunner')
  end

  def self.dunebuggy
    where(race: 'dunebuggy')
  end

	def talk
	  raise 'You need to override this method in your sub classes'
	end
end
