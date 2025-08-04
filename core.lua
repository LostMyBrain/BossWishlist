local addonName, ns = ...

-- SavedVariables initialisieren
BossWishlistDB = BossWishlistDB or {}

-- Eventframe zum Laden
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, name)
    if name == addonName then
        -- Minimap Button Position laden
        if BossWishlistDB.minimap then
            ns.minimapButton:ClearAllPoints()
            ns.minimapButton:SetPoint(BossWishlistDB.minimap.point, Minimap, BossWishlistDB.minimap.point, BossWishlistDB.minimap.x, BossWishlistDB.minimap.y)
        end
    end
end)
