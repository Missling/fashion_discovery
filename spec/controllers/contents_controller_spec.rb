require "rails_helper"

RSpec.describe ContentsController, type: :controller do
  describe "GET #index" do
    render_views

    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end

    it "returns 20 entries for @contents" do
      get :index

      expect(assigns(:contents).length).to eq(20)
    end

    it "returns all 60 entries without duplication" do
      all_contents = []
      get :index
      all_contents << assigns(:contents)
      get :index
      all_contents << assigns(:contents)
      get :index
      all_contents << assigns(:contents)

      expect(all_contents.uniq).to eq(all_contents)
    end

    it "returns 20 entries for json response" do
      get :index, format: :json
      json = JSON.parse(response.body)

      expect(json.length).to eq(20)
    end

    it "returns all 60 entries in json without duplication" do
      all_contents = []
      get :index, format: :json
      json = JSON.parse(response.body)
      all_contents << json
      get :index, format: :json
      json = JSON.parse(response.body)
      all_contents << json
      get :index, format: :json
      json = JSON.parse(response.body)
      all_contents << json

      expect(all_contents.uniq).to eq(all_contents)
    end

    it 'return json object with title, blurb, author, thumbnail_url, details_url' do
      get :index, format: :json
      json = JSON.parse(response.body)

      expect(json.first).to include("title", "blurb", "author", "thumbnail_url", "details_url")
    end
  end
end