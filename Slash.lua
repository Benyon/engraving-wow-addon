local function WrapInGold(text)
    return "|cffffcc00"..text
end

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

local function addEngravingToItemId(id, text)
    for key, value in pairs(EngravingsTable) do
        local extractedId = splitStr(value, "/---/")[1]
        if extractedId == tostring(id) then
            return false
        end
    end
    table.insert(EngravingsTable, id.."/---/"..text)
    return true
end

SLASH_PHRASE1 = "/engrave";

SlashCmdList["PHRASE"] = function(msg)
    if msg == "debug" then
        table.foreach(EngravingsTable, print)
        do return end
    end
    if msg == "clearall" then
        EngravingsTable = {}
        print(WrapInGold("Your engravings have been cleared."))
        do return end
    end
    if msg == "" or msg == "help" then
        print(WrapInGold("Commands"))
        print(WrapInGold("/engrave - Shows this message"))
        print(WrapInGold("/engrave help - Shows this message"))
        print(WrapInGold("/engrave your message - While hovering over an item, your message will be engraved onto the tooltip."))
        print(WrapInGold("/engrave clearall - Removes every single engraving you have."))
        print(WrapInGold("/engrave debug - Reviews the engravings table variable."))
        print(WrapInGold("WIP - clear engraving from specific item."))
        do return end
    end
    if GameTooltip:IsShown() then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            local itemId = GetItemInfoFromHyperlink(itemLink)
            local result = addEngravingToItemId(itemId, msg)
            if result then
                print(WrapInGold('Engraved item ' .. itemLink .. " with ".. msg))
            else
                print(WrapInGold('Cannot apply this engraving as one already exists.'))
            end
        else
            print(WrapInGold('This doesn\'t look like something we can engrave.'))
        end
    else
        print(WrapInGold('No item is selected to engrave.'))
    end
end

print(WrapInGold('Engraving has loaded.'))