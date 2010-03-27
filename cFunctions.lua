cFunctions = {}
cFunctions.__index = cFunctions

function cFunctions.create()
   local handle = {}             -- our new object
   setmetatable(handle,cFunctions)  -- handle lookup

   return handle
end




function cFunctions:dummy(str)
	local s = "hallo welt...!!!! sasasd"
	if str ~= nil then s=s..str;end
	print(s)
	return str
end

-----------------------------------


--
--
--
function cFunctions:GetColorCode(colorname)
	clYellow = "|cffffff00"
	clWhite  = "|cffffffff"
	clRed    = "|cffff0000"
	clGreen  = "|cff00ff00"

	local t = {
		yellow = clYellow, white = clWhite, red = clRed, green = clGreen
	}

	local cn = string.lower(colorname)
	local c = clWhite
	for i,v in pairs(t) do
		if i == cn then c = v; break;end;
	end

	return c
end


--
--
--
function cFunctions:ColorStr(colorname,txt)

	local msg = self:GetColorCode(colorname)..txt.."|r"

	return msg
end


--
--
--
function cFunctions:GetLink(item)

	--print(":GetLink("..item..")")

	local r = "|cff0070dd|Hitem:43102:0:0:0:0:0:0:0:19|h[Gefrorene Kugel]|h|r"

	if GetItemInfo ~= nil
	then
		local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,itemEquipLoc, itemTexture = GetItemInfo(item)
		if itemLink ~= nil then r = itemLink end
	end
 return r
end

--
--
--
function cFunctions:splitItemLink(itemLink)
	local _, _, Color, Ltype, Id, Enchant, Gem1, Gem2, Gem3, Gem4, Suffix, Unique, LinkLvl, Name = string.find(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")

	r = {
		id = Id,
		name = Name
	}

	return r
end
--
--
--
function cFunctions:dt(t)
  if t == nil then t = time() end
  return date("%m/%d/%y %H:%M:%S",t)
end



-- t = { 1,2,3,{ 4.1,4.2,4.3, {4.31,4.32} },5,6 }; showtable(t)
function cFunctions:showtable(t,str)
    if ( str == nil ) then str = "" else str = str .. "." end

	for i,v in ipairs(t) do
		if type(v) ~=  "table"
			then print(str.."["..i.."]"..v)
			else showtable(v,str)
		end
	end
end


--
--
--
function cFunctions:split(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0

	if str ~= nil then
		local fpat = "(.-)" .. pat
		local last_end = 1
		local s, e, cap = str:find(fpat, 1)
		while s do
			if s ~= 1 or cap ~= "" then
				table.insert(t,cap)
			end
			last_end = e+1
			s, e, cap = str:find(fpat, last_end)
		end
		if last_end <= #str then
			cap = str:sub(last_end)
			table.insert(t, cap)
		end
	end
   return t
end

--
--
--
function cFunctions:trim (s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end



--
--
--
function cFunctions:indexof(t,suche)
	local found=-1
	if type(t) == "table" then
		for i=1,#t do
			if string.lower(t[i]) ==  string.lower(suche) then found=i;break;end
		end
	end
	return found
end




--
-- items zu einer liste hinzufügen
--
function cFunctions:AddUniqueToTable(t,item)
	local r={}

	if type(t) == "table"
	then
		if self:indexof(t,item) == -1 then table.insert(t,item);end
		r=t
	else
		r={item}
	end
	return r
end

--
--
--
function cFunctions:DeleteFromTable(t,item)
	found = self:indexof(t,item)
	if found > -1 then table.remove(t,found);end

	return t
end

--
--
--
function cFunctions:getkeys(t)
 local keys = {};
 for k,_ in pairs(t) do keys[#keys+1] = k end;
 --for _,v in ipairs(keys) do print(v) end

 return keys
end

--
-- sortieren einer tabelle
--item["buyoutPrice"] = buyoutPrice
--  item["count"] = count
--  t[#t+1] = item
function cFunctions:sortmultitable(t,key)

	function swap(t,i,j)
		local x = t[i];	t[i] = t[j];t[j] = x
		return t
	end


	local n = #t
	for i=1,n do
		local item = t[i]
		for j=i+1,n do
			if t[j][key] < t[i][key] then t = swap(t,i,j);end
		end
	end
	return t
end


