#!/usr/bin/env lua

local moonscript = require "moonyscript"
local tlast = require "annoy.tlast"
local tlparser = require "annoy.tlparser"
local tlchecker = require "annoy.tlchecker"
local tlcode = require "annoy.tlcode"

local PROGNAME = "lua-annnoytype"

local DUMPAST = false
local PRINTAST = false

local COLOR = false
local STRICT = false
local WARNINGS = false
local INTEGER = false
if _VERSION == "Lua 5.3" then INTEGER = true end

local progname = PROGNAME

local USAGE = [[
usage: %s [options] [filename]
Available options are:
-h       print this help
-d name  dump the AST (after typechecking) to file 'name'
-c       ansi colors on
-p       print the AST in Metalua format (before typechecking)
-s       strict mode on
-w       warnings on (consistent-subtyping, unused locals)
]]

local function usage (msg)
  if msg then
    io.stderr:write(string.format("%s: %s\n", progname, msg))
  end
  io.stderr:write(string.format(USAGE, progname))
  os.exit(1)
end

local function doargs ()
  local i = 1
  while i <= #arg do
    if string.find(arg[i], "^-") == nil then
      return i
    else
      for j = 2, #arg[i] do
        local option_char = arg[i]:sub(j, j)
        if option_char == "d" then
          if j ~= #arg[i] then
            usage("'-d' appears last in option block")
          end
          i = i + 1
          if arg[i] == nil or string.find(arg[i], "^-") then
            usage("'-d' needs argument")
          else
            DUMPAST = arg[i]
            break
          end
        elseif option_char == "h" then
          usage()
        elseif option_char == "c" then
          COLOR = true
        elseif option_char == "p" then
          PRINTAST = true
        elseif option_char == "s" then
          STRICT = true
        elseif option_char == "w" then
          WARNINGS = true
        else
          usage(string.format("'%s' unknown option", arg[i]))
        end
      end
    end
    i = i + 1
  end
  return i
end

local function getcontents (filename)
  local file = assert(io.open(filename, "r"))
  local contents = file:read("*a")
  file:close()
  return contents
end

local function setcontents (contents, filename)
  local file = assert(io.open(filename, "w"))
  file:write(contents)
  file:write("\n")
  file:close()
end

local i = doargs()
local filename = arg[i]
if not filename then
  usage("no input file given")
end

if i < #arg then
  io.stderr:write(string.format("%s: Ignored extra arguments (%s)\n", progname, table.concat(arg, ", ", i+1, #arg)))
end

local subject = getcontents(filename)
if filename:match(".+%.moon$") then
  subject = moonscript.compile(subject)
end

local ast, error_msg = tlparser.parse(subject, filename, STRICT, INTEGER)
if not ast then
  print(error_msg)
  os.exit(1)
end

if PRINTAST then
  print(tlast.tostring(ast))
end

error_msg = tlchecker.typecheck(ast, subject, filename, STRICT, INTEGER, COLOR)
local status
error_msg, status = tlchecker.error_msgs(error_msg, WARNINGS, COLOR, true)
if error_msg then print(error_msg) end

if DUMPAST then
  local out = assert(io.open(DUMPAST, "w+"))
  out:write("return ")
  tlast.dump(out, ast)
end

os.exit(status)
