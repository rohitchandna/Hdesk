class SearchesController < ApplicationController
# GET /searches
  # GET /searches.json
  def index
    @searches = Search.do(params[:search_string]).all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end
  
  def create
   # @searches = Search.do(params[:search_string]).all
   # respond_to do |format|
      redirect_to "/searches?search_string=#{params[:search_result]}"
     # format.json { render json: @searches }
   # end
  end


end
