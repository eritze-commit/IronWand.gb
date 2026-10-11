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
  "material: \"/main/Enemy_Assets/Enemy_shader_related_files/Enemy_Material_custom.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Enemy_Assets/Enemy_bullets.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 1.5
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"bullet_box\"\n"
  "mask: \"hit_box\"\n"
  "mask: \"walls\"\n"
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
embedded_components {
  id: "collisionobject1"
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
  "  data: 2.9333625\n"
  "}\n"
  ""
}
embedded_components {
  id: "sprite2"
  type: "sprite"
  data: "default_animation: \"star\"\n"
  "material: \"/main/Enemy_Assets/Enemy_shader_related_files/Enemy_Material_custom.material\"\n"
  "blend_mode: BLEND_MODE_ADD\n"
  "size {\n"
  "  x: 16.0\n"
  "  y: 16.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Enemy_Assets/Enemy_bullets.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 1.19
  }
  scale {
    x: 1.05
    y: 1.05
  }
}
