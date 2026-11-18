-- Window Rules

-- Opacity (0.9 active / 0.9 inactive, override = exact value, not a multiplier)
hl.window_rule({ match = { title = "^Visual Studio Code$" },  opacity = "0.9 override 0.9" })
hl.window_rule({ match = { title = "^(.* - VSCodium)$" },            opacity = "0.9 override 0.9" })
hl.window_rule({ match = { class = "org.gnome.Nautilus" },           opacity = "0.9 override 0.9" })
hl.window_rule({ match = { class = "bruno" },                        opacity = "0.9 override 0.9" })

-- Floating (+ size where set; combined into one rule per window)
hl.window_rule({ match = { class = "floating" },                        float = true })
hl.window_rule({ match = { class = "io.github.kaii_lb.Overskride" },    float = true, size = "800 600" })
hl.window_rule({ match = { class = "nm-openconnect-auth-dialog" },      float = true })
hl.window_rule({ match = { class = "nm-connection-editor" },            float = true, size = "800 600" })

hl.window_rule({ match = { title = "^(Extension:)(.*)$" },  float = true })
hl.window_rule({ match = { class = "com.saivert.pwvucontrol" },         float = true })
hl.window_rule({ match = { class = "blueberry.py" },                    float = true })
hl.window_rule({ match = { title = "nm-connection-editor" },            float = true })

-- Float Forticlient Windows
--hl.window_rule({
--    name  = "forticlient-float",
--    match = { class = "^(FortiClient)$" },
--    float  = true,
--    size   = {600, 550},
--    min_size = {600, 550},
--    max_size = {600, 550},
--    move = {"100%-w-40", 265},
--})


-- FortiClient main window (numbered) — right side
hl.window_rule({
    name  = "forticlient-main-right",
    match = {
        class = "^(FortiClient)$",
        initial_title = [[^FortiClient \(\d+\)$]],
    },
    float    = true,
    size     = {600, 550},
    min_size = {600, 550},
    max_size = {600, 550},
    move     = {977, 265},
})

-- FortiClient - Zero Trust Fabric Agent — left side
hl.window_rule({
    name  = "forticlient-ztna-left",
    match = {
        class = "^(FortiClient)$",
        initial_title = [[^FortiClient - Zero Trust Fabric Agent$]],
    },
    float = true,
    move  = {343, 269},
})


