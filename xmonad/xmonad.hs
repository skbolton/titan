import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- Actions
import XMonad.Actions.CycleWS (nextWS, prevWS)
import XMonad.Actions.MouseResize

-- Layouts
import XMonad.Layout.ThreeColumns

-- Layout modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Gaps  -- add spacing around screen
import XMonad.Layout.Spacing -- add spacing around windows
import XMonad.Layout.WindowNavigation -- be able to move by dir rather than up/down stack

-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks)
import XMonad.Hooks.DynamicLog

-- Utilities
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "kitty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces    = ["\xe795", "\xfa9e", "\xf9b0 ", "\xf1d8" ]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#585273"
myFocusedBorderColor = "#A1EFD3"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys :: [(String, X ())]
myKeys =
    -- close focused window
    [ ("M-w", kill)
    -- switch to next layout
    , ("M-<Backspace>", sendMessage NextLayout)
    -- resize all windows to their default size
    , ("M-KP_Equal", refresh)
    -- focus master window
    , ("M-m", windows W.focusMaster)
    -- swap window with master
    , ("M-z", windows W.swapMaster)
    -- Navigate by hjkl
    , ("M-h", sendMessage $ Go L)
    , ("M-j", sendMessage $ Go D)
    , ("M-k", sendMessage $ Go U)
    , ("M-l", sendMessage $ Go R)
    -- Swap by dir
    , ("M-C-h", sendMessage $ Swap L)
    , ("M-C-j", sendMessage $ Swap D)
    , ("M-C-k", sendMessage $ Swap U)
    , ("M-C-l", sendMessage $ Swap R)
    -- shrink master
    , ("M-[", sendMessage Shrink)
    -- expand master
    , ("M-]", sendMessage Expand)
    -- quit xmonad
    , ("M-S-q", io (exitWith ExitSuccess))
    -- restart xmonad
    , ("M-S-r", spawn "xmonad --recompile; notify-send 'XMonad recompiled'; xmonad --restart")
    -- Switch to next screen
    , ("M-<Tab>", nextWS)
    -- Switch to prev screen
    , ("M-S-<Tab>", prevWS)
    ]
    ++
    -- Switch to workspace by index #
    [("M-" ++ enumFrom k, windows $ W.view f) | (k, f) <- zip ['1' .. '8'] myWorkspaces]
    ++
    -- Send window to workspace by index
    [("M-S-" ++ enumFrom k, windows $ W.shift f) | (k, f) <- zip ['1' .. '8'] myWorkspaces]

    -- -- Move focus to the next window
    -- , ((modm,               xK_Tab   ), windows W.focusDown)

    -- -- Swap the focused window with the next window
    -- , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- -- Swap the focused window with the previous window
    -- , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- -- Push window back into tiling
    -- , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- -- Increment the number of windows in the master area
    -- , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- -- Deincrement the number of windows in the master area
    -- , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--

-- helper to define spacing easier
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

threeCol   = windowNavigation
             $ mySpacing 6
             $ ThreeColMid 1 (3/100) (1/2)
wideTiled  = windowNavigation
             $ mySpacing 6
             $ Tall 1 (3/100) (2/3)
tiled       = windowNavigation
             $ mySpacing 6
             $ Tall 1 (3/100) (1/2)
full       = windowNavigation
             $ mySpacing 12
             $ Full

myLayoutHook = avoidStruts $ mouseResize myDefaultLayout
             where
                myDefaultLayout = threeCol ||| tiled ||| wideTiled ||| full

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore
    , className =? "kitty-float"    --> doFloat
    , className =? "Lxappearance"   --> doFloat
    , className =? "firefox"        --> doShift (myWorkspaces !! 2)
    , className =? "slack"          --> doShift (myWorkspaces !! 3)
    , className =? "discord"        --> doShift (myWorkspaces !! 3)
    ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = docksEventHook <+> fullscreenEventHook

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()


------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
        spawnOnce "nitrogen --restore &"
        spawnOnce "sxhkd &"
        spawnOnce "picom --experimental-backends &"
        spawnOnce "dunst -conf ~/.config/dunst/dunstrc &"
        spawnOnce "synology-drive &"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad $ ewmh defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
    -- simple stuff
      terminal           = myTerminal,
      focusFollowsMouse  = myFocusFollowsMouse,
      clickJustFocuses   = myClickJustFocuses,
      borderWidth        = myBorderWidth,
      modMask            = myModMask,
      workspaces         = myWorkspaces,
      normalBorderColor  = myNormalBorderColor,
      focusedBorderColor = myFocusedBorderColor,

    -- key bindings
      mouseBindings      = myMouseBindings,

    -- hooks, layouts
      layoutHook         = myLayoutHook,
      manageHook         = myManageHook <+> manageDocks,
      handleEventHook    = myEventHook,
      logHook            = myLogHook,
      startupHook        = myStartupHook
  } `additionalKeysP` myKeys


