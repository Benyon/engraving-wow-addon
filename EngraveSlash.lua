

SLASH_PHRASE1 = "/engrave";

SlashCmdList["PHRASE"] = function(msg)

    -- Debug shows log of all engravings.
    if msg == "debug" then
        table.foreach(EngravingsTable, print)
        do return end
    end

    -- Clearing all engravings.
    if msg == "clearall" then
        EngravingsTable = {}
        print(WrapInGold("Your engravings have been cleared."))
        do return end
    end

    -- No message or help.
    if msg == "" or msg == "help" then
        print(WrapInGold("Commands"))
        print(WrapInGold("/engrave - Shows this message"))
        print(WrapInGold("/engrave help - Shows this message"))
        print(WrapInGold("/engrave your message - While hovering over an item, your message will be engraved onto the tooltip."))
        print(WrapInGold("/engrave clear - Removes engraving from a specific item."))
        print(WrapInGold("/engrave clearall - Removes every single engraving you have."))
        print(WrapInGold("/engrave debug - Reviews the engravings table variable."))
        do return end
    end

    -- If clearing.
    if msg == "clear" then
        if GameTooltip:IsShown() then
            local _, itemLink = GameTooltip:GetItem()
            if itemLink then
                local itemId = GetItemInfoFromHyperlink(itemLink)
                local result = RemoveEngraving(itemId)
                if result then
                    print(WrapInGold('Engraving on ' .. itemLink .. ' has been removed'))
                else
                    print(WrapInGold('It doesn\'t seem like there\'s an engraving on this.'))
                end
            else
                print(WrapInGold('It doesn\'t look like there\'s an engraving on this.'))
            end
        end
        do return end
    end

    -- This is when the string is actually a message.
    if GameTooltip:IsShown() then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            local itemId = GetItemInfoFromHyperlink(itemLink)
            local result = AddEngravingToItemId(itemId, msg)
            if result then
                print(WrapInGold('Engraved item ' .. itemLink .. " with \"".. msg .. "\""))
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