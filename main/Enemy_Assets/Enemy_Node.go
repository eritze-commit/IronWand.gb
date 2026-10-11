components {
  id: "enemy_controller"
  component: "/main/Enemy_Assets/enemy_controller.script"
}
components {
  id: "Ring_Particle"
  component: "/main/Enemy_Assets/Ring_Particle.particlefx"
}
components {
  id: "Enemy_death_explosion"
  component: "/main/Player_assets/Enemy_death_explosion.particlefx"
}
components {
  id: "enemy_spawn"
  component: "/main/Enemy_Assets/enemy_spawn.particlefx"
  position {
    y: -6.0
  }
}
embedded_components {
  id: "Main_sprite"
  type: "sprite"
  data: "default_animation: \"spinin\"\n"
  "material: \"/main/Enemy_Assets/Enemy_shader_related_files/Enemy_Material_custom.material\"\n"
  "size {\n"
  "  x: 18.0\n"
  "  y: 16.0\n"
  "}\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Enemy_Assets/enemy_Node.tilesource\"\n"
  "}\n"
  ""
  position {
    z: 1.19
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
    y: -4.0
    z: 0.4
  }
  scale {
    x: 0.7
    y: 0.7
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"enemy\"\n"
  "mask: \"entity\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "    id: \"enitity\"\n"
  "  }\n"
  "  data: 6.9798913\n"
  "}\n"
  "locked_rotation: true\n"
  "event_collision: false\n"
  "event_contact: false\n"
  ""
}
embedded_components {
  id: "collision2"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_DYNAMIC\n"
  "mass: 0.1\n"
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
  "    id: \"entity\"\n"
  "  }\n"
  "  data: 4.1906776\n"
  "}\n"
  "locked_rotation: true\n"
  "bullet: true\n"
  "event_trigger: false\n"
  ""
}
embedded_components {
  id: "factory"
  type: "factory"
  data: "prototype: \"/main/Enemy_Assets/General_bullet.go\"\n"
  ""
}
