---@meta _

---@class Daemonic
Daemonic = {}

---@alias DMC Daemonic
---@alias Daemonic.Object string
---@alias Daemonic.ObjectReference UnitToken|Daemonic.Object

---[Documentation](https://daemonic.cc/estore/daemonic-api/#SecureCode)<br>
---Example:
---```lua
---SecureCode("JumpOrAscendStart")
---```
---
---@param funcName string|function
---@param ... any
function Daemonic.SecureCode(funcName, ...) end

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
function Daemonic.InetRequest(method, url, parameters, headers) end

---@return string, number content, number statusCode
function Daemonic.InetGetRequest(id) end

---Returns if player is in world.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#IsInWorld)<br>
---Example:
---```lua
---if IsInWorld() then
---  print("Player is in world..")
---end
---```
---@return boolean
function Daemonic.IsInWorld() end

---Check if file exists in path.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#FileExists)<br>
---Example:
---```lua
---print(FileExists(GetExeDirectory() .. "Example.lua"))
---```
---@param filePath string
---@return boolean
function Daemonic.FileExists(filePath) end

---Returns Daemonic exe directory path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetExeDirectory)<br>
---Example:
---```lua
---print(GetExeDirectory())
---```
---@return string
function Daemonic.GetExeDirectory() end

---Shows the directory path of wow.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetWowDirectory)<br>
---Example:
---```lua
---print(GetWowDirectory())
---```
---@return string
function Daemonic.GetWowDirectory() end

---Checks if directory exists in specified path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DirectoryExists)<br>
---Example:
---```lua
---print(DirectoryExists(GetExeDirectory() .. "Example"))
----- or
---print(DirectoryExists(GetWowDirectory() .. "Example"))
---```
---@param dirPath string
---@return boolean
function Daemonic.DirectoryExists(dirPath) end

---Checks if path is writable.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#IsWritablePath)<br>
---Example:
---```lua
---print(IsWritablePath(GetExeDirectory() .. "Example"))
----- or
---print(IsWritablePath(GetWowDirectory() .. "Example"))
---```
---@param path string
---@return boolean
function Daemonic.IsWritablePath(path) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetUnitPosition)<br>
---Example:
---```lua
---local x, y, z = GetUnitPosition("player")
---print(x,y,z)
---```
---@param unit Daemonic.ObjectReference
---@return number x, number y, number z
function Daemonic.GetUnitPosition(unit) end

---Delete any targeted files in path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DeleteFile)<br>
---Example:
---```lua
---DeleteFile(GetExeDirectory() .. "example1.lua")
----- or
---DeleteFile(GetWowDirectory() .. "example2.lua")
---```
---@param path string
function Daemonic.DeleteFile(path) end

---Delete any targeted directory in path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DeleteDirectory)<br>
---Example:
---```lua
---DeleteDirectory(GetExeDirectory() .. "example1")
----- or
---DeleteDirectory(GetWowDirectory() .. "example2")
---```
---@param path string
function Daemonic.DeleteDirectory(path) end

---Encrypt AutoLoad files for Daemonic client.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#EncryptAutoLoad)<br>
---Example:
---```lua
---EncryptAutoLoad(GetExeDirectory() .. "files\\inputFile.lua", GetExeDirectory() .. "files\\outputFile.lua")
---```
---@param inputFilePath string
---@param outputFilePath string
function Daemonic.EncryptAutoLoad(inputFilePath, outputFilePath) end

---Encrypt string using any of the three different encryption types shown below.<br>
---Note: Key must be 32 character length. Third and Fourth parameters (type & iv) are optional (type by default is 3). If (iv) is defined, type must be defined as well.<br>
---Types: 
---  1. Encryption + Random Key; 
---  2. Encryption + Compression + Key; 
---  3. AES 256 Encryption + Key (default);<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#EncryptString)<br>
---Example:
---```lua
----- Simple example
---print(EncryptString("test", "12345678901234567890123456789012"))
---
----- Advanced
---EncryptFile = function(inputFile, outputFile, Key)
---   S = EncryptString(ReadFile(inputFile), Key)
---   WriteFile(outputFile, S, false)
---end
---
---EncryptFile(GetExeDirectory() .. "inputFile.lua", GetExeDirectory() .. "outputFile.lua",  "12345678901234567890123456789012") 
----- Result is AES 256 encrypted outputFile.lua
---```
---@param msg string
---@param key string
---@param type number?
---@param iv string?
---@return string
function Daemonic.EncryptString(msg, key, type, iv) end

---Hash string using any of the three different Hash types as shown below.<br>
---Types: 
--- 1. MD5
--- 2. SHA1
--- 3. SHA256 (default)<br>
---
---[Documentation](https://daemonic.cc/estore/daemonic-api/#HashString)<br>
---Example:
---```lua
----- Simple example
---print(HashString("test", 3)) -- SHA256
---
----- Advanced
---HashFile = function(inputFile, Type)
---   S = HashString(ReadFile(inputFile), Type)
---   return S
---end
---
---print(HashFile(GetExeDirectory() .. "inputFile.lua",  3)) 
----- Result is SHA256 hashed inputFile.lua
---```
---@param msg string
---@param type number
---@return string
function Daemonic.HashString(msg, type) end

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
function Daemonic.TraceLine(sx, sy, sz, ex, ey, ez, flags) end

---Lists files in directory..<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetDirectoryFiles)<br>
---Example:
---```lua
---print(GetDirectoryFiles(GetExeDirectory() .. "Example", "*"))
---```
---@param directory string
---@param pattern string
---@return string @all files with `|` delimeter
function Daemonic.GetDirectoryFiles(directory, pattern) end

---Lists folders in directory.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetDirectoryFolders)<br>
---Example:
---```lua
---print(GetDirectoryFolders(GetExeDirectory() .. "Test\\", "*"))
---```
---@param path string
---@param pattern string
---@return string @all files with `|` delimeter
function Daemonic.GetDirectoryFolders(path, pattern) end

---Reads file and returns its content.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ReadFile)<br>
---Example:
---```lua
---ReadFile(GetExeDirectory() .. "example1.lua")
----- or
---ReadFile(GetWowDirectory() .. "example2.lua")
---```
---@param filePath string path to a file
---@return string @File's content
function Daemonic.ReadFile(filePath) end

---Returns the count of all world objects, as well as the changes compared to the last call.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetObjectCount)<br>
---Example:
---```lua
---print(GetObjectCount())
---```
---@return number
function Daemonic.GetObjectCount() end

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
---@see Daemonic.GetObjectCount
---@param index number
---@return Daemonic.Object unit
function Daemonic.GetObjectWithIndex(index) end

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
---@param unit Daemonic.ObjectReference
---@param offset number
---@param type number
function Daemonic.ObjectField(unit, offset, type) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitPitch("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitPitch(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitSummonedBy("target")
---```
---@param unit Daemonic.ObjectReference
---@return Daemonic.Object
function Daemonic.UnitSummonedBy(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitCreatedBy("target")
---```
---@param unit Daemonic.ObjectReference
---@return Daemonic.Object
function Daemonic.UnitCreatedBy(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitTarget("target")
---```
---@param unit Daemonic.ObjectReference
---@return Daemonic.Object
function Daemonic.UnitTarget(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitHeight("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitHeight(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitFlags("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitHeight2("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitFlags2(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitHeight3("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitFlags3(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitNpcFlags("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitNpcFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitBoundingRadius("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitBoundingRadius(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitCombatReach("target")
---```
---@param unit Daemonic.ObjectReference
---@return any
function Daemonic.UnitCombatReach(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitDynamicFlags("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitDynamicFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitAnimationFlags("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitAnimationFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsSkinnable("target")
---```
---@param unit Daemonic.ObjectReference
---@return boolean
function Daemonic.UnitIsSkinnable(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsLootable("target")
---```
---@param unit Daemonic.ObjectReference
---@return boolean
function Daemonic.UnitIsLootable(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitCastingTarget("target")
---```
---@param unit Daemonic.ObjectReference
---@return Daemonic.Object
function Daemonic.UnitCastingTarget(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsMounted("target")
---```
---@param unit Daemonic.ObjectReference
---@return boolean
function Daemonic.UnitIsMounted(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsOutdoors("target")
---```
---@param unit Daemonic.ObjectReference
---@return boolean
function Daemonic.UnitIsOutdoors(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsSubmerged("target")
---```
---@param unit Daemonic.ObjectReference
---@return boolean
function Daemonic.UnitIsSubmerged(unit) end

---Returns the unit stand state type.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitStandStateType)<br>
---Example:
---```lua
---STAND = 0,
---SIT = 1,
---SIT_CHAIR = 2,
---SLEEP = 3,
---SIT_LOW_CHAIR = 4,
---SIT_MEDIUM_CHAIR = 5,
---SIT_HIGH_CHAIR = 6,
---DEAD = 7,
---KNEEL = 8,
---SUBMERGED = 9,
---UnitStandStateType("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitStandStateType(unit) end

---Sends a heartbeat packet to the server.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SendMovementHeartbeat)<br>
---Example:
---```lua
---FaceDirection(angle, false)
---SendMovementHeartbeat()
---```
function Daemonic.SendMovementHeartbeat() end

---Take screenshot of wow window and save it near unlocker exe.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetScreenshot)<br>
---Example:
---```lua
---GetScreenshot() -- Will save the screenshot with the following format: MMDDYY_HHMMSS_mapID_X_Y_Z
---GetScreenshot(GetExeDirectory() .. "GatherBot.jpg") -- Will save the screenshot under the name of "GatherBot" in the provided path
---```
---@param filepath string? Filename format: MMDDYY_HHMMSS_mapID_X_Y_Z
function Daemonic.GetScreenshot(filepath) end

---Minimizes WoW window.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#MinimizeWindow)<br>
---Example:
---```lua
---MinimizeWindow()
---```
function Daemonic.MinimizeWindow() end

---Returns the raw position of unit.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetUnitRawPosition)<br>
---Example:
---```lua
---local x, y, z = GetUnitRawPosition("player")
---print(x,y,z)
---```
---@param unit Daemonic.ObjectReference
---@return number x, number y, number z
function Daemonic.GetUnitRawPosition(unit) end

---Returns the raw direction a unit is facing.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitRawFacing)<br>
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitRawFacing(unit) end

---Clears current target.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ClearTargetUnit)<br>
---Example:
---```lua
---ClearTargetUnit()
---```
function Daemonic.ClearTargetUnit() end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsSitting("target")
---```
---@param unit Daemonic.ObjectReference
---@return boolean
function Daemonic.UnitIsSitting(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitSpecializationID("target")
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitSpecializationID(unit) end


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
function Daemonic.IsGUID(guid) end

---Returns the display name of a unit.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectName)<br>
---Example:
---```lua
---print(ObjectName("player"))
---```
---@param unit Daemonic.ObjectReference
---@return string Name
function Daemonic.ObjectName(unit) end

---Returns the id of an object.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectID)<br>
---Example:
---```lua
---for i = 1, GetObjectCount(), 1 do
---   local guid = GetObjectWithIndex(i)
---   if ObjectType(guid) == 8 then
---      print(ObjectName(guid), GameObjectType(guid), ObjectID(guid))
---   end
---end
---```
---@param unit Daemonic.ObjectReference
---@return number ID
function Daemonic.ObjectID(unit) end

---Returns the number of missiles.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetMissileCount)<br>
---Example:
---```lua
---print(GetMissileCount())
---```
---@return number
function Daemonic.GetMissileCount() end

---Returns the info of a specific missile.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetMissileWithIndex)<br>
---Example:
---```lua
---local draw = Draw:New()
---DrawMissiles = function()
---   local missileCount = GetMissileCount()
---   draw:ClearCanvas()
---   draw:SetColor(0, 255, 0, 255)
---   if missileCount ~= 0 then
---      for i = 1, missileCount do
---         local spellID, spellVisualID, x, y, z, caster, sx, sy, sz, target, tx, ty, tz = GetMissileWithIndex(i)
---         local facing = GetAngles(sx, sy, sz, x, y, z)
---         if facing ~= 0 then
---            draw:Arrow(x, y, z, facing, 2)
---            draw:Text("Missile", "GameFontNormal", x, y, z)
---         end
---      end
---   end
---   C_Timer.After(0.01, DrawMissiles)
---end
---
---DrawMissiles()
---```
---@param index number
---@return number spellID, number spellVisualID, number x, number y, number z, string caster, number sx, number sy, number sz, string target, number tx, number ty, number tz
function Daemonic.GetMissileWithIndex(index) end

---Returns unit type.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectType)<br>
---Types:
---```lua
---Object = 0
---Item = 1
---Container = 2
---AzeriteEmpoweredItem = 3
---AzeriteItem = 4
---Unit = 5
---Player = 6
---ActivePlayer = 7
---GameObject = 8
---DynamicObject = 9
---Corpse = 10
---AreaTrigger = 11
---SceneObject = 12
---Conversation = 13
---AiGroup = 14
---Scenario = 15
---Loot = 16
---Invalid = 17
---```
---Example:
---```lua
---print(ObjectType("player"))
---```
---@param unit Daemonic.ObjectReference
---@return number Type
function Daemonic.ObjectType(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitCreatureTypeId)<br>
---Types:
---```lua
---Beast = 1
---Dragonkin = 2
---Demon = 3
---Elemental = 4
---Giant = 5
---Undead = 6
---Humanoid = 7
---Critter = 8
---Mechanical = 9
---Not-specified = 10
---Totem = 11
---Non-combat Pet = 12
---Gas Cloud = 13
---Wild Pet = 14 -- Retail Only
---Aberration = 15 -- Retail Only
---```
---Example:
---```lua
---print(UnitCreatureTypeId("target"))
---```
---@param unit Daemonic.ObjectReference
---@return number CreatureType
function Daemonic.UnitCreatureTypeId(unit) end

---Wipes string from game memory.
---[Docuementation](https://daemonic.cc/estore/daemonic-api/#WipeString)<br>
---Example:
---```lua
---local key = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456"
---WipeString(key)
---key = nil
---```
---@return string
function Daemonic.WipeString(str) end

---Returns the count of auras (including hidden ones).<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetAuraCount)<br>
---Example:
---```lua
---local count = GetAuraCount('player')
---print(count)
---```
---@param unit Daemonic.ObjectReference
---@param spellID number?
---@return number
function Daemonic.GetAuraCount(unit, spellID) end

---Returns the spellID, count, duration and expiration time of a specific aura.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetAuraWithIndex)<br>
---Example:
---```lua
---local count = GetAuraCount('player')
---if count then
---   for i = 1, count do
---      local splId, count, duration, expirationTime = GetAuraWithIndex(i)
---      local splName = GetSpellInfo(splId)
---      local dispelType = GetSpellDispelType(splId)
---      print(i, splName, splId, count, dispelType, duration, expirationTime)
---   end
---end
---```
---@param i number
---@return number spellID, number count, number duration, number expirationTime
function Daemonic.GetAuraWithIndex(i) end

---Returns dispel type.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetSpellDispelType)<br>
---Example:
---```lua
---local dispelName, dispelID = GetSpellDispelType(spellID)
---```
---@param spellID number
---@return string dispelName, number dispelID
function Daemonic.GetSpellDispelType(spellID) end

---Returns dragon riding horizontal and vertical speed. Read Only.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetDragonridingSpeed)<br>
---Example:
---```lua
---local horizontalMomentum, verticalMomentum = GetDragonridingSpeed("player")
---```
---@param unit Daemonic.ObjectReference
---@return number horizontalMomentum, number verticalMomentum
function Daemonic.GetDragonridingSpeed(unit) end

---Returns the transport the unit is moving on.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectMover)<br>
---Example:
---```lua
---print(ObjectMover('player'))
---print(ObjectName(ObjectMover('player')))
---print(GetUnitPosition(ObjectMover('player')))
---```
---@param unit Daemonic.ObjectReference
---@return Daemonic.Object
function Daemonic.ObjectMover(unit) end

---Sets any data for any given offset.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetObjectField)<br>
---Example:
---```lua
---SetObjectField("player", 0x11C, 10, 1.5) -- Will set player pitch to 1.5 (Retail)
---```
---@param unit Daemonic.ObjectReference
---@param offset number
---@param type number
---@param data number
function Daemonic.SetObjectField(unit, offset, type, data) end

---Returns wow game expansion.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GameExpansion)<br>
---Example:
---```lua
---print(GameExpansion()) -- returns Retail, Classic, Classic_Era
---```
---@return string
function Daemonic.GameExpansion() end

---Encrypt luaCode to be used with the following APIs:<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#EncryptCode)<br>
---Example:
---```lua
---local codes = EncryptCode("print('test')")
---LoadStringEnc(codes)()
---```
---@see Daemonic.LoadStringEnc
---@see Daemonic.RequireCodeEnc
---@see Daemonic.RequireFileEnc
---@param luaCode string
---@return string
function Daemonic.EncryptCode(luaCode) end

---Runs lua codes provided in the code parameter.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#RequireCode)<br>
---Example:
---```lua
----- res1: Return code running status (true or false).
----- res2: Returned data by code or error information or nil.
----- debugname: Will be displayed in errors, e.g: file name.
----- variables: Will be passed to the codes by order.
---
----- Usage Example:
---
---local var1 = 1000
---local code = "local var1 = ...; var1 = var1 + 1; return var1;"
---local res1, res2 = RequireCode(code, "testcode", var1)
---if res1 then
---  print("result is:", res2)
---else
---  print("error is:", res2)
---end
---```
---@param code string
---@param debugname string?
---@param ... any
---@return boolean status, any dataOrErr 
function Daemonic.RequireCode(code, debugname, ...) end

---Runs encrypted lua codes provided in the code parameter which is encrypted using [EncryptCode](lua://Daemonic.EncryptCode).<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#RequireCodeEnc)<br>
---@param encryptedCode string
---@param debugname string?
---@param ... any
---@return boolean status, any dataOrErr
function Daemonic.RequireCodeEnc(encryptedCode, debugname, ...) end

---Loads encrypted string from [EncryptCode](lua://Daemonic.EncryptCode) API<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#LoadStringEnc)
---@see Daemonic.EncryptCode
---@param encryptedString string
---@param debugName string
---@return function
function Daemonic.LoadStringEnc(encryptedString, debugName) end

---Runs lua file provided in the file parameter.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#RequireFile)<br>
---Example: 
---```lua
----- res1: Return code running status (true or false).
----- res2: Returned data by code or error information or nil.
----- variables: Will be passed to the codes by order.
----- File path must be relative and only from client directory and sub directories.
---
----- Usage Example:
---  
---local mybot = {}
---local res1, res2 = RequireFile("file.lua", mybot)
---```
---@param file string
---@param ... any
---@return boolean status, any dataOrErr
function Daemonic.RequireFile(file, ...) end

---Runs encrypted lua file provided in the file parameter which is encrypted using [EncryptCode](lua://Daemonic.EncryptCode)<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#RequireFileEnc)<br>
---Example:
---```lua
----- res1: Return code running status (true or false).
----- res2: Returned data by code or error information or nil.
----- variables: Will be passed to the codes by order.
----- File path must be relative and only from client directory and sub directories.
---
----- Usage Example:
---  
---local mybot = {}
---local res1, res2 = RequireFileEnc("encryptedfile.lua", mybot)
---```
---@param file string
---@param ... any
---@return boolean status, any dataOrErr
function Daemonic.RequireFileEnc(file, ...) end

---Encode lua table to json string.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#JsonEncode)<br>
---Example:
---```lua
---local tbl = {sale = true}
---print(JsonEncode(tbl))
---```
---@param data any
---@return string
function Daemonic.JsonEncode(data) end

---Decode json string to lua table.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#JsonDecode)<br>
---Example:
---```lua
---local tbl = JsonDecode('{"sale":true}')
---if tbl.sale then
---  print('sale is true')
---else
---  print('sale is false')
---end
---```
---@param str string
---@return any
function Daemonic.JsonDecode(str) end

---Returns actual widow size.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GameWindowSize)
---@return number width, number height, any scale
function Daemonic.GameWindowSize() end

---Description: Returns different camera data.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetCameraData)<br>
---@return number camX, number camY, number camZ, any matrixYX, any matrixYY, any matrixYZ, any matrixZX, any matrixZY, any matrixZZ, any matrixXX, any matrixXY, any matrixXZ, number camFov, number camYaw, number camPitch, number camRoll
function Daemonic.GetCameraData() end

---Data compression.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#CompressString)<br>
---Example:
---```lua
---local data = CompressString("Text to compress")
---if DecompressString(data) == "Text to compress" then
--- print("Decompress is ok")
---end
---```
---@param str string
---@return string
function Daemonic.CompressString(str) end

---Data decompression.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DecompressString)<br>
---Example:
---```lua
---local data = CompressString("Text to compress")
---if DecompressString(data) == "Text to compress" then
--- print("Decompress is ok")
---end
---```
---@param compressedString string
---@return string
function Daemonic.DecompressString(compressedString) end

---Decrypt and loads lua string<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DecryptAndLoadString)<br>
---Example:
---```lua
---Loader = DecryptAndLoadString("EpAzxgPMY8vftN8gZlR1N38krVgr38bCoJxls0f3Hcy0GQxv1pSenPF/iTit4GTRZZ2rY1Ed5sgVUosPdn12UA==", "12345678901234567890123456789012")
---Loader() -- will print TEST after two seconds
---```
---@param content string
---@param key string
---@param type number
---@param iv string?
---@param debugName string?
---@return function
function Daemonic.DecryptAndLoadString(content, key, type, iv, debugName) end

---Calling this will make your player not go AFK.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ResetAfk)<br>
---Example:
---```lua
---local function AntiAFK()
---   ResetAfk()
---   C_Timer.After(60, AntiAFK)
---end
---AntiAFK()
---```
function Daemonic.ResetAfk() end

---Checks if game is active and foregrounded<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#IsWindowActive)<br>
---Example:
---```lua
---print(IsWindowActive())
---```
---@return boolean
function Daemonic.IsWindowActive() end

---Force window to foreground.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ActivateWindow)<br>
---Example:
---```lua
---C_Timer.After(5, function()
---    ActivateWindow()
---end)
---```
function Daemonic.ActivateWindow() end

---Plays .wave sound.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#PlayWinSound)<br>
---Example:
---```lua
---PlayWinSound(GetExeDirectoy() .. "start.wav")
---```
---@param waveFilePath string
function Daemonic.PlayWinSound(waveFilePath) end

---Decrypt string.<br>
---Note: Key must be 32 character length. Third and Fourth parameters (type & iv) are optional (type by default is 3). If (iv) is defined, type must be defined as well.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DecryptString)<br>
---Example:
---```lua
---DecryptFile = function(inputFile, outputFile, Key)
---   S = DecryptString(ReadFile(inputFile), Key)
---   WriteFile(outputFile, S, false)
---end
---
---DecryptFile(GetExeDirectory() .. "outputFile.lua", GetExeDirectory() .. "outputFile2.lua",  "12345678901234567890123456789012") 
----- Result is decrypted outputFile2.lua
---```
---@param string string
---@param key string
---@param type number
---@param iv string
---@return string
function Daemonic.DecryptString(string, key, type, iv) end

---Loads lua string.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#LoadString)<br>
---Example:
---```lua
---Loader = LoadString("C_Timer.After(2, function() print('TEST') end)")
---Loader() -- will print TEST after two seconds
---```
---@param content string
---@return function
function Daemonic.LoadString(content) end

---Returns a unique ID per game process. This ID is fixed until the game process is closed.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetSessionID)<br>
---Example:
---```lua
---print(GetSessionID())
---```
---@return string
function Daemonic.GetSessionID() end

---Returns the current session index.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetSessionIndex)<br>
---Example:
---```lua
---local sidx = GetSessionIndex()
---print(sidx)
---```
---@return number
function Daemonic.GetSessionIndex() end

---Reads raw memory of any address.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ReadMemory)<br>
---Types:
---```lua
----- Lua Types
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
---Example:
---```lua
---print(ReadMemory(0x12345678, 0, 14))
---```
---@param memAddress number
---@param offset number
---@param type number
function Daemonic.ReadMemory(memAddress, offset, type) end

---Returns unit movement flags.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetUnitMovementFlags)<br>
---Flags:
---```lua
---Forward = 0x1
---Backward = 0x2
---StrafeLeft = 0x4
---StrafeRight = 0x8
---TurnLeft = 0x10
---TurnRight = 0x20
---PitchUp = 0x40
---PitchDown = 0x80
---Walking = 0x100
---Immobilized = 0x400
---Falling = 0x800
---FallingFar = 0x1000
---Swimming = 0x100000
---Ascending = 0x200000
---Descending = 0x400000
---CanFly = 0x800000
---Flying = 0x1000000
---```
---
---Example:
---```lua
---print(GetUnitMovementFlags("player"))
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.GetUnitMovementFlags(unit) end

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
function Daemonic.IsSpellPending() end

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
function Daemonic.CancelPendingSpell() end

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
function Daemonic.ClickPosition(x, y, z) end

---Returns 3D distance between two units/objects.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetDistance3D)<br>
---Example:
---```lua
---GetDistance3D("player", "target")
---```
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@overload fun(unit1:Daemonic.ObjectReference, unit2:Daemonic.ObjectReference):number
---@return number
function Daemonic.GetDistance3D(x1, y1, z1, x2, y2, z2) end

---Returns player tile x,y coordinates.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetTileByPosition)<br>
---Example:
---```lua
---local x, y, z = GetUnitPosition("player")
---print(GetTileByPosition(x,y,z))
---```
---@param x number
---@param y number
---@param z number
---@return number x, number y
function Daemonic.GetTileByPosition(x, y, z) end

---Unload maps from memory.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnloadMaps)<br>
---```lua
---UnloadMaps()
---```
function Daemonic.UnloadMaps() end

---Kills your session process.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#KillSession)<br>
---```lua
---KillSession()
---```
function Daemonic.KillSession() end

---Returns status of Daemonic product.<br>
---[Docuementation](https://daemonic.cc/estore/daemonic-api/#GetProductStatus)<br>
---Example:
---```lua
----- 1: Retail
----- 2: Wotlk & Era (Classic)
---
---print(GetProductStatus(1) == 0) -- returns true if you are using Daemonic Retail
---```
---@param productNumber number
---@return boolean
function Daemonic.GetProductStatus(productNumber) end

---Create a directory in specified path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#CreateDirectory)<br>
---Example:
---```lua
---CreateDirectory(GetExeDirectory() .. "Example")
----- or
---CreateDirectory(GetWowDirectory() .. "Example")
---```
---@param path string
function Daemonic.CreateDirectory(path) end

---Writes a string to a file.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#WriteFile)<br>
---Example:
---```lua
---WriteFile(GetExeDirectory() .. "example1.lua", "example1", false)
----- or
---WriteFile(GetWowDirectory() .. "example2.lua", "example2", false)
---```
---@param path string
---@param content string
---@param append boolean
---@overload fun(path:string,content:string)
function Daemonic.WriteFile(path, content, append) end

---Renames a file.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#RenameFile)<br>
---Example:
---```lua
---RenameFile(GetExeDirectory() .. "example1.lua", GetExeDirectory() .. "example2.lua")
----- or
---RenameFile(GetWowDirectory() .. "example2.lua", GetWowDirectory() .. "example1.lua")
---```
---@param currentName string
---@param newName string
function Daemonic.RenameFile(currentName, newName) end

---Hash string using any of the three different Hash types as shown below.<br>
---Types: 
--- 1. HMAC-MD5
--- 2. HMAC-SHA1
--- 3. HMAC-SHA256 (default)<br>
---
---[Documentation](https://daemonic.cc/estore/daemonic-api/#HmacString)<br>
---Example:
---```lua
----- Simple example
---print(HmacString("test", "12345678901234567890123456789012", 3)) -- HMAC-SHA256
---
----- Advanced
---HmacFile = function(inputFile, Key)
---   S = HmacString(ReadFile(inputFile), Key)
---   return S
---end
---
---print(HmacFile(GetExeDirectory() .. "inputFile.lua", "12345678901234567890123456789012")) 
----- Result is HMAC-SHA256 inputFile.lua
---```
---@param string string
---@param key string
---@param type number?
---@return string
function Daemonic.HmacString(string, key, type) end

---Encode string to Base64.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#Base64EncodeString)<br>
---Example:
---```lua
---print(Base64EncodeString("Test"))
---```
---@param str string
---@return string
function Daemonic.Base64EncodeString(str) end

---Decode Base64 string.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#Base64DecodeString)<br>
---Example:
---```lua
---print(Base64DecodeString("VGVzdA=="))
---```
---@param str string
---@return string
function Daemonic.Base64DecodeString(str) end

---Decrypt and runs encrypted string.<br>
---Types: 
--- 1. Encryption + Random Key
--- 2. Encryption + Compression + Key
--- 3. AES 256 Encryption + Key (default)<br>
---
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DecryptAndRunString)<br>
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
---   if status == 200 then
---      DecryptAndRunString(res,"12345678901234567890123456789012") -- default type (3)
---   else
---      print("Wrong Status '" .. status .. "' in response!")
---   end
---end
---
---print("Try to run codes from the web (Jump)")
---httpAsync(
---  "GET", 
---  "daemonic.cc/downloads/test.txt", -- DO NOT USE PROTOCOL BEFORE THE DOMAIN
---  "", 
---  "", 
---  httpHandler)
---```
---@param str string
---@param key string
---@param type number?
function Daemonic.DecryptAndRunString(str, key, type) end

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
function Daemonic.WorldToScreen(x, y, z) end

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
function Daemonic.ScreenToWorld(x, y, flags) end

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
---@param unit Daemonic.ObjectReference
---@return boolean
function Daemonic.ObjectIsQuestObjective(unit) end

---Sets a unit as a target.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetTargetUnit)<br>
---Example:
---```lua
---SetTargetUnit("player")
---```
---@param unit Daemonic.ObjectReference
function Daemonic.SetTargetUnit(unit) end

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
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitFacing(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitScale)<br>
---Example:
---```lua
---print(UnitScale('target'))
---```
---@param unit Daemonic.ObjectReference
---@return number
function Daemonic.UnitScale(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetKeyState)<br>
---Example:
---```lua
---local isAltDown = (GetKeyState("LALT") == 1)
---print(isAltDown)
---```
---@param key string
---@return number
function Daemonic.GetKeyState(key) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetWowAccountId)<br>
---Example:
---```lua
---print(GetWowAccountId())
---```
---@return any, any, any
function Daemonic.GetWowAccountId() end

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
---@overload fun(unit1:Daemonic.ObjectReference, unit2:Daemonic.ObjectReference):facing:number, pitcher:number
---@return number facing, number pitch
function Daemonic.GetAngles(x1, y1, z1, x2, y2, z2) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetCameraRotation)<br>
---Example:
---```lua
---local x, y, z = GetCameraRotation()
---print(x,y,z)
---```
---@return number x, number y, number z
function Daemonic.GetCameraRotation() end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetCameraRotation)<br>
---Example:
---```lua
---SetCameraRotation(0, 0, 0)
---```
---@param x number
---@param y number
---@param z number
function Daemonic.SetCameraRotation(x, y, z) end

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
function Daemonic.FaceDirection(radians, update) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetPitch)<br>
---Example:
---```lua
---SetPitch(1.5)
---```
---@param radians number
function Daemonic.SetPitch(radians) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#Interact)<br>
---Example
---```lua
---Interact("target")
----- or 
---local guid = UnitGUID("target")
---Interact(guid)
---```
---@param unit Daemonic.ObjectReference
function Daemonic.Interact(unit) end

---Clicks to move.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#MoveTo)<br>
---Example:
---```lua
---local x, y, z = GetUnitPosition("target")
---MoveTo(x, y, z)
---```
---@param x number
---@param y number
---@param z number
function Daemonic.MoveTo(x, y, z) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetCorpsePosition)<br>
---Example: 
---```lua
---local x, y, z = GetCorpsePosition()
---print(x,y,z)
---```
---@return number x, number y, number z
function Daemonic.GetCorpsePosition() end

---Finds a path between two positions for the given map ID<br>
---Note: By default, it will not swim in all liquids. To make it swim add a “true” parameter to end of FindPath parameters.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#FindPath)<br>
---Example:
---```lua
---function navToTarget()
---   local px, py, pz = GetUnitPosition('player')
---   local tx, ty, tz = GetUnitPosition('target')
---   local mapId = GetMapID()
---   local PathCnt = FindPath(mapId, px, py, pz, tx, ty, tz)
---   if PathCnt == nil then
---      print('Invalid or nil arguments!')
---      return
---   end
---   if PathCnt == 0 then
---      print('Navigation Finished.')
---      return
---   end
---   if PathCnt == -1 then
---      print('Map files not exists or invalid!')
---      return
---   end
---   if PathCnt == -2 then
---      print('Out of memeory!')
---      return
---   end
---   if PathCnt == -3 then
---      print('Map caching...')
---   else
---      MoveTo(GetPathNode(2))
---   end
---   C_Timer.After(0.04, navToTarget)
---end
---navToTarget()
---```
---@param mapID number
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param swim boolean?
---@return number|nil
function Daemonic.FindPath(mapID, x1, y1, z1, x2, y2, z2, swim) end

---Returns a path with path index.<br>
---Note: By default, it will not swim in all liquids. To make it swim add a “true” parameter to end of FindPath parameters.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetPathNode)<br>
---Example:
---```lua
---function navToTarget()
---   local px, py, pz = GetUnitPosition('player')
---   local tx, ty, tz = GetUnitPosition('target')
---   local mapId = GetMapID()
---   local PathCnt = FindPath(mapId, px, py, pz, tx, ty, tz)
---   if PathCnt == nil then
---      print('Invalid or nil arguments!')
---      return
---   end
---   if PathCnt == 0 then
---      print('Navigation Finished.')
---      return
---   end
---   if PathCnt == -1 then
---      print('Map files not exists or invalid!')
---      return
---   end
---   if PathCnt == -2 then
---      print('Out of memeory!')
---      return
---   end
---   if PathCnt == -3 then
---      print('Map caching...')
---   else
---      MoveTo(GetPathNode(2))
---   end
---   C_Timer.After(0.04, navToTarget)
---end
---navToTarget()
---```
---@param index number
---@return number x, number y, number z
function Daemonic.GetPathNode(index) end

---Changes the default maps locations to any path you set.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetMapsPath)
---Example:
---```lua
---SetMapsPath("C:\\Maps\\")
---```
---@param path string
function Daemonic.SetMapsPath(path) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetCameraPosition)<br>
---Example:
---```lua
---local x, y, z = GetCameraPosition()
---print(x,y,z)
---```
---@return number x, number y, number z
function Daemonic.GetCameraPosition() end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetLastClickPosition)<br>
---Example:
---```lua
---local x, y, z = GetLastClickPosition()
---print(x,y,z)
---```
---@return number x, number y, number z
function Daemonic.GetLastClickPosition() end

---Returns current MapID.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetMapID)<br>
---Example:
---```lua
---print(GetMapID())
---```
---@return number
function Daemonic.GetMapID() end

---Moves and resizes game window to desired screen coordinates and size.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#MoveWindow)<br>
---Example:
---```lua
---MoveWindow(0, 0) -- will move window to top left
---
---MoveWindow(0, 0, 1360, 768) -- will move window to top left and resize window to 1360x768
---```
---@param x number
---@param y number
---@param w number?
---@param h number?
function Daemonic.MoveWindow(x, y, w, h) end

---Returns unit effect spellID and location (x,y,z).<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitEffect)<br>
---Example:
---```lua
---local x, y, z, spellID = UnitEffect(unit)
---```
---@param unit Daemonic.ObjectReference
---@return number x, number y, number z, number spellID
function Daemonic.UnitEffect(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GameObjectType)<br>
---Types:
---```lua
---Door = 0
---Button = 1
---Questgiver = 2
---Chest = 3 -- Herbs, Minerals, Chests
---Binder = 4
---Generic = 5
---Trap = 6
---Chair = 7
---SpellFocus = 8
---Text = 9
---Goober = 10
---TransportElevator = 11
---AreaDamage = 12
---Camera = 13
---Mapobject = 14
---MoTransportShip = 15
---DuelFlag = 16
---FishingNode = 17
---Ritual = 18
---Mailbox = 19
---DONOTUSE1 = 20
---GuardPost = 21
---SpellCaster = 22
---MeetingStone = 23
---FlagStand = 24
---FishingHole = 25
---FlagDrop = 26
---DONOTUSE2 = 27
---DONOTUSE3 = 28
---ControlZone = 29
---AuraGenerator = 30
---DungeonDifficulty = 31
---BarberChair = 32
---DestructibleBuilding = 33
---GuildBank = 34
---Trapdoor = 35
---Newflag = 36
---Newflagdrop = 37
---GarrisonBuilding = 38
---GarrisonPlot = 39
---ClientCreature = 40
---ClientItem = 41
---CapturePoint = 42
---PhaseableMO = 43
---GarrisonMonument = 44
---GarrisonShipment = 45
---GarrisonMonumentPlaque = 46
---ItemForge = 47
---UILink = 48
---KeystoneReceptacle = 49
---GatheringNode = 50
---ChallengeModeReward = 51
---Multi = 52
---SeigableMulti = 53
---SeigableMo = 54
---PvpReward = 55
---PlayerChoiceChest = 56
---LegendaryForge = 57
---GearTalentTree = 58
---WeeklyRewardChest = 59
---ClientModel = 60
---```
---Example:
---```lua
---for i = 1, GetObjectCount(), 1 do
---   local guid = GetObjectWithIndex(i)
---   if ObjectType(guid) == 8 then
---      print(ObjectName(guid), GameObjectType(guid))
---   end
---end
---```
---@param unit Daemonic.ObjectReference
---@return number type
function Daemonic.GameObjectType(unit) end

---Checks if object exits.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectExists)<br>
---Example:
---```lua
---print(ObjectExists("target"))
---```
---@param unit Daemonic.ObjectReference
---@return boolean exists
function Daemonic.ObjectExists(unit) end

---Sets text to clipboard.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetClipboardText)<br>
---Example:
---```lua
---SetClipboardText("Test")
---```
---@param text string
function Daemonic.SetClipboardText(text) end

---Returns text from clipboard.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetClipboardText)<br>
---Example:
---```lua
---print(GetClipboardText())
---```
---@return string
function Daemonic.GetClipboardText() end

---Returns 2D distance between units/objects.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetDistance2D)<br>
---Example:
---```lua
---GetDistance2D("player", "target")
---```
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@overload fun(unit1:Daemonic.ObjectReference, unit2: Daemonic.ObjectReference):number
---@return number
function Daemonic.GetDistance2D(x1, y1, z1, x2, y2, z2) end

---Copies file from source path to destination.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#CopyFile)<br>
---Example:
---```lua
---CopyFile(GetExeDirectory() .. "file.lua", GetWowDirectory() .. "Interface\\AddOns\\file.lua")
---```
---@param src string
---@param dest string
function Daemonic.CopyFile(src, dest) end

---Copies directory and all included files and sub directories from source path to destination.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#CopyDirectory)<br>
---Example:
---```lua
---CopyDirectory(GetExeDirectory() .. "MyAddonFolder", GetWowDirectory() .. "Interface\\AddOns\\MyAddonFolder")
---```
---@param src string
---@param dest string
function Daemonic.CopyDirectory(src, dest) end

---Removes directory and all included files and sub directories.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#RemoveDirectory)<br>
---Example:
---```lua
---RemoveDirectory(GetExeDirectory() .. "MyAddonFolder")
---```
---@param path string
function Daemonic.RemoveDirectory(path) end

---Gets hardware ID.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetHWID)<br>
---Example:
---```lua
---print(GetHWID())
---```
---@return string
function Daemonic.GetHWID() end

---Prevent screenshots and recordings.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#EnableAntiCapture)<br>
---Example:
---```lua
---EnableAntiCapture()
---```
function Daemonic.EnableAntiCapture() end

---Finds closest point on mesh at a given threshold.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#FindClosestPointOnMesh)<br>
---Example:
---```lua
---local tx, ty, tz = GetUnitPosition('target')
---local mapId = GetMapID()
---local res, x, y, z = FindClosestPointOnMesh(mapId, tx, ty, tz, 0, 0, 200)
---if res == nil then
---  print('Invalid or nil arguments!')
---elseif res == 0 then
---  print('Not found any closest point!')
---elseif res == -1 then
---  print('Map files not exists or invalid!')
---elseif res == -2 then
---  print('Out of memeory!')
---elseif res == -3 then
---  print('Map caching...')
---else
---  print(x, y, z)
---end
---```
---@param mapid number
---@param x number
---@param y number
---@param z number
---@param dx number
---@param dy number
---@param dz number
---@return number res, number x, number y, number z
function Daemonic.FindClosestPointOnMesh(mapid, x, y, z, dx, dy, dz) end

---Sets mouse over object.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetMouseOverObject)<br>
---Example:
---```lua
---SetMouseOverObject(object)
---```
---@param object Daemonic.ObjectReference
function Daemonic.SetMouseOverObject(object) end

---Stops you from falling.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#StopFalling)<br>
---Example
---```lua
---SecureCode("JumpOrAscendStart")
---C_Timer.After(0.4, function() StopFalling() end)
---```
function Daemonic.StopFalling() end

---Sets the value for a global variable (will not destroy after reload).<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetGlobalVar)<br>
---Example:
---```lua
---SetGlobalVar("test", "test data")
---```
---@param name string
---@param data any
function Daemonic.SetGlobalVar(name, data) end

---Gets the value of the global variable previously set by [SetGlobalVar](lua://Daemonic.SetGlobalVar).<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetGlobalVar)<br>
---Example:
---```lua
---local data = GetGlobalVar("test")
---```
---@param name string
---@return any data
function Daemonic.GetGlobalVar(name) end

---Reloads the game.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ReloadGame)<br>
---Example:
---```lua
---ReloadGame()
---```
function Daemonic.ReloadGame() end

---Return if account is in Glue Screen.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#IsInGlue)<br>
---Example:
---```lua
---if IsInGlue() then
---  -- you are in GlueScreen
---end
---```
---@return boolean
function Daemonic.IsInGlue() end

---Quickly disconnects user from server.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DisconnectFromServer)<br>
---Example:
---```lua
---if IsInWorld() then
---  DisconnectFromServer()
---end
---```
function Daemonic.DisconnectFromServer() end

---Daemonic Draw Library
---@class Daemonic.Draw
Daemonic.Draw = {}

---@param wx number
---@param wy number
---@param wz number
---@return number|boolean sX, number|boolean sY
function Daemonic.Draw:WorldToScreen(wx, wy, wz) end

---@return number x, number y, number z, number rotX, number rotY
function Daemonic.Draw:CameraPosition() end

function Daemonic.Draw:Map(value, fromLow, fromHigh, toLow, toHigh) end

---@param r number 0-255
---@param g number 0-255
---@param b number 0-255
---@param a number|nil 0-255
function Daemonic.Draw:SetColor(r, g, b, a) end

---@param a number 0-255
function Daemonic.Draw:SetAlpha(a) end

---@param width number
function Daemonic.Draw:SetWidth(width) end

---@param hex string
---@return number r, number g, number b
function Daemonic.Draw:HexToRGB(hex) end

---@param ax number
---@param ay number
---@param az number
---@param bx number
---@param by number
---@param bz number
---@return number distance
function Daemonic.Draw:Distance(ax, ay, az, bx, by, bz) end

---@param ax number
---@param ay number
---@param bx number
---@param by number
---@return number distance
function Daemonic.Draw:Distance2D(ax, ay, bx, by) end

---@param cx number
---@param cy number
---@param cz number
---@param px number
---@param py number
---@param pz number
---@param r number
function Daemonic.Draw:RotateX(cx, cy, cz, px, py, pz, r) end

---@param cx number
---@param cy number
---@param cz number
---@param px number
---@param py number
---@param pz number
---@param r number
function Daemonic.Draw:RotateY(cx, cy, cz, px, py, pz, r) end

---@param cx number
---@param cy number
---@param cz number
---@param px number
---@param py number
---@param pz number
---@param r number
function Daemonic.Draw:RotateZ(cx, cy, cz, px, py, pz, r) end

---@param sx number
---@param sy number
---@param sz number
---@param ex number
---@param ey number
---@param ez number
function Daemonic.Draw:Line(sx, sy, sz, ex, ey, ez) end

---@param sx number
---@param sy number
---@param ex number
---@param ey number
function Daemonic.Draw:Line2D(sx, sy, ex, ey) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param steps number|nil
function Daemonic.Draw:Circle(x, y, z, radius, steps) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param steps number
function Daemonic.Draw:GroundCircle(x, y, z, radius, steps) end

---@param x number
---@param y number
---@param z number
---@param radius number
function Daemonic.Draw:FilledCircle(x, y, z, radius) end

---@param x number
---@param y number
---@param z number
---@param radius number
function Daemonic.Draw:Outline(x, y, z, radius) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param height number
function Daemonic.Draw:Cylinder(x, y, z, radius, height) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param arc number
---@param rot number
function Daemonic.Draw:Arc(x, y, z, radius, arc, rot) end

---@param x number
---@param y number
---@param z number
---@param radius number
---@param arc number
---@param rot number
function Daemonic.Draw:FilledArc(x, y, z, radius, arc, rot) end

---@param x number
---@param y number
---@param z number
---@param rot number
---@param size number
function Daemonic.Draw:Arrow(x, y, z, rot, size) end

---@param x number
---@param y number
---@param z number
---@param size number
function Daemonic.Draw:Cross(x, y, z, size) end

---@param x number
---@param y number
---@param z number
---@param width number
---@param length number
---@param rot number
---@param offsx number
---@param offsy number
function Daemonic.Draw:Rectangle(x, y, z, width, length, rot, offsx, offsy) end

---@param x number
---@param y number
---@param z number
---@param width number
---@param length number
---@param rot number
---@param offset number?
function Daemonic.Draw:FilledRectangle(x, y, z, width, length, rot, offset) end

---@param vectors table
---@param x number
---@param y number
---@param z number
---@param rotx number
---@param roty number
---@param rotz number
function Daemonic.Draw:Array(vectors, x, y, z, rotx, roty, rotz) end

---@param text string
---@param font string
---@param x number
---@param y number
---@param z number
---@param p number
function Daemonic.Draw:Text(text, font, x, y, z, p) end

---@param config table
---@param x number
---@param y number
---@param z number
---@param alphaA number
function Daemonic.Draw:Texture(config, x, y, z, alphaA) end

function Daemonic.Draw:ClearCanvas() end

function Daemonic.Draw:Update() end

function Daemonic.Draw:Helper() end

function Daemonic.Draw:Enable() end

function Daemonic.Draw:Disable() end

function Daemonic.Draw:Enabled() end

---@param callback function
function Daemonic.Draw:Sync(callback) end

---@param object table
function Daemonic.Draw:SetColorFromObject(object) end

---@param object table
function Daemonic.Draw:GetColorFromObject(object) end

---@param canvas Daemonic.Draw
---@return Daemonic.Draw
function Daemonic.Draw:New(canvas) end
