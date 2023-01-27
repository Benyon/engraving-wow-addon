local frame = CreateFrame("FRAME")
frame:RegisterEvent("BAG_CLOSED")

function frame:OnEvent(event)
    if event == "BAG_CLOSED" then
        print('bag opened')
    end
end

frame:SetScript("OnEvent", frame.OnEvent);