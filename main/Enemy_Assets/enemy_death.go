components {
  id: "enemy_death"
  component: "/main/Enemy_Assets/enemy_death.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"slime_death\"\n"
  "material: \"/main/Enemy_Assets/Enemy_shader_related_files/Enemy_Material_custom.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Enemy_Assets/enemy_death_sprites.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 0.1
  }
}
embedded_components {
  id: "sprite1"
  type: "sprite"
  data: "default_animation: \"undershadow\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_MULT\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/assets/atlasses/Undershadow.atlas\"\n"
  "}\n"
  ""
  position {
    y: -1.0
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_DYNAMIC\n"
  "mass: 1.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"entity\"\n"
  "mask: \"wall\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_BOX\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "    id: \"box\"\n"
  "  }\n"
  "  data: 5.5\n"
  "  data: 5.5\n"
  "  data: 10.0\n"
  "}\n"
  "locked_rotation: true\n"
  "event_contact: false\n"
  "event_trigger: false\n"
  ""
}
