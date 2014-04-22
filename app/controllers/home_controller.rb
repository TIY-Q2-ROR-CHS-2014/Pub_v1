class HomeController < ApplicationController
  def index
    @pubs = Pub.all
  end
end
