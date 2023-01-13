local frame = CreateFrame("FRAME")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGOUT")

function frame:OnEvent(event, arg1)
    if event == "ADDON_LOADED" and arg1 == "Engrave" then
        if EngravingsTable == nil then
            EngravingsTable = {}
        end
    end
end

frame:SetScript("OnEvent", frame.OnEvent);