require 'rails_helper'

RSpec.describe "TaskTemplates", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/task_templates/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/task_templates/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/task_templates/create"
      expect(response).to have_http_status(:success)
    end
  end

end
