class StaticPagesController < ApplicationController
  def home
    @serviceordems = Serviceordem.where("data_instalacao >= ?", Time.zone.now.beginning_of_day).limit(10)
  end
end
