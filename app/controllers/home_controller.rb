class HomeController < ApplicationController
  def index
    @locations = [['Johannesburg', 'jhb'], ['Cape Town', 'cpt'], ['Durban', 'dbn']]
    @location = "jhb"
    @time_of_day = (6..18).cover?(Time.current.hour) ? "Today" : "Tonight"
    @quote = quotes[@location]
  end

  def quote
    @search = quotes.keys.map(&:to_s).include?(params[:location]) ? params[:location] : 'jhb'
    render json: { quote: quotes[@search] }
  end

  private

  def quotes
    @_quotes ||= {
      'jhb': "you can buy castle lites 🥳, but can't drink them with mates 😑",
      'dbn': "you can walk on the beach 🥳, but you can't swim in the sea 😑",
      'cpt': "you can take a jog on the promenade 🥳, but can't buy gwaais 😑"
  }.with_indifferent_access
  end
end
