local awful = require("awful")
local gears = require("gears")
local bling = require("module.bling")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

local superkey = "Mod4"
local altkey = "Mod1"

local globalkeys = gears.table.join(
    awful.key({ superkey }, "Escape",
      awful.tag.history.restore,
      {description = "go back", group = "tag"}
    ),
    -- START MY KEYS
    -- move by directions
    awful.key({ superkey }, "h",
      function (c)
        awful.client.focus.bydirection("left", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "focus left", group = "client"}
    ),
    awful.key({ superkey }, "j",
      function (c)
          awful.client.focus.bydirection("down", c)
          bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "focus down", group = "client"}
    ),
    awful.key({ superkey }, "k",
      function (c)
          awful.client.focus.bydirection("up", c)
          bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "focus up", group = "client"}
    ),
    awful.key({ superkey }, "l",
      function (c)
          awful.client.focus.bydirection("right", c)
          bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "focus right", group = "client"}
    ),
    -- Swap by direction
    awful.key({ superkey, "Control"   }, "h",
      function (c)
        awful.client.swap.bydirection("left", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "swap left", group = "client"}
    ),
    awful.key({ superkey, "Control"   }, "j",
      function (c)
        awful.client.swap.bydirection("down", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "swap down", group = "client"}
    ),
    awful.key({ superkey, "Control"   }, "k",
      function (c)
        awful.client.swap.bydirection("up", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "swap up", group = "client"}
    ),
    awful.key({ superkey, "Control"   }, "l",
      function (c)
        awful.client.swap.bydirection("right", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "swap right", group = "client"}
    ),
    -- show hotkeys Super + ?
    awful.key({ superkey, "Shift" }, "#61",
      function ()
        hotkeys_popup.show_help(nil, awful.screen.focused())
      end,
      {description = "show main menu", group = "awesome"}
    ),
    -- Layout manipulation
    awful.key({ superkey }, ")",
      function ()
        awful.layout.inc(1)
      end,
      {description = "select next", group = "layout"}
    ),
    awful.key({ superkey }, ",",
      function ()
        awful.layout.inc(-1)
      end,
      {description = "select previous", group = "layout"}
    ),
    awful.key({ superkey }, "[",
      function ()
        awful.screen.focus_relative(1)
      end,
      {description = "focus the next screen", group = "screen"}
    ),
    awful.key({ superkey }, "]",
      function ()
        awful.screen.focus_relative(-1)
      end,
      {description = "focus the previous screen", group = "screen"}
    ),
    -- Go to previous client
    awful.key({ superkey }, "Tab",
      function ()
          awful.client.focus.history.previous()
          if client.focus then
              client.focus:raise()
          end
      end,
      {description = "go back", group = "client"}
    ),
    -- Standard program
    awful.key({ altkey }, "Return",
      function ()
        awful.spawn(user.terminal)
      end,
      {description = "open a terminal", group = "launcher"}
    ),
    -- Standard program
    awful.key({ altkey }, "#60",
      function ()
        awful.spawn(os.getenv("HOME") .. "/.config/polybar/scripts/powermenu")
      end,
      {description = "open up sysmenu", group = "launcher"}
    ),

    -- AWESOMEWM binds
    awful.key({ superkey, "Shift" }, "q",
      awesome.quit,
      {description = "quit awesome", group = "awesome"}
    ),
    awful.key({ superkey, "Control" }, "r",
      awesome.restart,
      {description = "reload awesome", group = "awesome"}
      ),

    -- Scratchpads
    awful.key({ superkey }, "/",
      function ()
        awesome.emit_signal("scratch::bench")
      end,
      {description = "launch bench scratchpad", group = "scratchpads"}
    ),
    awful.key({ superkey, "Shift" }, "t",
      function ()
        awesome.emit_signal("scratch::terminal")
      end,
      {description = "launch terminal scratchpad", group = "scratchpads"}
    ),
    awful.key({ superkey }, ";",
      function ()
        awesome.emit_signal("scratch::monitor")
      end,
      {description = "launch monitor scratchpad", group = "scratchpads"}
    ),
    awful.key({ superkey, altkey }, ";",
      function ()
        awesome.emit_signal("scratch::quest")
      end,
      {description = "launch quest scratchpad", group = "scratchpads"}
    ),
    awful.key({ superkey, altkey }, "t",
      function ()
        awesome.emit_signal("scratch::task")
      end,
      {description = "launch task scratchpad", group = "scratchpads"}
    ),
    -- END MY KEYS

    awful.key({ superkey }, "u",
      awful.client.urgent.jumpto,
      {description = "jump to urgent client", group = "client"}
    ),

    awful.key({ superkey, "Control" }, "n",
      function ()
          local c = awful.client.restore()
          -- Focus restored client
          if c then
            c:emit_signal(
                "request::activate", "key.unminimize", {raise = true}
            )
          end
      end,
      {description = "restore minimized", group = "client"}
    ),

    -- Prompt
    awful.key({ superkey }, "r",
      function ()
        awful.screen.focused().mypromptbox:run()
      end,
      {description = "run prompt", group = "launcher"}
    ),
    awful.key({ superkey }, "x",
      function ()
          awful.prompt.run {
            prompt       = "Run Lua code: ",
            textbox      = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. "/history_eval"
          }
      end,
      {description = "lua execute prompt", group = "awesome"}
    ),
    -- Menubar
    awful.key({ altkey }, "d",
      function ()
        awful.spawn("rofi -show drun -show-icons -location 0 -yoffset -250")
      end,
    --   menubar.show,
      {description = "show the menubar", group = "launcher"}
    )
)

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ superkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ superkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

local clientkeys = gears.table.join(
    awful.key({ superkey }, "f",
      function (c)
          c.fullscreen = not c.fullscreen
          c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}
    ),
    awful.key({ superkey }, "w",
      function (c)
        c:kill()
      end,
      {description = "close", group = "client"}
    ),
    awful.key({ superkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ superkey }, "z",
        function (c)
          c:swap(awful.client.getmaster())
        end,
        {description = "move to master", group = "client"}
    ),
    awful.key({ superkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ superkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ superkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ superkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ superkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ superkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ superkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ superkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ superkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ superkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

local clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ superkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ superkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

local init = function()
  -- set root keys
  root.keys(globalkeys)
  -- set root mouse keybinds
  -- TODO: These could be useful to actually leverage at some point
  root.buttons(gears.table.join(
      awful.button({ }, 3, function () end),
      awful.button({ }, 4, awful.tag.viewnext),
      awful.button({ }, 5, awful.tag.viewprev)
  ))
end

return {
  init = init,
  globalkeys = globalkeys,
  clientkeys = clientkeys,
  clientbuttons = clientbuttons
}
