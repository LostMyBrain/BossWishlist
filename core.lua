local addonName, ns = ...

BossWishlistDB = BossWishlistDB or {}

local function ToggleWishlist()
    if ns.guiFrame and ns.guiFrame:IsShown() then
        ns.guiFrame:Hide()
        print("BossWishlist: Wunschliste versteckt.")
    elseif ns.guiFrame then
        ns.guiFrame:Show()
        print("BossWishlist: Wunschliste angezeigt.")
    else
        print("BossWishlist: GUI nicht geladen!")
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, name)
    if name == addonName then
        print("|cff00ff00BossWishlist geladen!|r")

        if BossWishlistDB.minimap and ns.minimapButton then
            ns.minimapButton:ClearAllPoints()
            ns.minimapButton:SetPoint(
                BossWishlistDB.minimap.point,
                Minimap,
                BossWishlistDB.minimap.point,
                BossWishlistDB.minimap.x,
                BossWishlistDB.minimap.y
            )
        end
    end
end)

SLASH_BOSSWISHLIST1 = "/wishlist"
SLASH_BOSSWISHLIST2 = "/bw"
SlashCmdList["BOSSWISHLIST"] = function(msg)
    msg = msg:lower():gsub("^%s*(.-)%s*$", "%1")

    if msg == "" or msg == "help" then
        print("|cff00ff00BossWishlist Befehle:")
        print("|cff00ff00/wishlist oder /bw - Wunschliste öffnen oder schließen")
        return
    end

    ToggleWishlist()
end

-- Testbefehl zum direkten Öffnen der Wunschliste (im Chat /testwl eingeben)
SLASH_TESTWISHLIST1 = "/testwl"
SlashCmdList["TESTWISHLIST"] = function()
    if ns.guiFrame then
        ns.guiFrame:Show()
        print("Test: Wunschliste-Fenster wird angezeigt")
    else
        print("Test: ns.guiFrame ist nil!")
    end
end
