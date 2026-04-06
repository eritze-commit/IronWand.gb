components {
  id: "angel_behaviour"
  component: "/main/enviormental assets/angel_behaviour.script"
}
components {
  id: "explode_triangle_fx"
  component: "/main/enviormental assets/ParticleFX_env/explode_triangle_fx.particlefx"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"core\"\n"
  "material: \"/main/Enemy_Assets/Enemy_shader_related_files/Enemy_Material_custom.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/enviormental assets/angel_statue.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 1.1
  }
}
embedded_components {
  id: "sprite1"
  type: "sprite"
  data: "default_animation: \"shadow\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_MULT\n"
  "size {\n"
  "  x: 16.0\n"
  "  y: 16.0\n"
  "}\n"
  "size_mode: SIZE_MODE_MANUAL\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/enviormental assets/angel_statue.tilesource\"\n"
  "}\n"
  ""
  position {
    y: -5.0
    z: 1.0
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_STATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"wall\"\n"
  "mask: \"entity\"\n"
  "mask: \"bullet_box\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "    id: \"wall\"\n"
  "  }\n"
  "  data: 8.387912\n"
  "}\n"
  "locked_rotation: true\n"
  ""
}
