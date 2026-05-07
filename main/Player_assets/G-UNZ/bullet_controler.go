components {
  id: "bullet_controler_scrpt"
  component: "/main/Player_assets/G-UNZ/bullet_controler_scrpt.script"
}
components {
  id: "bullet_trail"
  component: "/main/Player_assets/G-UNZ/bullet_trail.particlefx"
}
components {
  id: "bullet_on_contact"
  component: "/main/Player_assets/G-UNZ/bullet_on_contact.particlefx"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"anim\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Player_assets/G-UNZ/bullet_sprites.tilesource\"\n"
  "}\n"
  ""
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_DYNAMIC\n"
  "mass: 0.01\n"
  "friction: 0.0\n"
  "restitution: 0.5\n"
  "group: \"entity\"\n"
  "mask: \"wall\"\n"
  "mask: \"enemy\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "    id: \"bullet\"\n"
  "  }\n"
  "  data: 1.7239045\n"
  "}\n"
  "angular_damping: 1.0\n"
  "locked_rotation: true\n"
  "bullet: true\n"
  ""
}
