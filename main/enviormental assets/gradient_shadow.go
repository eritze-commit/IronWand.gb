components {
  id: "gradient_ball"
  component: "/main/enviormental assets/gradient_ball.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"purpl\"\n"
  "material: \"/main/enviormental assets/quick graphics/quick_graphic.material\"\n"
  "blend_mode: BLEND_MODE_MULT\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/enviormental assets/gradient_ball.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 0.4
  }
}
