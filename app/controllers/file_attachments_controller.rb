class FileAttachmentsController < ApplicationController
	def create
		@file_attachment=FileAttachment.create(params[:file])
redirect_to root_path
	end
	def index
		@file_attachment=FileAttachment.new
	end
end
