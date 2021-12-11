local awful = require("awful")
local gears = require("gears")
local bling = require("module.bling")
local hotkeys_popup = require("awful.hotkeys_popup")
local scratchpad = require("elemental.scratchpad")
local machi = require("module.layout-machi")

local super = "Mod4"
local shift = "Shift"
local ctrl = "Control"
local alt = "Mod1"

local globalkeys = gears.table.join(
    -- CLIENT KEYS
    -- move by directions
    awful.key({ super }, "h",
      function (c)
        awful.client.focus.bydirection("left", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "focus left", group = "client"}
    ),
    awful.key({ super }, "j",
      function (c)
          awful.client.focus.bydirection("down", c)
          bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "focus down", group = "client"}
    ),
    awful.key({ super }, "k",
      function (c)
          awful.client.focus.bydirection("up", c)
          bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "focus up", group = "client"}
    ),
    awful.key({ super }, "l",
      function (c)
          awful.client.focus.bydirection("right", c)
          bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "focus right", group = "client"}
    ),
    -- Swap by direction
    awful.key({ super, ctrl }, "h",
      function (c)
        awful.client.swap.bydirection("left", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "swap left", group = "client"}
    ),
    awful.key({ super, ctrl }, "j",
      function (c)
        awful.client.swap.bydirection("down", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "swap down", group = "client"}
    ),
    awful.key({ super, ctrl }, "k",
      function (c)
        awful.client.swap.bydirection("up", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "swap up", group = "client"}
    ),
    awful.key({ super, ctrl }, "l",
      function (c)
        awful.client.swap.bydirection("right", c)
        bling.module.flash_focus.flashfocus(client.focus)
      end,
      {description = "swap right", group = "client"}
    ),

    -- TAG KEYS
    awful.key( { super }, "e",
      function ()
        machi.default_editor.start_interactive()
      end,
      { description = "Launch Machi", group = "tag" }
    ),
    -- Increase master width factor
    awful.key({ super }, ".",
      function ()
        awful.tag.incmwfact(0.1)
      end,
      {description = "increase master width", group = "tag"}
    ),
    awful.key({ super }, ",",
      function ()
        awful.tag.incmwfact(-0.1)
      end,
      {description = "decrease master width", group = "tag"}
    ),
    -- Change layouts
    awful.key({ super, shift }, "]",
      function ()
        awful.layout.inc(1)
        awesome.emit_signal("layout-changed")
      end,
      {description = "select next layout", group = "tag"}
    ),
    awful.key({ super, shift }, "[",
      function ()
        awful.layout.inc(-1)
        awesome.emit_signal("layout-changed")
      end,
      {description = "select prev layout", group = "tag"}
    ),
    -- adjust gaps
    awful.key({ super, shift }, 0,
      function ()
        awful.tag.incgap(4)
      end,
      {description = "increase gaps", group = "tag"}
    ),
    awful.key({ super, shift }, 9,
      function ()
        awful.tag.incgap(-4)
      end,
      {description = "decrease gaps", group = "tag"}
    ),
    -- Go to next tag
    awful.key({ super }, "Tab",
      function ()
        awful.tag.viewnext()
      end,
      {description = "next tag", group = "tag"}
    ),
    -- Go to previous tag
    -- TODO: NOT WORKING
    awful.key({ super, shift }, "Tab",
      function ()
        awful.tag.viewnext()
      end,
      {description = "next tag", group = "tag"}
    ),

    -- AWESOME KEYS
    -- show hotkeys Super + ?
    awful.key({ super, shift }, "/",
      function ()
        hotkeys_popup.show_help(nil, awful.screen.focused())
      end,
      {description = "show main menu", group = "awesome"}
    ),
    -- quit awesome
    awful.key({ super, ctrl }, "q",
      awesome.quit,
      {description = "quit awesome", group = "awesome"}
    ),
    -- restart awesome
    awful.key({ super, ctrl }, "r",
      awesome.restart,
      {description = "reload awesome", group = "awesome"}
      ),

    -- SCREEN KEYS
    awful.key({ super }, "]",
      function ()
        awful.screen.focus_relative(1)
      end,
      {description = "focus the next screen", group = "screen"}
    ),
    awful.key({ super }, "[",
      function ()
        awful.screen.focus_relative(-1)
      end,
      {description = "focus the previous screen", group = "screen"}
    ),

    -- MEDIA KEYS
    awful.key({}, "XF86AudioNext",
      function ()
        awful.spawn("playerctl next")
      end,
      {description = "next track", group = "media"}
    ),
    awful.key({}, "XF86AudioPrev",
      function ()
        awful.spawn("playerctl previous")
      end,
      {description = "previous track", group = "media"}
    ),
    awful.key({}, "XF86AudioPlay",
      function ()
        awful.spawn("playerctl play-pause")
      end,
      {description = "play/pause", group = "media"}
    ),
    awful.key({}, "Print",
      function ()
        awful.spawn("flameshot gui")
      end,
      {description = "take screenshot", group = "media"}
    ),

    -- Launchers
    -- Terminal
    awful.key({ alt }, "Return",
      function ()
        awful.spawn(user.terminal)
      end,
      {description = "open a terminal", group = "launcher"}
    ),
    awful.key({ alt, shift }, "b",
      function ()
        awful.spawn(user.terminal .. " nvim " .. os.getenv("HOME") .. "/Documents/Delta/Bench.md")
      end,
      {desription = "open bench", group = "launcher"}
    ),
    -- powermenu
    -- TODO: Make this a lua widget and bind to bar
    awful.key({ alt }, "period",
      function ()
        awful.spawn(os.getenv("HOME") .. "/.config/polybar/scripts/powermenu")
      end,
      {description = "sysmenu", group = "launcher"}
    ),
    -- emoji selector
    awful.key({ alt }, "e", 
      function ()
        awful.spawn('rofi -show emoji -modi emoji')
      end,
      {description = "emoji picker", group = "launcher"}
    ),
    awful.key({ alt }, "f",
      function ()
        awful.spawn('delta-emoji-picker')
      end,
      {description = "delta picker", group = "launcher"}
    ),
    -- Scratchpads
    awful.key({ alt }, "/",
      function ()
        scratchpad.bench:toggle()
      end,
      {description = "show bench", group = "scratchpads"}
    ),
    -- show terminal scratch alt + >
    awful.key({ alt, shift }, ".",
      function ()
        scratchpad.terminal:toggle()
      end,
      {description = "show terminal", group = "scratchpads"}
    ),
    awful.key({ alt }, ";",
      function ()
        scratchpad.monitor:toggle()
      end,
      {description = "show sys monitor", group = "scratchpads"}
    ),
    awful.key({ alt }, "q",
      function ()
        scratchpad.quest:toggle()
      end,
      {description = "show quest", group = "scratchpads"}
    ),
    awful.key({ alt }, "t",
      function ()
        scratchpad.task:toggle()
      end,
      {description = "launch task scratchpad", group = "scratchpads"}
    ),
    awful.key({ alt, shift }, "4",
      function ()
        scratchpad.finance:toggle()
      end,
      {description = "show finance pad", group = "scratchpads"}
    ),
    awful.key({ alt }, "p",
      function ()
        scratchpad.password:toggle()
      end,
      {description = "launch password scratchpad", group = "scratchpads"}
    ),
    -- END MY KEYS

    awful.key({ super }, "u",
      awful.client.urgent.jumpto,
      {description = "jump to urgent client", group = "client"}
    ),

    awful.key({ super, ctrl }, "n",
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
    awful.key({ alt }, "d",
      function ()
        awful.spawn("rofi -show drun -show-icons -location 0 -yoffset -250")
      end,
      {description = "show the menubar", group = "launcher"}
    )
)

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ super }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ super }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

local clientkeys = gears.table.join(
    -- Move focused client to other screen
    awful.key({ super, alt }, "]",
      function (c)
        -- defaults to next screen
        c:move_to_screen()
      end,
      {description = "Move client to other screen", group = "client"}
    ),
    awful.key({ super }, "f",
      function (c)
          c.fullscreen = not c.fullscreen
          c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}
    ),
    awful.key({ super }, "z",
      function (c)
        awful.client.setmaster(c)
      end,
      {description = "set as master", group = "client"}
    ),
    awful.key({ super }, "w",
      function (c)
        c:kill()
      end,
      {description = "close", group = "client"}
    ),
    awful.key({ super, ctrl }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ super }, "z",
        function (c)
          c:swap(awful.client.getmaster())
        end,
        {description = "move to master", group = "client"}
    ),
    awful.key({ super,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ super,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ super,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ super,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ super, ctrl }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ super, shift   }, "m",
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
        awful.key({ super }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ super, ctrl }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ super, alt }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}
        )
    )
end

local clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ super }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ super }, 3, function (c)
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
