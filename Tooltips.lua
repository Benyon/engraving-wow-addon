local function splitStr(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

local function getEngravingFromId(id)
    for key, value in pairs(EngravingsTable) do
        local extractedId = splitStr(value, "/---/")[1]
        local message = splitStr(value, "/---/")[2]
        if extractedId == tostring(id) then
            return message
        end
    end
    return ''
end

local function GameTooltip_OnTooltipSetItem(tooltip)
    local _, itemLink = tooltip:GetItem()
    if (itemLink) then
        local itemId = GetItemInfoFromHyperlink(itemLink)
        local engraving = getEngravingFromId(itemId)
        if engraving ~= '' then
            tooltip:AddLine(" ")
            tooltip:AddLine("\"".. engraving .."\"", 0.83, 0.68, 0.21, true)
        end
    end
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, GameTooltip_OnTooltipSetItem)