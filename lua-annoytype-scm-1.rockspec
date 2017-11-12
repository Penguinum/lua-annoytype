package = "lua-annoytype"
version = "scm-1"
source = {
  url = "git://github.com/Penguinum/lua-annoytype.git"
}
description = {
  summary = "Type checker for Lua",
  detailed = [[
    Type checker based on Typed Lua.
  ]],
  homepage = "https://github.com/Penguinum/lua-annoytype",
  license = "MIT"
}
dependencies = {
  "lua >= 5.1",
  "lpeg >= 0.12"
}
build = {
  type = "builtin",
  modules = {
    ["moonyscript"] = "moonyscript",
    ["annoy.tlast"] = "annoy/tlast.lua",
    ["annoy.tlchecker"] = "annoy/tlchecker.lua",
    ["annoy.tlcode"] = "annoy/tlcode.lua",
    ["annoy.tlfilter"] = "annoy/tlfilter.lua",
    ["annoy.tllexer"] = "annoy/tllexer.lua",
    ["annoy.tlparser"] = "annoy/tlparser.lua",
    ["annoy.tlst"] = "annoy/tlst.lua",
    ["annoy.tltype"] = "annoy/tltype.lua",
    ["annoy.tldparser"] = "annoy/tldparser.lua"
  },
  install = {
    bin = { "lua-annoytype" },
    lua = {
      ["moonyscript"] = "moonyscript",
      ["annoy.lsl51.base"] = "annoy/lsl51/base.tld",
      ["annoy.lsl51.coroutine"] = "annoy/lsl51/coroutine.tld",
      ["annoy.lsl51.package"] = "annoy/lsl51/package.tld",
      ["annoy.lsl51.string"] = "annoy/lsl51/string.tld",
      ["annoy.lsl51.table"] = "annoy/lsl51/table.tld",
      ["annoy.lsl51.math"] = "annoy/lsl51/math.tld",
      ["annoy.lsl51.io"] = "annoy/lsl51/io.tld",
      ["annoy.lsl51.os"] = "annoy/lsl51/os.tld",
      ["annoy.lsl51.debug"] = "annoy/lsl51/debug.tld",
      ["annoy.lsl52.base"] = "annoy/lsl52/base.tld",
      ["annoy.lsl52.coroutine"] = "annoy/lsl52/coroutine.tld",
      ["annoy.lsl52.package"] = "annoy/lsl52/package.tld",
      ["annoy.lsl52.string"] = "annoy/lsl52/string.tld",
      ["annoy.lsl52.table"] = "annoy/lsl52/table.tld",
      ["annoy.lsl52.math"] = "annoy/lsl52/math.tld",
      ["annoy.lsl52.bit32"] = "annoy/lsl52/bit32.tld",
      ["annoy.lsl52.io"] = "annoy/lsl52/io.tld",
      ["annoy.lsl52.os"] = "annoy/lsl52/os.tld",
      ["annoy.lsl52.debug"] = "annoy/lsl52/debug.tld",
      ["annoy.lsl53.base"] = "annoy/lsl53/base.tld",
      ["annoy.lsl53.coroutine"] = "annoy/lsl53/coroutine.tld",
      ["annoy.lsl53.package"] = "annoy/lsl53/package.tld",
      ["annoy.lsl53.string"] = "annoy/lsl53/string.tld",
      ["annoy.lsl53.utf8"] = "annoy/lsl53/utf8.tld",
      ["annoy.lsl53.table"] = "annoy/lsl53/table.tld",
      ["annoy.lsl53.math"] = "annoy/lsl53/math.tld",
      ["annoy.lsl53.io"] = "annoy/lsl53/io.tld",
      ["annoy.lsl53.os"] = "annoy/lsl53/os.tld",
      ["annoy.lsl53.debug"] = "annoy/lsl53/debug.tld"
    }
  }
}
