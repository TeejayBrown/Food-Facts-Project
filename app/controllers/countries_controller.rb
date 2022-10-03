class CountriesController < ApplicationController
  def index
    @countries = Country.ordered_by_countries.page params[:page]
  end

  def show
    @country = Country.find(params[:id])
  end
end
