class HomeController < ApplicationController
  def index
    @time_of_day = (6..18).cover?(Time.current.hour) ? "Today" : "Tonight"
  end
end
