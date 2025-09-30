class HomeController < ApplicationController
  before_action :set_products, only: :index
  def index
    ai_service = OpenAiService.new

    response = ai_service.generate_text("Explain AI in Ruby on Rails")

    puts response
  end

  private

  def set_products
    @products = Product.all
  end
end