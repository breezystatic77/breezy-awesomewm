local beautiful = require("beautiful")
local awful = require("awful")
beautiful.notification_icon_size = 50
beautiful.notification_max_width = 400
beautiful.notification_max_height = 100
beautiful.useless_gap = 5

-- https://www.reddit.com/r/awesomewm/comments/box4jk/my_functional_dynamic_border_gap_and_titlebar/

client.connect_signal("property::floating", function(c)
	if c.floating then
		awful.titlebar.show(c)
	else
		awful.titlebar.hide(c)
	end
end)

function dynamic_title(c)
	if c.floating or c.first_tag.layout.name == "floating" then
		awful.titlebar.show(c)
	else
		awful.titlebar.hide(c)
	end
end

tag.connect_signal("property::layout", function(t)
	local clients = t:clients()
	for k,c in pairs(clients) do
		if c.floating or c.first_tag.layout.name == "floating" then
			awful.titlebar.show(c)
		else
			awful.titlebar.hide(c)
		end
	end
end)

awful.spawn.with_shell("~/.config/awesome/autorun.sh")
