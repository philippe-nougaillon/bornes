# ENCODING: UTF-8

module Api
    module V1
		class Api::V1::BornesController < ActionController::Base

			# Prevent CSRF attacks by raising an exception.
		  	# For APIs, you may want to use :null_session instead.
		  	protect_from_forgery with: :exception
		    skip_before_action :verify_authenticity_token
		    
			def index
				unless params[:location].blank?
					# Chercher d'abord dans les alentours
					location = params[:location].upcase
					@bornes = Borne.near(location, 20)
					@bornes = @bornes.limit(10)
				else
					@bornes = []
				end
			end	
		end
	end
end
