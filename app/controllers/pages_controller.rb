class PagesController < ApplicationController

  # Home, checkn.mx
  def index
    @events = Event.all
  end

  # Log In, checkn.mx/login
  def login
  end

  # User Profile, checkn.mx/profile
  def profile

  end
end
