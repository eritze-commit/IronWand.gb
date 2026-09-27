components {
  id: "bullet_on_contact"
  component: "/main/Player_assets/G-UNZ/bullet_on_contact.particlefx"
}
components {
  id: "bullet_trail"
  component: "/main/Player_assets/G-UNZ/bullet_trail.particlefx"
}
components {
  id: "exploding_bullet_controller"
  component: "/main/Player_assets/G-UNZ/exploding_bullet_controller.script"
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\n"
  "mass: 0.0\n"
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
  "  data: 5.0\n"
  "}\n"
  "angular_damping: 1.0\n"
  "locked_rotation: true\n"
  "bullet: true\n"
  ""
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"1 \"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ADD\n"
  "size {\n"
  "  x: 3.0\n"
  "  y: 3.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Player_assets/G-UNZ/exploding_bullet.tilesource\"\n"
  "}\n"
  ""
  scale {
    x: 0.035
    y: 0.035
  }
}
