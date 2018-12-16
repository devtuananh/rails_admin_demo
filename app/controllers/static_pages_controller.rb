class StaticPagesController < ApplicationController
  def show
    ender template: "static_pages/#{params[:page]}"
  end
end
