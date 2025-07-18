local neorg = require "neorg.core"
local modules = neorg.modules

local api = vim.api

local module = modules.create "external.dew-decorlink"

module.setup = function()
  return {
    requires = {
      "core.neorgcmd",
    },
  }
end

module.load = function()
  module.required["core.neorgcmd"].add_commands_from_table {
    dew_decorlink = {
      args = 0,
      name = "dew-decorlink.insert",
    },
  }
end

module.config.public = {
  icons = {},
}

module.private = {
  extract_icon = function(line)
    return line:match ": (.+)" .. " "
  end,

  set_formatted_icon_list = function()
    local icons = module.config.public.icons
    local sorted_keys = {}
    local sorted_list = {}

    for k in pairs(icons) do
      table.insert(sorted_keys, k)
    end
    table.sort(sorted_keys)

    for _, vk in ipairs(sorted_keys) do
      table.insert(sorted_list, vk .. ": " .. icons[vk] .. " ")
    end

    return sorted_list
  end,

  pick_and_insert_icon = function()
    require("neorg.core.modules")
      .get_module("external.neorg-dew")
      .telescope_picker("Choose an iten to insert", module.private.set_formatted_icon_list(), {
        entry_value = function(entry)
          return entry
        end,
        entry_display = function(entry)
          return entry
        end,
        entry_ordinal = function(entry)
          return entry
        end,
      }, function(map, action_state, actions)
        map("i", "<CR>", function(bufnr)
          local selection = action_state.get_selected_entry()
          actions.close(bufnr)

          local icon = module.private.extract_icon(selection.display)
          api.nvim_put({ icon }, "c", true, true)
        end)
        return true
      end)
  end,
}

module.on_event = function(event)
  if event.split_type[2] == "dew-decorlink.insert" then
    if vim.fn.search("}", "c") then
      module.private.pick_and_insert_icon()
    end
  end
end

module.events.subscribed = {
  ["core.neorgcmd"] = {
    ["dew-decorlink.insert"] = true,
  },
}

return module
