class ContentsController < ApplicationController

  def index
    @contents = Content.order(:id).paginate(page: params[:page], per_page: 20).shuffle

    respond_to do |format|
      format.html
      format.json{
        render :json => @contents.to_json
      }
    end
  end
end
