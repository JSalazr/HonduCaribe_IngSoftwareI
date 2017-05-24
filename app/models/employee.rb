class Employee < ActiveRecord::Base
	validates_uniqueness_of :work_id, :name
	validates_numericality_of :work_id, greater_than:0
	validates_numericality_of :emergency_contact_number, greater_than:0
	has_attached_file :image,
	:storage => :s3,
	:bucket => 'honducariberrhh',
	:s3_permissions => :public,
	:url => ":s3_domain_url",
	:path => "/assets/photos/:id/:style/:basename.:extension",
	:s3_host_name => "s3-website-us-west-2.amazonaws.com",
	:s3_credentials => :"#{Rails.root}/config/s3.yml"

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :educations
	has_many :work_exps
	has_many :dependants
	has_many :employee_abilities
	has_many :abilities, :through => :employee_abilities
	belongs_to :work_structure
	has_many :training_employees
  has_many :trainings, :through => :training_employees

  def self.civil_statuses
    ["Soltero", "Casado", "Viudo", "Divorciado", "Union Libre"];
  end

  def self.bloods
    ["O-", "O" , "A-", " A+" ,"B-", " B+" , "AB-", " AB+"]
  end

	def self.contracts
    ["Permanente", "Temporal" , "Practicante"]
  end
	def self.parentesco
    ["Hijo", "Conyuge", "Hermano"]
  end

	def self.habilidades
		["Ejemplo1", "Ejemplo2", "Ejemplo3"]
	end
end
