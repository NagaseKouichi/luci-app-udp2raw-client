-- Copyright (C) 2025 luci-app-udp2raw-client
-- Copyright (C) 2025 NagaseKouichi
-- Licensed to the public under the GNU General Public License v3.

module("luci.controller.udp2raw-client", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/udp2raw-client") then
		return
	end

	entry({ "admin", "services", "udp2raw-client" }, cbi("udp2raw-client"), _("Udp2raw Client"), 60).dependent = true
	entry({ "admin", "services", "udp2raw-client", "status" }, call("act_status")).leaf = true
end

function act_status()
	local e = {}
	e.running = luci.sys.call("ps|grep -v grep|grep -c udp2raw >/dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end

-- Fuck GFW and who made it, Freedom!
