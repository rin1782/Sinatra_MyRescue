class Adoptable < ActiveRecord::Base
    belongs_to :owner
end