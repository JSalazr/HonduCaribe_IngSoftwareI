class Employee < ActiveRecord::Base
<<<<<<< HEAD
	validates_uniqueness_of :work_id, :name 
	validates_numericality_of :work_id, greater_than:0
	validates_numericality_of :number_id, greater_than:0
	validates_numericality_of :emergency_contact_number, greater_than:0

=======

  def self.civil_statuses
    ["Soltero", "Casado", "Viudo", "Divorciado", "Union Libre"];
  end

  def self.bloods
    ["O-", "O" , "A-", " A+" ,"B-", " B+" , "AB-", " AB+"]
  end
>>>>>>> 5f6ca010a63c96221ae46aa28438cb85b7e12e97
end
