# ENCODING: UTF-8

module Api
    module V1
		class Api::V1::BornesController < ActionController::Base

			# Prevent CSRF attacks by raising an exception.
		  	# For APIs, you may want to use :null_session instead.
		  	protect_from_forgery with: :exception
		    skip_before_action :verify_authenticity_token
		    
			def index
				@bornes = Borne.all
			    
			    if params[:location].present? && params[:kms].present?
			      location = params[:location] + ", FR"
			      kms = params[:kms].to_i
			      @bornes = @bornes.near(location, kms)
			    end

			    if params[:puissance].present?
			      @bornes = @bornes.where("cast(puiss_max as int) >= ?", params[:puissance].to_i)
			    end

			    if params[:stations].present?
			      @bornes = @bornes.group(:id_station)
			    end
			end	
		end
	end
end
