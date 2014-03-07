class Location < ActiveRecord::Base
	attr_accessible :address, :latitude, :longitude, :name
	acts_as_gmappable

	def gmaps4rails_address
		address
	end
end
