return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 29,
  height = 20,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 3,
  nextobjectid = 3,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 29,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      chunks = {}
    },
    {
      type = "objectgroup",
      id = 2,
      name = "Object Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "static",
          shape = "rectangle",
          x = 85,
          y = -196,
          width = 385,
          height = 65,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22"
          }
        },
        {
          id = 2,
          name = "",
          type = "static",
          shape = "rectangle",
          x = 104.388,
          y = 45.8102,
          width = 385,
          height = 65,
          rotation = 15.6389,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22"
          }
        }
      }
    }
  }
}
