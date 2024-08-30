class JLeagueController < ApplicationController
  require 'net/http'
  require 'json'

  def standings
    uri = URI"https://api.football-data-api.com/league-tables?key=#{ENV['FOOTYSTATS_API_KEY']}&season_id=10994"
    response = Net::HTTP.get(uri)
    results = JSON.parse(response)
    @teams = results['data']['all_matches_table_overall']
  end
end
