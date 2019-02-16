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
  nextobjectid = 24,
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
          x = 200.054,
          y = 340.477,
          width = 501,
          height = 45,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22",
            ["data"] = "boat",
            ["isTrigger"] = false
          }
        },
        {
          id = 4,
          name = "",
          type = "dynamic",
          shape = "rectangle",
          x = 497.833,
          y = 551.833,
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
          id = 7,
          name = "DeckBack",
          type = "dynamic",
          shape = "rectangle",
          x = 176.856,
          y = 299.507,
          width = 41,
          height = 69,
          rotation = -17.9698,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22",
            ["data"] = "boatWall",
            ["isTrigger"] = false
          }
        },
        {
          id = 8,
          name = "Prow",
          type = "dynamic",
          shape = "rectangle",
          x = 675.065,
          y = 346.371,
          width = 116,
          height = 26,
          rotation = -36.3115,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22",
            ["data"] = "boat",
            ["isTrigger"] = false
          }
        },
        {
          id = 9,
          name = "Platform",
          type = "dynamic",
          shape = "rectangle",
          x = 465,
          y = 224,
          width = 116,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22",
            ["data"] = "boat",
            ["isTrigger"] = false
          }
        },
        {
          id = 10,
          name = "Platform2",
          type = "dynamic",
          shape = "rectangle",
          x = 553,
          y = 192,
          width = 29,
          height = 57,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#ff30ff22",
            ["data"] = "boatWall",
            ["isTrigger"] = false
          }
        },
        {
          id = 11,
          name = "rockerL",
          type = "kinematic",
          shape = "rectangle",
          x = 187.5,
          y = 3.16665,
          width = 30,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = true,
            ["color"] = "#ff154bff"
          }
        },
        {
          id = 12,
          name = "rockerR",
          type = "kinematic",
          shape = "rectangle",
          x = 737,
          y = 3,
          width = 30,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = true,
            ["color"] = "#ff154bff"
          }
        },
        {
          id = 13,
          name = "prowZone",
          type = "dynamic",
          shape = "rectangle",
          x = 628.5,
          y = 220.167,
          width = 157,
          height = 128.333,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#50ff1d00",
            ["data"] = "prowZone",
            ["isTrigger"] = true
          }
        },
        {
          id = 14,
          name = "backZone",
          type = "dynamic",
          shape = "rectangle",
          x = 181.5,
          y = 229.167,
          width = 166.667,
          height = 120.333,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#50ff1d00",
            ["data"] = "backZone",
            ["isTrigger"] = true
          }
        },
        {
          id = 15,
          name = "lightZone",
          type = "dynamic",
          shape = "rectangle",
          x = 507.5,
          y = 191.5,
          width = 74,
          height = 35,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#50ff1d00",
            ["data"] = "lightZone",
            ["isTrigger"] = true
          }
        },
        {
          id = 16,
          name = "belowZone",
          type = "dynamic",
          shape = "rectangle",
          x = 472.5,
          y = 251,
          width = 109,
          height = 88,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#50ff1d00",
            ["data"] = "belowZone",
            ["isTrigger"] = true
          }
        },
        {
          id = 17,
          name = "catTarC",
          type = "dynamic",
          shape = "rectangle",
          x = 445,
          y = 525,
          width = 23,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#9400ff11",
            ["data"] = "catTar",
            ["isTrigger"] = true
          }
        },
        {
          id = 19,
          name = "catTarD",
          type = "dynamic",
          shape = "rectangle",
          x = 852.5,
          y = 525,
          width = 23,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#9400ff11",
            ["data"] = "catTar",
            ["isTrigger"] = true
          }
        },
        {
          id = 20,
          name = "catTarA",
          type = "dynamic",
          shape = "rectangle",
          x = -110.5,
          y = 525,
          width = 23,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#9400ff11",
            ["data"] = "catTar",
            ["isTrigger"] = true
          }
        },
        {
          id = 21,
          name = "catTarE",
          type = "dynamic",
          shape = "rectangle",
          x = 1206.5,
          y = 525,
          width = 23,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#9400ff11",
            ["data"] = "catTar",
            ["isTrigger"] = true
          }
        },
        {
          id = 22,
          name = "catTarB",
          type = "dynamic",
          shape = "rectangle",
          x = 108.5,
          y = 525,
          width = 23,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = false,
            ["color"] = "#9400ff11",
            ["data"] = "catTar",
            ["isTrigger"] = true
          }
        },
        {
          id = 23,
          name = "targetGod",
          type = "kinematic",
          shape = "rectangle",
          x = 515.167,
          y = 494,
          width = 63,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {
            ["LockRot"] = true,
            ["color"] = "#9400ff11",
            ["data"] = "",
            ["isTrigger"] = true
          }
        }
      }
    }
  }
}
