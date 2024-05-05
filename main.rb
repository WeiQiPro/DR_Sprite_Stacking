def tick args
  if args.tick_count == 0
    args.state.sprite_stack ||= {
      x: 640 - (100),
      y: 360 - (100),
      stack: 50,
      w: 50,
      h: 50,
      path: "sprites/KingsRoomByMaxParata.png"
    }
    args.state.camera_angle ||= 90

  end

 args.state.camera_angle += args.inputs.up_down_with_wasd * 5

 sprite_stack = args.state.sprite_stack
 camera_angle = args.state.camera_angle

 args.outputs.background_color = [100, 100, 100]

 size_increase = 4

  sprite_stack.stack.times do |index|
    y_offset = (index * 2) * Math.sin(camera_angle * Math::PI / 180)
    args.outputs.sprites << {
      x: sprite_stack.x,
      y: sprite_stack.y + y_offset,
      w: sprite_stack.w * size_increase,
      h: sprite_stack.h * size_increase,
      path: sprite_stack.path,
      source_x: 0,
      source_y: sprite_stack.h * index,
      source_w: sprite_stack.w ,
      source_h: sprite_stack.h ,
      angle: args.tick_count % 360
    }
  end

  args.outputs.debug << "Up or Down to change angle"
  args.outputs.debug << "Cam Angle: #{camera_angle}"
  args.outputs.debug << "Voxel by Max Parata."
  args.outputs.debug << "Find at maxparata.itch.io/tinyvoxeldungeon"
end
