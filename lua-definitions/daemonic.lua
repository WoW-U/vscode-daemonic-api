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
function DMC.InetGetRequest(id) end

---@return boolean
function DMC.IsInWorld() end

---Check if file exists in path.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#FileExists)<br>
---Example:
---```lua
---print(FileExists(GetExeDirectory() .. "Example.lua"))
---```
---@param filePath string
---@return boolean
function DMC.FileExists(filePath) end

---Returns Daemonic exe directory path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetExeDirectory)<br>
---Example:
---```lua
---print(GetExeDirectory())
---```
---@return string
function DMC.GetExeDirectory() end

---Shows the directory path of wow.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetWowDirectory)<br>
---Example:
---```lua
---print(GetWowDirectory())
---```
---@return string
function DMC.GetWowDirectory() end

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
function DMC.DirectoryExists(dirPath) end

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
function DMC.IsWritablePath(path) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetUnitPosition)<br>
---Example:
---```lua
---local x, y, z = GetUnitPosition("player")
---print(x,y,z)
---```
---@param unit string
---@return number x, number y, number z
function DMC.GetUnitPosition(unit) end

---Delete any targeted files in path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DeleteFile)<br>
---Example:
---```lua
---DeleteFile(GetExeDirectory() .. "example1.lua")
----- or
---DeleteFile(GetWowDirectory() .. "example2.lua")
---```
---@param path string
function DMC.DeleteFile(path) end

---Delete any targeted directory in path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#DeleteDirectory)<br>
---Example:
---```lua
---DeleteDirectory(GetExeDirectory() .. "example1")
----- or
---DeleteDirectory(GetWowDirectory() .. "example2")
---```
---@param path string
function DMC.DeleteDirectory(path) end

---Encrypt AutoLoad files for Daemonic client.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#EncryptAutoLoad)<br>
---Example:
---```lua
---EncryptAutoLoad(GetExeDirectory() .. "files\\inputFile.lua", GetExeDirectory() .. "files\\outputFile.lua")
---```
---@param inputFilePath string
---@param outputFilePath string
function DMC.EncryptAutoLoad(inputFilePath, outputFilePath) end

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
function DMC.EncryptString(msg, key, type, iv) end

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
function DMC.HashString(msg, type) end

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
function DMC.TraceLine(sx, sy, sz, ex, ey, ez, flags) end

---Lists files in directory..<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetDirectoryFiles)<br>
---Example:
---```lua
---print(GetDirectoryFiles(GetExeDirectory() .. "Example", "*"))
---```
---@param directory string
---@param pattern string
---@return string @all files with `|` delimeter
function DMC.GetDirectoryFiles(directory, pattern) end

---Lists folders in directory.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetDirectoryFolders)<br>
---Example:
---```lua
---print(GetDirectoryFolders(GetExeDirectory() .. "Test\\", "*"))
---```
---@param path string
---@param pattern string
---@return string @all files with `|` delimeter
function DMC.GetDirectoryFolders(path, pattern) end

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
function DMC.ReadFile(filePath) end

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
---@return string unit
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
---@param unit string
---@param offset number
---@param type number
function DMC.ObjectField(unit, offset, type) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitPitch("target")
---```
---@param unit string
---@return number
function DMC.UnitPitch(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitSummonedBy("target")
---```
---@param unit string
---@return string
function DMC.UnitSummonedBy(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitCreatedBy("target")
---```
---@param unit string
---@return string
function DMC.UnitCreatedBy(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitTarget("target")
---```
---@param unit string
---@return string
function DMC.UnitTarget(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitHeight("target")
---```
---@param unit string
---@return number
function DMC.UnitHeight(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitFlags("target")
---```
---@param unit string
---@return number
function DMC.UnitFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitHeight2("target")
---```
---@param unit string
---@return number
function DMC.UnitFlags2(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitHeight3("target")
---```
---@param unit string
---@return number
function DMC.UnitFlags3(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitNpcFlags("target")
---```
---@param unit string
---@return number
function DMC.UnitNpcFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitBoundingRadius("target")
---```
---@param unit string
---@return number
function DMC.UnitBoundingRadius(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitCombatReach("target")
---```
---@param unit string
---@return any
function DMC.UnitCombatReach(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitDynamicFlags("target")
---```
---@param unit string
---@return number
function DMC.UnitDynamicFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitAnimationFlags("target")
---```
---@param unit string
---@return number
function DMC.UnitAnimationFlags(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsSkinnable("target")
---```
---@param unit string
---@return boolean
function DMC.UnitIsSkinnable(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsLootable("target")
---```
---@param unit string
---@return boolean
function DMC.UnitIsLootable(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitCastingTarget("target")
---```
---@param unit string
---@return string
function DMC.UnitCastingTarget(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsMounted("target")
---```
---@param unit string
---@return boolean
function DMC.UnitIsMounted(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsOutdoors("target")
---```
---@param unit string
---@return boolean
function DMC.UnitIsOutdoors(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsSubmerged("target")
---```
---@param unit string
---@return boolean
function DMC.UnitIsSubmerged(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitStandStateType("target")
---```
---@param unit string
---@return number
function DMC.UnitStandStateType(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitIsSitting("target")
---```
---@param unit string
---@return boolean
function DMC.UnitIsSitting(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitField)<br>
---Example:
---```lua
---UnitSpecializationID("target")
---```
---@param unit string
---@return number
function DMC.UnitSpecializationID(unit) end


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

---Returns the display name of a unit.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectName)<br>
---Example:
---```lua
---print(ObjectName("player"))
---```
---@param unit string
---@return string Name
function DMC.ObjectName(unit) end

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
---@param unit string
---@return number ID
function DMC.ObjectID(unit) end

---Returns the number of missiles.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetMissileCount)<br>
---Example:
---```lua
---print(GetMissileCount())
---```
---@return number
function DMC.GetMissileCount() end

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
function DMC.GetMissileWithIndex(index) end

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
---@param unit string
---@return number Type
function DMC.ObjectType(unit) end

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
---@param unit string
---@return number CreatureType
function DMC.UnitCreatureTypeId(unit) end

---@return string
function DMC.WipeString(str) end

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
function DMC.DecryptAndLoadString(content, key, type, iv, debugName) end

---Calling this will make your player not go AFK.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ResetAfk)<br>
---Example:
---```lua
---local function AntiAFK()
---   ResetAfk()
---   C_Timer.After(60, AntiAFK)
---end
---AntiAFK()
---```
function DMC.ResetAfk() end

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
function DMC.DecryptString(string, key, type, iv) end

---Loads lua string.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#LoadString)<br>
---Example:
---```lua
---Loader = LoadString("C_Timer.After(2, function() print('TEST') end)")
---Loader() -- will print TEST after two seconds
---```
---@param content string
---@return function
function DMC.LoadString(content) end

---@return string
function DMC.GetSessionID() end

---@return number
function DMC.GetSessionIndex() end

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
---@param unit string
---@return number
function DMC.GetUnitMovementFlags(unit) end

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
---@overload fun(unit1:string, unit2:string):number
---@return number
function DMC.GetDistance3D(x1, y1, z1, x2, y2, z2) end

---Create a directory in specified path.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#CreateDirectory)<br>
---Example:
---```lua
---CreateDirectory(GetExeDirectory() .. "Example")
----- or
---CreateDirectory(GetWowDirectory() .. "Example")
---```
---@param path string
function DMC.CreateDirectory(path) end

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
function DMC.WriteFile(path, content, append) end

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
function DMC.RenameFile(currentName, newName) end

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
function DMC.HmacString(string, key, type) end

---Encode string to Base64.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#Base64EncodeString)<br>
---Example:
---```lua
---print(Base64EncodeString("Test"))
---```
---@param str string
---@return string
function DMC.Base64EncodeString(str) end

---Decode Base64 string.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#Base64DecodeString)<br>
---Example:
---```lua
---print(Base64DecodeString("VGVzdA=="))
---```
---@param str string
---@return string
function DMC.Base64DecodeString(str) end

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
function DMC.DecryptAndRunString(str, key, type) end

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
---@param unit string
---@return boolean
function DMC.ObjectIsQuestObjective(unit) end

---Sets a unit as a target.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetTargetUnit)<br>
---Example:
---```lua
---SetTargetUnit("player")
---```
---@param unit string
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
---@param unit string
---@return number
function DMC.UnitFacing(unit) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#UnitScale)<br>
---Example:
---```lua
---print(UnitScale('target'))
---```
---@param unit string
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
---@overload fun(unit1:string, unit2:string):facing:number, pitcher:number
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
---@param unit string
function DMC.Interact(unit) end

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
function DMC.MoveTo(x, y, z) end

---[Documentation](https://daemonic.cc/estore/daemonic-api/#GetCorpsePosition)<br>
---Example: 
---```lua
---local x, y, z = GetCorpsePosition()
---print(x,y,z)
---```
---@return number x, number y, number z
function DMC.GetCorpsePosition() end

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
function DMC.FindPath(mapID, x1, y1, z1, x2, y2, z2, swim) end

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
function DMC.GetPathNode(index) end

---Changes the default maps locations to any path you set.<br>
---[Documentation](https://daemonic.cc/estore/daemonic-api/#SetMapsPath)
---Example:
---```lua
---SetMapsPath("C:\\Maps\\")
---```
---@param path string
function DMC.SetMapsPath(path) end

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
---@param unit string
---@return number type
function DMC.GameObjectType(unit) end

---Checks if object exits.
---[Documentation](https://daemonic.cc/estore/daemonic-api/#ObjectExists)<br>
---Example:
---```lua
---print(ObjectExists("target"))
---```
---@param unit string
---@return boolean exists
function DMC.ObjectExists(unit) end

---@param text string
function DMC.SetClipboardText(text) end

---@return string
function DMC.GetClipboardText() end

---@param src string
---@param dest string
function DMC.CopyFile(src, dest) end

---@param src string
---@param dest string
function DMC.CopyDirectory(src, dest) end

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
function DMC.Draw:HexToRGB(hex) end

---@param ax number
---@param ay number
---@param az number
---@param bx number
---@param by number
---@param bz number
---@return number distance
function DMC.Draw:Distance(ax, ay, az, bx, by, bz) end

---@param ax number
---@param ay number
---@param bx number
---@param by number
---@return number distance
function DMC.Draw:Distance2D(ax, ay, bx, by) end

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
function DMC.Draw:New(canvas) end
