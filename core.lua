local addonName, ns = ...

-- Initialisiere SavedVariables
BossWishlistDB = BossWishlistDB or {}

-- Eventframe zum Laden des Addons
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, name)
    if name == addonName then
        print("|cff00ff00BossWishlist geladen!|r")

        -- Minimap Button Position laden, falls gespeichert
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

-- Slash Command Funktion zum Öffnen/Schließen der Wunschliste
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

-- Slash-Commands registrieren
SLASH_BOSSWISHLIST1 = "/wishlist"
SLASH_BOSSWISHLIST2 = "/bw"
SlashCmdList["BOSSWISHLIST"] = function(msg)
    msg = msg:lower():gsub("^%s*(.-)%s*$", "%1") -- trim & lowercase

    if msg == "help" or msg == "" then
        pri
