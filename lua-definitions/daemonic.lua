---@meta _

---@class DMC
DMC = {}

---[Documentation](https://daemonic.cc/estore/daemonic-api/#SecureCode)<br>
---Example:
---```lua
---SecureCode("JumpOrAscendStart")
---```
---
---@param funcName string|function
---@param ... any
function DMC.SecureCode(funcName, ...) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#Synchronous&Asynchronous)<br>
---Example:
---```lua
---local function httpAsync(method, url, parameters, headers, callback)
---   local id = InetRequest(method, url, parameters, headers)
---   local function check()
---      local res, status = InetGetRequest(id)
---      if res then
---         callback(res, status)
---      else
---         C_Timer.After(0.04, check)
---      end
---   end
---   C_Timer.After(0.04, check)
---end
---
---local function httpHandler(res, status)
---    if status == 200 then
---      print(res)
---   else
---      print("Wrong Status '" .. status .. "' in response!")
---   end
---end
---
---httpAsync(
---   "GET",
---   "example.com/", -- DO NOT USE PROTOCOL BEFORE THE DOMAIN
---   "",
---   "",
---httpHandler)
---```
---@param method string
---@param url string
---@param parameters string
---@param headers string
---@return any id
function DMC.InetRequest(method, url, parameters, headers) end

---@return string, number content, number statusCode
function DMC.InetGetRequest(id)
    return "", 0, 0
end

---@return boolean
function DMC.IsInWorld()
    return false
end

---@param filePath string
---@return boolean
function DMC.FileExists(filePath)
    return false
end

---@return string
function DMC.GetExeDirectory()
    return ""
end

---@return string
function DMC.GetWowDirectory()
    return ""
end

---@param dirPath string
---@return boolean
function DMC.DirectoryExists(dirPath)
    return false
end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetUnitPosition)<br>
---Example:
---```lua
---local x, y, z = GetUnitPosition("player")
---print(x,y,z)
---```
---@param unit string|any
---@return number x, number y, number z
function DMC.GetUnitPosition(unit)
    return 0, 0, 0
end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#TraceLine)<br>
---Flags:
---```lua
---M2Collision = 0x1
---M2Render = 0x2
---WMOCollision = 0x10
---WMORender = 0x20
---Terrain = 0x100
---WaterWalkableLiquid = 0x10000
---Liquid = 0x20000
---EntityCollision = 0x100000
---```
---Example:
---```lua
---local function Los()
---   local ax, ay, az = GetUnitPosition("player")
---   local bx, by, bz = GetUnitPosition("target")
---   local flags = bit.bor(0x10, 0x100, 0x1)
---   local hit,x,y,z = TraceLine(ax,ay,az+2.25,bx,by,bz+2.25,flags);
---   return hit == 0
---end
---print(Los())
---```
---@param sx number
---@param sy number
---@param sz number
---@param ex number
---@param ey number
---@param ez number
---@param flags any
---@return number hit, number x, number y, number z
function DMC.TraceLine(sx, sy, sz, ex, ey, ez, flags)
    return 0, 0, 0, 0
end

---@param directory string
---@param pattern string
---@return string @all files with `|` delimeter
function DMC.GetDirectoryFiles(directory, pattern)
    return ""
end

---@param filePath string path to a file
---@return string @File's content
function DMC.ReadFile(filePath)
    return ""
end

---Returns the count of all world objects, as well as the changes compared to the last call.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetObjectCount)<br>
---Example:
---```lua
---print(GetObjectCount())
---```
---@return number
function DMC.GetObjectCount() end

---Returns a specific world object by its index in the saved memory objects from the previous call to GetObjectCount.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetObjectWithIndex)<br>
---Example:
---```lua
---for i = 1, GetObjectCount(), 1 do
---   local guid = GetObjectWithIndex(i)
---   if IsGuid(guid) then
---      print(guid)
---   end
---end
---```
---@see DMC.GetObjectCount
---@param index number
---@return string|any unit
function DMC.GetObjectWithIndex(index) end

---Reads raw memory of a unit.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectField)<br>
---Types:
---```lua
---Bool = 1
---Char = 2
---Byte = 3
---Short = 4
---UShort = 5
---Int = 6
---UInt = 7
---Long = 8
---ULong = 9
---Float = 10
---Double = 11
---StringType = 12
---IntPtr = 13
---UIntPtr = 14
---GUID = 15
---```
---
---Example:
---```lua
---print(ObjectField("player", 0x18, 15)) -- Will print GUID
---```
---@param unit string|any
---@param offset number
---@param type number
function DMC.ObjectField(unit, offset, type) end

---Verifies that a variable is a valid GUID. Returns 1 or nil.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#IsGuid)<br>
---Example:
---```lua
----- GUID
---print(IsGuid("Creature-X-XXXX-XXXX-XX-XXXXXX-XXXXXXXXXX"))
---
----- Adding UnitGUID
---print(IsGuid(UnitGUID("player")))
---```
---@param guid string
---@return boolean
function DMC.IsGUID(guid) end

---@param unit string|any
---@return string Name
function DMC.ObjectName(unit)
    return ""
end

---@param unit string|any
---@return number ID
function DMC.ObjectID(unit)
    return 0
end

---@param unit string|any
---@return number Type
function DMC.ObjectType(unit)
    return 0
end

---@param unit string|any
---@return number CreatureType
function DMC.UnitCreatureTypeId(unit)
    return 0
end

---@return string
function DMC.WipeString(str)
    return ""
end

---@param content string
---@param key string
---@param type number
---@param iv string
---@return function
function DMC.DecryptAndLoadString(content, key, type, iv)
    return function() end
end

---@param string string
---@param key string
---@param type number
---@param iv string
---@return string
function DMC.DecryptString(string, key, type, iv)
    return ""
end

---@param content string
---@return function
function DMC.LoadString(content)
    return function() end
end

---@return string
function DMC.GetSessionID()
    return ""
end

---@return number
function DMC.GetSessionIndex()
    return 0
end

---@param unit string|any
---@return number
function DMC.GetUnitMovementFlags(unit)
    return 0
end

---@param unit string|any
---@return number
function DMC.UnitFlags(unit)
    return 0
end

---@param unit string|any
---@return number
function DMC.UnitNpcFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#IsSpellPending)<br>
---Example:
---```lua
---Spellfunc = function()
---  local pending = IsSpellPending()
---  if pending == 64 then
---    CancelPendingSpell()
---  end
---end
---Spellfunc()
---```
---@return number
function DMC.IsSpellPending() end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#CancelPendingSpell)<br>
---Example:
---```lua
---Spellfunc = function()
---  local pending = IsSpellPending()
---  if pending == 64 then
---    CancelPendingSpell()
---  end
---end
---Spellfunc()
---```
function DMC.CancelPendingSpell() end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#ClickPosition)<br>
---Example:
---```lua
---local x, y, z = GetUnitPosition("target")
---ClickPosition(x, y, z)
---print(x, y, z)
---```
---@param x number
---@param y number
---@param z number
function DMC.ClickPosition(x, y, z) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@overload fun(unit1:string|any, unit2:string|any):number
---@return number
function DMC.GetDistance3D(x1, y1, z1, x2, y2, z2)
    return 0
end

---@param path string
function DMC.CreateDirectory(path) end

---@param path string
---@param content string
---@param append boolean
---@overload fun(path:string,content:string)
function DMC.WriteFile(path, content, append) end

---@param string string
---@param key string
---@param type number
---@overload fun(string:string,key:string):string
---@return string
function DMC.HmacString(string, key, type)
    return ""
end


---[Documentation](https://daemonic.cc/estore/daemonic-api/#WorldToScreen)<br>
---Example:
---```lua
---local function MainWorldToScreen(wX, wY, wZ)
---  local sX, sY, Visible = WorldToScreen(wX, wY, wZ)
---  if not Visible and (not sX or sX == 0) and (not sY or sY == 0) then
---    return false, false, false
---  end
---  return sX, -sY, Visible
---end
---```
---@param x number
---@param y number
---@param z number
---@return number x, number y, boolean isOnScreen
function DMC.WorldToScreen(x, y, z) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#ScreenToWorld)<br>
---Flags:
---```lua
---M2Collision = 0x1
---M2Render = 0x2
---WMOCollision = 0x10
---WMORender = 0x20
---Terrain = 0x100
---WaterWalkableLiquid = 0x10000
---Liquid = 0x20000
---EntityCollision = 0x100000
---```
---
---Example:
---```lua
---local x, y = GetCursorPosition()
---local flags = bit.bor(0x10, 0x100, 0x1)
---local wx, wy, wz = ScreenToWorld(x, y, flags)
---print(wx, wy, wz)
---```
---@param x number
---@param y number
---@param flags number
function DMC.ScreenToWorld(x, y, flags) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectIsQuestObjective)<br>
---Example:
---```lua
---for i = 1, GetObjectCount(), 1 do
---  local object = GetObjectWithIndex(i)
---  if ObjectIsQuestObjective(object) then 
---    print(object)
---  end
---end
---```
---@param unit string|any
---@return boolean
function DMC.ObjectIsQuestObjective(unit) end

---@param unit string|any
---@return boolean
function DMC.UnitIsLootable(unit) end

---@param unit string|any
---@return boolean
function DMC.UnitIsSubmerged(unit) end

---@param unit string|any
---@return string
function DMC.UnitTarget(unit) end

---Sets a unit as a target.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetTargetUnit)<br>
---Example:
---```lua
---SetTargetUnit("player")
---```
---@param unit string|any
function DMC.SetTargetUnit(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitFacing)<br>
---Example:
---```lua
---local function IsUnitFacing()
---   local ax, ay, az = GetUnitPosition("player")
---   local bx, by, bz = GetUnitPosition("target")
---   local dx, dy, dz = ax-bx, ay-by, az-bz
---   local rotation = UnitFacing("player");
---   local value = (dy*math.sin(-rotation) - dx*math.cos(-rotation)) /
---   math.sqrt(dx*dx + dy*dy)
---   local isFacing = value > 0.25
---   return isFacing
---end
---print(IsUnitFacing())
---```
---@param unit string|any
---@return number
function DMC.UnitFacing(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitScale)<br>
---Example:
---```lua
---print(UnitScale('target'))
---```
---@param unit string|any
---@return number
function DMC.UnitScale(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetKeyState)<br>
---Example:
---```lua
---local isAltDown = (GetKeyState("LALT") == 1)
---print(isAltDown)
---```
---@param key string
---@return number
function DMC.GetKeyState(key) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetWowAccountId)<br>
---Example:
---```lua
---print(GetWowAccountId())
---```
---@return any, any, any
function DMC.GetWowAccountId() end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetAngles)<br>
---Example:
---```lua
---local facing, pitch = GetAngles("player","target")
---```
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@overload fun(unit1:string|any, unit2:string|any):facing:number, pitcher:number
---@return number facing, number pitch
function DMC.GetAngles(x1, y1, z1, x2, y2, z2) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetCameraRotation)<br>
---Example:
---```lua
---local x, y, z = GetCameraRotation()
---print(x,y,z)
---```
---@return number x, number y, number z
function DMC.GetCameraRotation() end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetCameraRotation)<br>
---Example:
---```lua
---SetCameraRotation(0, 0, 0)
---```
---@param x number
---@param y number
---@param z number
function DMC.SetCameraRotation(x, y, z) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#FaceDirection2)<br>
---Example:
---```lua
---local function FaceUnit()
--- local ax, ay, az = GetUnitPosition("player")
--- local bx, by, bz = GetUnitPosition("target")
--- local dx, dy, dz = ax-bx, ay-by, az-bz
--- local radians = math.atan2(-dy, -dx)
--- if radians < 0 then radians = radians + math.pi * 2 end
--- FaceDirection(radians) -- update by default is true, change it to false if you don't want to update movement.
---end
---FaceUnit()
---```
---@param radians number
---@param update boolean?
function DMC.FaceDirection(radians, update) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetPitch)<br>
---Example:
---```lua
---SetPitch(1.5)
---```
---@param radians number
function DMC.SetPitch(radians) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#Interact)<br>
---Example
---```lua
---Interact("target")
----- or 
---local guid = UnitGUID("target")
---Interact(guid)
---```
---@param unit string|any
function DMC.Interact(unit) end

---@param x number
---@param y number
---@param z number
function DMC.MoveTo(x, y, z) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetCorpsePosition)<br>
---Example: 
---```lua
---local x, y, z = GetCorpsePosition()
---print(x,y,z)
---```
---@return number x, number y, number z
function DMC.GetCorpsePosition() end

---@param mapID number
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param swim boolean
---@return number|nil
function DMC.FindPath(mapID, x1, y1, z1, x2, y2, z2, swim) end

---@param index number
---@return number x, number y, number z
function DMC.GetPathNode(index) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetCameraPosition)<br>
---Example:
---```lua
---local x, y, z = GetCameraPosition()
---print(x,y,z)
---```
---@return number x, number y, number z
function DMC.GetCameraPosition() end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetLastClickPosition)<br>
---Example:
---```lua
---local x, y, z = GetLastClickPosition()
---print(x,y,z)
---```
---@return number x, number y, number z
function DMC.GetLastClickPosition() end

---@param unit string|any
---@return number type
function DMC.GameObjectType(unit)
    return 0
end

---@param unit string|any
---@return boolean exists
function DMC.ObjectExists(unit)
    return false
end

---@param text string
function DMC.SetClipboardText(text) end

---@return string
function DMC.GetClipboardText()
    return ""
end

---@param unit string|any
---@return number
function DMC.UnitFlags2(unit)
    return 0
end

---@param unit string|any
---@return number
function DMC.UnitFlags3(unit)
    return 0
end

---@param unit string|any
---@return number
function DMC.UnitDynamicFlags(unit)
    return 0
end

---@param unit string|any
---@return number
function DMC.UnitAnimationFlags(unit)
    return 0
end

---@param unit string|any
---@return boolean
function DMC.UnitIsOutdoors(unit)
    return false
end

---@param unit string|any
---@return number
function DMC.UnitStandStateType(unit)
    return 0
end

---@param unit string|any
---@return number
function DMC.UnitHeight(unit)
    return 0
end

---@param src string
---@param dest string
function DMC.CopyFile(src, dest) end

---@param src string
---@param dest string
function DMC.CopyDirectory(src, dest) end

---@param unit string|any
---@return string
function DMC.UnitCreatedBy(unit)
    return ""
end

---DMC Draw Library
---@class DMC.Draw
DMC.Draw = {}

---@param wx number
---@param wy number
---@param wz number
---@return number|boolean sX, number|boolean sY
function DMC.Draw:WorldToScreen(wx, wy, wz) end

---@return number x, number y, number z, number rotX, number rotY
function DMC.Draw:CameraPosition() end

function DMC.Draw:Map(value, fromLow, fromHigh, toLow, toHigh) end

---@param r number 0-255
---@param g number 0-255
---@param b number 0-255
---@param a number|nil 0-255
function DMC.Draw:SetColor(r, g, b, a) end

---@param a number 0-255
function DMC.Draw:SetAlpha(a) end

---@param width number
function DMC.Draw:SetWidth(width) end

---@param hex string
---@return number r, number g, number b
function DMC.Draw:HexToRGB(hex)
    return 0, 0, 0
end

---@param ax number
---@param ay number
---@param az number
---@param bx number
---@param by number
---@param bz number
---@return number distance
function DMC.Draw:Distance(ax, ay, az, bx, by, bz)
    return 0
end

---@param ax number
---@param ay number
---@param bx number
---@param by number
---@return number distance
function DMC.Draw:Distance2D(ax, ay, bx, by)
    return 0
end

---@param cx number
---@param cy number
---@param cz number
---@param px number
---@param py number
---@param pz number
---@param r number
function DMC.Draw:RotateX(cx, cy, cz, px, py, pz, r) end

---@param cx number
---@param cy number
---@param cz number
---@param px number
---@param py number
---@param pz number
---@param r number
function DMC.Draw:RotateY(cx, cy, cz, px, py, pz, r) end

---@param cx number
---@param cy number
---@param cz number
---@param px number
---@param py number
---@param pz number
---@param r number
function DMC.Draw:RotateZ(cx, cy, cz, px, py, pz, r) end

---@param sx number
---@param sy number
---@param sz number
---@param ex number
---@param ey number
---@param ez number
function DMC.Draw:Line(sx, sy, sz, ex, ey, ez) end

---@param sx number
---@param sy number
---@param ex number
---@param ey number
function DMC.Draw:Line2D(sx, sy, ex, ey) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param steps number|nil
function DMC.Draw:Circle(x, y, z, radius, steps) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param steps number
function DMC.Draw:GroundCircle(x, y, z, radius, steps) end

---@param x number
---@param y number
---@param z number
---@param radius number
function DMC.Draw:FilledCircle(x, y, z, radius) end

---@param x number
---@param y number
---@param z number
---@param radius number
function DMC.Draw:Outline(x, y, z, radius) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param height number
function DMC.Draw:Cylinder(x, y, z, radius, height) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param arc number
---@param rot number
function DMC.Draw:Arc(x, y, z, radius, arc, rot) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param arc number
---@param rot number
function DMC.Draw:FilledArc(x, y, z, radius, arc, rot) end

---@param x number
---@param y number
---@param z number
---@param rot number
---@param size number
function DMC.Draw:Arrow(x, y, z, rot, size) end

---@param x number
---@param y number
---@param z number
---@param size number
function DMC.Draw:Cross(x, y, z, size) end

---@param x number
---@param y number
---@param z number
---@param width number
---@param length number
---@param rot number
---@param offsx number
---@param offsy number
function DMC.Draw:Rectangle(x, y, z, width, length, rot, offsx, offsy) end

---@param x number
---@param y number
---@param z number
---@param width number
---@param length number
---@param rot number
---@param offset number?
function DMC.Draw:FilledRectangle(x, y, z, width, length, rot, offset) end

---@param vectors table
---@param x number
---@param y number
---@param z number
---@param rotx number
---@param roty number
---@param rotz number
function DMC.Draw:Array(vectors, x, y, z, rotx, roty, rotz) end

---@param text string
---@param font string
---@param x number
---@param y number
---@param z number
---@param p number
function DMC.Draw:Text(text, font, x, y, z, p) end

---@param config table
---@param x number
---@param y number
---@param z number
---@param alphaA number
function DMC.Draw:Texture(config, x, y, z, alphaA) end

function DMC.Draw:ClearCanvas() end

function DMC.Draw:Update() end

function DMC.Draw:Helper() end

function DMC.Draw:Enable() end

function DMC.Draw:Disable() end

function DMC.Draw:Enabled() end

---@param callback function
function DMC.Draw:Sync(callback) end

---@param object table
function DMC.Draw:SetColorFromObject(object) end

---@param object table
function DMC.Draw:GetColorFromObject(object) end

---@param canvas DMC.Draw
---@return DMC.Draw
function DMC.Draw:New(canvas)
    return DMC.Draw
end
