def tick args
  if args.tick_count == 0
    args.state.dr_logo ||= {
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

 dr_logo = args.state.dr_logo
 camera_angle = args.state.camera_angle

 args.outputs.background_color = [100, 100, 100]


  dr_logo.stack.times do |index|
    y_offset = (index * 2) * Math.sin(camera_angle * Math::PI / 180)
    args.outputs.sprites << {
      x: dr_logo.x,
      y: dr_logo.y + y_offset,
      w: dr_logo.w * 4,
      h: dr_logo.h * 4,
      path: dr_logo.path,
      source_x: 0,
      source_y: dr_logo.h * index,
      source_w: dr_logo.w ,
      source_h: dr_logo.h ,
      angle: args.tick_count % 360
    }
  end

  args.outputs.debug << "Up or Down to change angle"
  args.outputs.debug << "Cam Angle: #{camera_angle}"
  args.outputs.debug << "Voxel by Max Parata."
  args.outputs.debug << "Find at maxparata.itch.io/tinyvoxeldungeon"
end
