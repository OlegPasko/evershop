class ValuesController < ApplicationController

  def show
    @value = Value.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @value }
    end
  end

end
