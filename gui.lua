local addonName, ns = ...

print("BossWishlist GUI geladen")

local frame = CreateFrame("Frame", "BossWishlistFrame", UIParent, "BasicFrameTemplateWithInset")
frame:SetSize(300, 400)
frame:SetPoint("CENTER")
frame:Hide()

frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
frame.title:SetPoint("LEFT", frame.TitleBg, "LEFT", 5, 0)
frame.title:SetText("Boss Wishlist")

frame.list = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.list:SetPoint("TOPLEFT", 10, -40)
frame.list:SetJustifyH("LEFT")
frame.list:SetWidth(280)

local function UpdateList()
    local text = ""
    for boss, items in pairs(BossWishlist_Data.bosses) do
        text = text .. "|cff00ff00Boss:|r " .. boss .. "\n"
        for _, item in ipairs(items) do
            text = text .. string.format("  - %s (Dropchance: %.1f%%)\n", item.name, item.dropRate)
        end
        text = text .. "\n"
    end
    frame.list:SetText(text)
end

frame:SetScript("OnShow", UpdateList)

ns.guiFrame = frame

print("BossWishlist Frame gesetzt")
