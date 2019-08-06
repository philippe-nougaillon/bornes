# ENCODING: UTF-8

module Api
    module V1
		class Api::V1::BornesController < ActionController::Base

			# Prevent CSRF attacks by raising an exception.
		  	# For APIs, you may want to use :null_session instead.
		  	protect_from_forgery with: :exception
		    skip_before_action :verify_authenticity_token
		    
			def index
				begin
					if params[:location].present? && params[:kms].present?
						# Chercher d'abord par l'adresse
					  	location = params[:location].upcase
					  	@bornes = Borne.where("ad_station like ?", "%#{location}%")
						# Si pas de résultats, on cherche dans les alentours	
						unless @bornes.any?	
						  @bornes = Borne.near(location, params[:kms].to_i).group(:id_station)
						end
				    end
				 rescue
				 	@bornes = []
				 end
			end	
		end
	end
end
