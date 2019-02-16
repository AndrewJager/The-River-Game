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
  nextobjectid = 11,
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
          x = -1,
          y = 607,
          width = 2000,
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
          name = "Deck",
          type = "dynamic",
          shape = "rectangle",
          x = 217.054,
          y = 514.477,
          width = 501,
          height = 45,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22"
          }
        },
        {
          id = 4,
          name = "",
          type = "dynamic",
          shape = "rectangle",
          x = 16.8333,
          y = 472.833,
          width = 157.048,
          height = 51.9674,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22"
          }
        },
        {
          id = 5,
          name = "boatGod",
          type = "kinematic",
          shape = "rectangle",
          x = 459.667,
          y = 2.16667,
          width = 55,
          height = 31.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = true,
            ["color"] = "#ff154bff"
          }
        },
        {
          id = 6,
          name = "Track",
          type = "static",
          shape = "rectangle",
          x = 0,
          y = 34.1667,
          width = 2000,
          height = 18.3333,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ffceff72"
          }
        },
        {
          id = 7,
          name = "DeckBack",
          type = "dynamic",
          shape = "rectangle",
          x = 193.856,
          y = 473.507,
          width = 41,
          height = 69,
          rotation = -17.9698,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22"
          }
        },
        {
          id = 8,
          name = "Prow",
          type = "dynamic",
          shape = "rectangle",
          x = 692.065,
          y = 520.371,
          width = 116,
          height = 26,
          rotation = -36.3115,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22"
          }
        },
        {
          id = 9,
          name = "Platform",
          type = "dynamic",
          shape = "rectangle",
          x = 482,
          y = 398,
          width = 116,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22"
          }
        },
        {
          id = 10,
          name = "Platform2",
          type = "dynamic",
          shape = "rectangle",
          x = 570,
          y = 366,
          width = 29,
          height = 57,
          rotation = 0,
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
