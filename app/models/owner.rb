class Owner < ActiveRecord::Base
    has_many :adoptables
end
