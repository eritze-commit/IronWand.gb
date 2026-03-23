components {
  id: "Enemy_bullet_script"
  component: "/main/Enemy_Assets/Enemy_bullet_script.script"
}
components {
  id: "enemy_bullet_destroy"
  component: "/main/Enemy_Assets/enemy_bullet_destroy.particlefx"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"star\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Enemy_Assets/Enemy_bullets.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 1.2
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"entity\"\n"
  "mask: \"wall\"\n"
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
  "  data: 3.0\n"
  "}\n"
  "locked_rotation: true\n"
  ""
}
