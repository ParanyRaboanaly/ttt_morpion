require_relative 'controller'

class Router
  def initialize
    @controller = Controller.new
  end
  def perform
    @controller.start_game
  end
end
