class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])

    params[:plant_tag][:tag_id].each do |tag_id|
      # skip le premier tag_id qui n'est pas un id
      next if tag_id == ""

      tag = Tag.find(tag_id)
      @plant_tag = PlantTag.create(plant: @plant, tag: tag)

      # récupérer l'erreur
      @alert = @plant_tag.errors.first.message if @plant_tag.errors.first
    end
    redirect_to garden_path(@plant.garden), alert: @alert
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
