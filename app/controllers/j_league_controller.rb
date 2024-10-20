class JLeagueController < ApplicationController
  require 'net/http'
  require 'json'

  def standings
    uri = URI("https://api.football-data-api.com/league-tables?key=#{ENV['FOOTYSTATS_API_KEY']}&season_id=10994")
    response = Net::HTTP.get(uri)
    results = JSON.parse(response)
    @teams = results['data']['all_matches_table_overall']
  end

  def teams
    uri = URI("https://api.football-data-api.com/league-teams?key=#{ENV['FOOTYSTATS_API_KEY']}&season_id=10994&include=stats")
    response = Net::HTTP.get(uri)
    results = JSON.parse(response)
    @teams = results['data']
  end

  def search
  end

  def show
    uri = URI("https://api.football-data-api.com/team?key=#{ENV['FOOTYSTATS_API_KEY']}&team_id=#{params[:id]}&include=stats")
    response = Net::HTTP.get(uri)
    results = JSON.parse(response)
    @team = results['data'][0]
  end
end
