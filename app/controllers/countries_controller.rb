class CountriesController < ApplicationController
  def index
    @countries = Country.ordered_by_countries.limit(100)
  end

  def show
    @country = Country.find(params[:id])
  end
end
