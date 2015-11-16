class ContentsController < ApplicationController

  def index
    @contents = Content.paginate(page: params[:page], per_page: 20)

    respond_to do |format|
      format.html
      format.json{
        render :json => @contents.to_json
      }
    end
  end
end
