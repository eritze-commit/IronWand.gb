components {
  id: "enemy_drop_controller"
  component: "/main/Enemy_Assets/drops/enemy_drop_controller.script"
}
components {
  id: "drop_Pfx"
  component: "/main/Enemy_Assets/drops/drop_Pfx.particlefx"
}
components {
  id: "drops_spawn_fx"
  component: "/main/Enemy_Assets/drops/drops_spawn_fx.particlefx"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"mana_orb\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Enemy_Assets/drops/enemy_drops.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 3.0
  }
}
embedded_components {
  id: "sprite1"
  type: "sprite"
  data: "default_animation: \"glow\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ADD\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Enemy_Assets/drops/item_glow.tilesource\"\n"
  "}\n"
  ""
  position {
    y: 10.0
    z: 2.0
  }
  scale {
    x: 0.395017
    y: 3.421599
  }
}
