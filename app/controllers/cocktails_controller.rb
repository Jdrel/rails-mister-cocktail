class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
    @doses = []
    ingredients = []
    @combo = []

    @cocktails.each do |cocktail|
      doses_of_cocktail = Dose.where(cocktail_id: cocktail[:id]).to_a
      @doses << doses_of_cocktail
    end
  end

  def show
    @doses = Dose.where(cocktail_id: params[:id]).to_a
    @ingredients = []
    @doses.each do |dose|
      @ingredients << Ingredient.where(id: dose[:ingredient_id]).first
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end


