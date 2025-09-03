---@class DMC
DMC = {}
function DMC.SecureCode(funcName, ...) end

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

---@param unit string|any
---@return number x, number y, number z
function DMC.GetUnitPosition(unit)
    return 0, 0, 0
end

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

---@return number
function DMC.GetObjectCount()
    return 0
end

---@param index number
---@return string|any unit
function DMC.GetObjectWithIndex(index)
    return ""
end

---@param guid string
---@return boolean
function DMC.IsGUID(guid)
    return false
end

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
function DMC.UnitNpcFlags(unit)
    return 0
end

---@return number
function DMC.IsSpellPending()
    return 0
end

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

---@param x number
---@param y number
---@param z number
---@return number x, number y, boolean isOnScreen
function DMC.WorldToScreen(x, y, z)
    return 0, 0, false
end

---@param unit string|any
---@return boolean
function DMC.ObjectIsQuestObjective(unit)
    return false
end

---@param unit string|any
---@return boolean
function DMC.UnitIsLootable(unit)
    return false
end

---@param unit string|any
---@return boolean
function DMC.UnitIsSubmerged(unit)
    return false
end

---@param unit string|any
---@return string
function DMC.UnitTarget(unit)
    return ""
end

---@param unit string|any
function DMC.SetTargetUnit(unit) end

---@param unit string|any
---@return number
function DMC.UnitFacing(unit)
    return 0
end

---@param z1 number | nil
---@param x2 number | nil
---@param y2 number | nil
---@param z2 number | nil
---@overload fun(unit1:string|any, unit2:string|any):facing:number, pitcher:number
---@return number facing, number pitch
function DMC.GetAngles(unit, otherUnit, z1, x2, y2, z2)
    return 0, 0
end

---@param radians number
---@param update boolean
function DMC.FaceDirection(radians, update) end

---@param radians number
function DMC.SetPitch(radians) end

---@param unit string|any
function DMC.Interact(unit) end

---@param x number
---@param y number
---@param z number
function DMC.MoveTo(x, y, z) end

---@return number x, number y, number z
function DMC.GetCorpsePosition()
    return 0, 0, 0
end

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
function DMC.GetPathNode(index)
    return 0, 0, 0
end

---@return number x, number y, number z
function DMC.GetCameraPosition()
    return 0, 0, 0
end

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
---@return number|boolean, number|boolean: sX, sY
function DMC.Draw:WorldToScreen(wx, wy, wz)
    return 0, 0
end

---@return number x, number y, number z, number rotX, number rotY
function DMC.Draw:CameraPosition()
    return 0, 0, 0, 0, 0
end

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
