--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})


-- Firefox extensions special window rule for extensions windows (mainly Bitwarden)
hl.on("window.open", function(w)
    if w.class ~= "waterfox" then return end
    if w.initial_title ~= "Waterfox" then return end

    local ff_windows = hl.get_windows({ class = "waterfox" })
    if #ff_windows <= 1 then return end

    hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))

    local sub
    sub = hl.on("window.title", function(tw)
        if tw.address ~= w.address then return end
        if tw.title == ""
            or tw.title == "Waterfox"
            or tw.title == "about:blank"
            or tw.title:match("^about:.*Waterfox$") then return end

        sub:remove()

        -- wait 0.25 seconds to let the window change names an be identifiable
        hl.timer(function()
            if tw.title:match("^Erweiterung:*") then
                hl.dispatch(hl.dsp.window.resize({ x = 480, y = 570, window = tw }))
                hl.dispatch(hl.dsp.window.center({ window = tw }))
                hl.dispatch(hl.dsp.focus({ window = tw }))
            else
                hl.dispatch(hl.dsp.window.float({ action = "unset", window = tw }))
            end
        end, { timeout = 250, type = "oneshot" })
    end)
end)
