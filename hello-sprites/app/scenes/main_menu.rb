class MainMenu < Zif::Scene
  SPRITES_PATH = 'sprites'

  def prepare_scene
    super

    # ------------------------------
    # Draw a static sprite - Start
    # ------------------------------
    @spaceship = Zif::Sprite.new.tap do |s|
      s.x = 600
      s.y = 300
      s.w = 64
      s.h = 64
      s.path = "#{SPRITES_PATH}/spaceship.png"
    end
    # ------------------------------
    # Draw a static sprite - End
    # ------------------------------

    # ------------------------------
    # Draw an animated sprite that loops through the dragon_* images - Start
    # ------------------------------
    @dragon = Zif::Sprite.new.tap do |s|
      s.x = 300
      s.y = 300
      s.w = 100
      s.h = 80
      s.path = "sprites/dragon_0.png"
    end

    # Register the flying animation by name.
    # Tell it to use the 4 images 1 through 4, then reverse back to 1.
    # Hold each image for 4 ticks.
    @dragon.new_basic_animation(
      :fly,
      [1,2,3,4,3,2].map { |i| ["dragon_#{i}", 4] }
    )

    $game.services[:action_service].register_actionable(@dragon)
    @dragon.run_animation_sequence(:fly)
    # ------------------------------
    # Draw an animated sprite that loops through the dragon_* images - End
    # ------------------------------

    $gtk.args.outputs.static_sprites << [@spaceship, @dragon]
  end

  def perform_tick
  end
end
