class Adoptable < ActiveRecord::Base
    belongs_to :owner
    validates_presence_of :pet_name, :pet_desc 
end