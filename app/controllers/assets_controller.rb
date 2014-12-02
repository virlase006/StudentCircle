class AssetsController < ApplicationController
	def index
		@asset= Asset.new
	end
	def create
		@asset=Asset.create(params[asset_params])

	redirect_to root_path  
	end
	def asset_params
		params.require(:asset).permit(:pic, :attach)
	end
end
