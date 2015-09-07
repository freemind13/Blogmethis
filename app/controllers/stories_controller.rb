class StoriesController < ApplicationController


	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
			@stories = Story.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@stories = Story.where(category_id: @category_id).order("created_at DESC")
		end
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
		params.require(:story).permit(:title, :description, :company, :url, :category_id)
	end

	def find_story
		@story = Story.find(params[:id])
	end
end
