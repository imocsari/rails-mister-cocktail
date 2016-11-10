class DosesController < ApplicationController
  # GET /doses/new
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # POST /doses
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to @cocktail, notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  private
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
