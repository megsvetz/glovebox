class Repair < ActiveRecord::Base
  belongs_to :vehicle
  validates_presence_of :type
  has_attached_file :repair_image, :styles => {:large => "600x600", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :repair_image, :content_type => /\Aimage\/.*\Z/

  def self.types
    %w[Oilchange Tirerotation Inspection Alignment Modification Otherrepair]
  end

  #scopes
	def self.oilchanges
		where(type: 'Oilchange')
	end
  def self.tirerotations
		where(type: 'Tirerotation')
	end
  def self.inspections
    where(type: 'Inspection')
  end
  def self.alignments
    where(type: 'Alignment')
  end
  def self.modifications
    where(type: 'Modification')
  end
  def self.otherrepairs
    where(type: 'Otherrepair')
  end

  # def type_string
  #   raise "override me in the subclass"
  # end

end
