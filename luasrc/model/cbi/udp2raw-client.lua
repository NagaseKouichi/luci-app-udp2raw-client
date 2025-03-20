-- Copyright (C) 2025 luci-app-udp2raw-client
-- Copyright (C) 2025 NagaseKouichi
-- Licensed to the public under the GNU General Public License v3.

local m, s, o

local raw_modes                   = {
    "faketcp",
    "udp",
    "icmp",
}

local cipher_modes                = {
    "aes128cbc",
    "xor",
    "none",
}

local auth_modes                  = {
    "md5",
    "crc32",
    "simple",
    "none",
}

m                                 = Map("udp2raw-client", translate("Udp2raw Client"),
    translate("A simple Luci webui and shell for Udp2raw that can detect remote server ip change and restart Udp2raw."))

m:section(SimpleSection).template = "udp2raw-client/status"

s                                 = m:section(TypedSection, "udp2raw-client", translate("General Setting"))
s.anonymous                       = true

o                                 = s:option(Flag, "enable", translate("Enable"))
o.rmempty                         = false

o                                 = s:option(Value, "listen_addr", translate("Local Listen Host"))
o.datatype                        = "ipaddr"
o.placeholder                     = "127.0.0.1"

o                                 = s:option(Value, "listen_port", translate("Local Listen Port"))
o.datatype                        = "port"
o.placeholder                     = "12345"

o                                 = s:option(Value, "server_addr", translate("Server Domain"))
o.datatype                        = "host"
o.rmempty                         = false

o                                 = s:option(Value, "server_port", translate("Server Port"))
o.datatype                        = "port"
o.placeholder                     = "54321"

o                                 = s:option(Value, "key", translate("Password"))
o.password                        = true

o                                 = s:option(ListValue, "raw_mode", translate("Raw Mode"))
for _, v in ipairs(raw_modes) do o:value(v, v:lower()) end
o.default = "faketcp"
o.rmempty = false

o         = s:option(ListValue, "cipher_mode", translate("Cipher Mode"))
for _, v in ipairs(cipher_modes) do o:value(v, v:lower()) end
o.default = "aes128cbc"

o = s:option(ListValue, "auth_mode", translate("Auth Mode"))
for _, v in ipairs(auth_modes) do o:value(v, v:lower()) end
o.default = "md5"

return m
