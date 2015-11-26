class ActorsController < ApplicationController

	def index	
		@actors = Actor.all
	end

	def new
		@actor = Actor.new
	end

	def create
		@actor = Actor.new(actor_params)

		if @actor.save
			redirect_to actors_path
		else
			render 'new'
		end
	end


	def show
		@actor = Actor.find(params[:id])
	end

	def edit
		@actor = Actor.find(params[:id])
	end

	def update
		@actor = Actor.find(params[:id])
		if @actor.update(actor_params)
			redirect_to actors_path
		else
			render :edit
		end
	end

	def destroy
		actor = Actor.find(params[:id])
		actor.destroy

		redirect_to actors_path
	end


	private
	def actor_params
		params.require(:actor).permit(:name, :bio, :birth_date, :birth_place, :death_date, :death_place, :image_url, :alive)
	end
end

