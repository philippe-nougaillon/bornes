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
				      location = params[:location] + ", FR"
				      @bornes = Borne.near(location, params[:kms].to_i).group(:id_station)
				    end
				 rescue
				 	@bornes = []
				 end

			    # if params[:puissance].present?
			    #   @bornes = @bornes.where("cast(puiss_max as int) >= ?", params[:puissance].to_i)
			    # end
			end	
		end
	end
end
