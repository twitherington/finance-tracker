class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = 'You need to enter a stock symbol.'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = 'You need to enter a valid stock symbol.' unless @stock
    end
    respond_to do |format|
      format.js {render partial: 'users/result'}
    end
  end
end
