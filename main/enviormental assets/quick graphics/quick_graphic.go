components {
  id: "quick_graphic"
  component: "/main/enviormental assets/quick graphics/quick_graphic.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"dash\"\n"
  "material: \"/main/enviormental assets/quick graphics/quick_graphic.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/enviormental assets/quick graphics/quick_graphic.tilesource\"\n"
  "}\n"
  ""
  scale {
    x: 0.7
    y: 0.7
  }
}
