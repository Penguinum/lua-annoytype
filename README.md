# Annoytype
A set of cheats made on top of [Typed Lua](https://github.com/andremm/typedlua)
to make it work like linter. The idea is to provide information about types
through comments (without syntax extension, so there will be no need in
compile step. Also tools that expect Lua syntax (e.g. Luacheck) will work).

Examples:
```Lua
-- Both x and y should be of type "string"
local x, y --> string

-- x should be a number while y should be a string
local x, y --> number, string

local function vectorLength(point) --> {"x": number, "y": number} : number
  return math.sqrt(math.pow(point.x, 2) + math.pow(point.y, 2))
end
```

**Warning**: this is just an experiment and should not (and probably can not)
be used at the moment.
Comment format is to be changed (as well as project name).


# License

Released under the MIT License (MIT)

Copyright (c) 2013 Andre Murbach Maidl

Copyright (c) 2017 Penguinum-tea

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
