class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to root_path
    else
      render doses_new_path
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    Dose.destroy(@dose[:id])
    redirect_to root_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
