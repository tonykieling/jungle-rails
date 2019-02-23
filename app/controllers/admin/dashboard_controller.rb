class Admin::DashboardController < ApplicationController

  # admin's authentication procedure
  # the name and password should be set in .env file (check .env.example)
  http_basic_authenticate_with :name => ENV['ADMIN_USERNAME'], :password => ENV['ADMIN_PASSWORD']

  def show
  end
end
