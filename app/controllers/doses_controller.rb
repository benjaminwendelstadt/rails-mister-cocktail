class DosesController < ApplicationController
  before_action :set_cocktail, only: %i[new create]

  def new
    @dose = Dose.new
  end

  def create

    @dose = Dose.new(description: params[:dose][:description], ingredient_id: params[:dose][:ingredient_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_ingredient
    unless params[:dose][:ingredient_id].empty? # .valid? maybe
      ingredient = Ingredient.find_by(name: params[:dose][:ingredient_id].capitalize)
      if ingredient.nil?
        Ingredient.create(name: params[:dose][:ingredient_id].capitalize)
      else
        ingredient
      end
    end
  end
end
