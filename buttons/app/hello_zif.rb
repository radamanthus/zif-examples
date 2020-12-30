class HelloZif < Zif::Game
  def initialize
    super
    register_scene(:main_menu, MainMenu)

    @scene = MainMenu.new
  end
end
