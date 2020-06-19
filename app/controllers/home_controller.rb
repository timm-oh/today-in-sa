class HomeController < ApplicationController
  def index
    @locations = locations.pluck(:name, :value)
    @location = "jhb"
    @time_of_day = (6...18).cover?(Time.current.hour) ? "Today" : "Tonight"
    @quote = find_location(@location)[:quotes].sample
  end

  def quote
    location = find_location(params[:location]) || find_location('jhb')
    render json: { quote: location[:quotes].sample }
  end

  private

  def generate_quote(positive, not_so_positive)
    "#{positive} 🥳, #{not_so_positive} 😑"
  end

  def find_location(location)
    locations.find { |h| h[:value] == location }
  end

  def locations
    [
      {
        name: "Johannesburg",
        value: 'jhb',
        quotes: [
          generate_quote("you can buy castle lites", "but can't drink them with mates"),
          "dis fokken koud ❄️"
        ]
      },
      {
        name: 'Cape Town',
        value: 'cpt',
        quotes: [generate_quote("you can take a jog on the promenade", "but can't buy gwaais")]
      },
      {
        name: 'Durban',
        value: 'dbn',
        quotes: [generate_quote("you can walk on the beach", "but you can't swim in the sea")]
      }
    ]
  end
end
