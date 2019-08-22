class TaggingsController < ApplicationController
  def new
     # Could be in a set_plant before_action, since it also appear on #create
    @plant = Plant.find(params[:plant_id])

    @tagging = Tagging.new
  end

  def create
    # Could be in a set_plant before_action, since it also appear on #new
    @plant = Plant.find(params[:plant_id])

    # The method tag_ids returns an array of ids selected by the user, ::where
    # from active record accepts arrays also. So we can just use them here to
    # get all tags of the selected ids.
    @tags = Tag.where(id: tag_ids)

    # We build the tags that we want to save into an array of taggings
    taggings = @tags.map do |tag|
      Tagging.new(plant: @plant, tag: tag)
    end

    # We checked whether all tags we're able to be saved
    if taggings.all?(&:save)
      # If yes, we proceed as normal.
      redirect_to @plant.garden
    else
      # If not, we put the first failing tagging in this variable to show the
      # form errors to the user.
      @tagging = taggings.find { |tagging| tagging.errors.any? }
      render :new
    end
  end

  private

  def tagging_params
    # Strong params variations:
    # Note: We ended up moving away from this. But I left it here for reference.

    # For a string (most common by far)  👇
    # params.require(:tagging).permit(:tag_id)

    # For an array                       👇
    # params.require(:tagging).permit(tag_id: [])
  end

  def tag_ids
    # The fact that we are using a for for a tagging to create multiple taggings
    # makes it clunky that we have an array of multiple ids in a key named tag_id
    # I preferered to hide this under this method that has a pluralized name:
    # tag_ids
    params[:tagging][:tag_id]

    # Note: the clunky reject blank isn't necessary anymore because of the
    # include_hidden: false on the form. Check the taggings#new view.
  end
end
