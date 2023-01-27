function WrapInGold(text)
    return "|cffffcc00"..text
end

function SplitStr(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function AddEngravingToItemId(id, text)
    for key, value in pairs(EngravingsTable) do
        local extractedId = SplitStr(value, "/---/")[1]
        if extractedId == tostring(id) then
            return false
        end
    end
    table.insert(EngravingsTable, id.."/---/"..text)
    return true
end

function RemoveEngraving(id)
    local index = -1
    for key, value in pairs(EngravingsTable) do
        local extractedId = SplitStr(value, "/---/")[1]
        if extractedId == tostring(id) then
            index = key
        end
    end
    if (index ~= -1) then
        table.remove(EngravingsTable, index)
        return true
    end
    return false
end

function GetEngravingFromId(id)
    for key, value in pairs(EngravingsTable) do
        local extractedId = SplitStr(value, "/---/")[1]
        local message = SplitStr(value, "/---/")[2]
        if extractedId == tostring(id) then
            return message
        end
    end
    return ''
end