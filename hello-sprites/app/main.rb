# No dependencies
require 'app/lib/zif/zif.rb'
require 'app/lib/zif/sprites/serializable.rb'
require 'app/lib/zif/services/services.rb'
require 'app/lib/zif/services/input_service.rb'
require 'app/lib/zif/services/tick_trace_service.rb'

# Expects $services to be services.rb, works with tick_trace_service.rb
require 'app/lib/zif/trace/traceable.rb'

# Expects to be included in a Sprite subclass
require 'app/lib/zif/sprites/assignable.rb'

# Depends on serializable.rb
require 'app/lib/zif/actions/action.rb'
require 'app/lib/zif/scenes/scene.rb'

# Depends on serializable.rb, action.rb
require 'app/lib/zif/actions/sequence.rb'

# Depends on action.rb, sequence.rb
require 'app/lib/zif/actions/actionable.rb'

# Depends on actionable.rb
require 'app/lib/zif/labels/label.rb'

# Depends on sequence.rb - expects an Actionable class
require 'app/lib/zif/actions/animatable.rb'
require 'app/lib/zif/services/action_service.rb'

# Depends on serializable.rb, assignable.rb, actionable.rb, animatable.rb
require 'app/lib/zif/sprites/sprite.rb'

# Depends on sprite.rb, zif.rb
require 'app/lib/zif/sprites/render_target.rb'
require 'app/lib/zif/sprites/compound_sprite.rb'

# Depends on sprite.rb
require 'app/lib/zif/services/sprite_registry.rb'
require 'app/lib/zif/panels/nine_panel_edge.rb'

# Depends on traceable.rb, services.rb, input_service.rb, tick_trace_service.rb, action_service.rb, sprite_registry.rb,
#            scene.rb
require 'app/lib/zif/game.rb'

require 'app/scenes/main_menu.rb'
require 'app/hello_zif.rb'

def tick(args)
  if args.tick_count == 2
    $game = HelloZif.new
    $game.scene.prepare_scene
  end

  $game&.perform_tick
end
