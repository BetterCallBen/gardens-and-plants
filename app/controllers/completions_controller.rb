class CompletionsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @completion = Completion.new
  end

  def create
    @completion = Completion.new(completion_params)
    @plant = Plant.find(params[:plant_id])

    @completion.plant = @plant

    @completion.save

    redirect_to garden_path(@plant.garden)
  end

  private

  def completion_params
    params.require(:completion).permit(:chore_id)
  end
end
