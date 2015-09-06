class StoriesController < ApplicationController
before_action :find_story, only: [:show, :edit, :update, :destroy]

def index
@stories = Story.all.order("created_at DESC")
end
def show

	end
	def new
		@story = Story.new 
	end

	def create
		@story = Story.new(stories_params)
		if @story.save
			redirect_to @story
		else
			render "New"
		end
	end
	def edit

	end

	def update
		if @story.update(stories_params)
			redirect_to @story
		else
			render "Edit"
	end
end

	def destroy
		@story.destroy
		redirect_to root_path

	end

	private

		def stories_params
			params.require(:story).permit(:title, :description, :company, :url)
		end

		def find_story
			@story = Story.find(params[:id])
		end
end

