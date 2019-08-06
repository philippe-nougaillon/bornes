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
						# Chercher d'abord dans les alentours
					  	location = params[:location].upcase
						@bornes = Borne.near(location, params[:kms].to_i).group(:id_station).limit(10)
						# Si pas de résultats, on cherche par l'adresse	
						unless @bornes.any?	
							@bornes = Borne.where("ad_station like ?", "%#{location}%").limit(10)
						end
				    end
				 rescue
				 	@bornes = []
				 end
			end	
		end
	end
end
