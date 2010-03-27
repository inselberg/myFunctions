--- shell testfile

require "cFunctions"

function indexof(t,suche)
	print("suche:"..suche)

	local found=-1
	for i=1,#t do
		if string.lower(t[i]) ==  string.lower(suche) then found=i;break;end
	end
	return found
end


f = cFunctions.create()
f:dummy("ag")


--
--
--
function BoolToStr(var)
print('BoolToStr')
	local r=var
	if (type(var) == boolean ) then
		print("bool")
		if var == true then r = "true"; else r="false";end
	end
	return r
end

BoolToStr(true)

value=123
bl={}
--print(#bl)
f:AddUniqueToTable(bl,value)
print(#bl)
print("----------------------")

-- items zu einer liste hinzufügen
--
suche="xx1x"
t =  {"1a","2a",11,"xxx","asdsad"}
--t={}
print(#t)

print("-----"..2%2)

idx=f:indexof(ttt,11)
print("idx="..idx)

t=f:AddUniqueToTable(t,"agg")


for i=1,#t do
	print(".."..i.." "..#t..".." ..t[i]);
end
if not found then table.insert(t,suche);print("ole ole");end
print(found)
--#c.AddUniqueToTable(t,"item")
print(#t)

--suche jmden der mich durch stratholm (baron seite) zieht 75g/run
