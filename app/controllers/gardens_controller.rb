class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = Garden.all
  end

  def show
  end

  private
    def set_garden
      @garden = Garden.find(params[:id])
    end

    def garden_params
      params.require(:garden).permit(:name, :banner_image_url)
    end
end
