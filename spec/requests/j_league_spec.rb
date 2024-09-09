require 'rails_helper'

RSpec.describe "JLeagues", type: :request do
  describe "GET /j_league" do
    it "/j_league/standingsにアクセスする" do
      get j_league_standings_path
      expect(response).to have_http_status(:success)
    end

    it "/j_league/teamsにアクセスする" do
      get j_league_teams_path
      expect(response).to have_http_status(:success)
    end

    it "/j_league/searchにアクセスする" do
      get j_league_search_path
      expect(response).to have_http_status(:success)
    end

    it "/j_league/:idにアクセスする" do
      get team_path(854)
      expect(response).to have_http_status(:success)
    end
  end
end
