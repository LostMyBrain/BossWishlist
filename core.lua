local addonName = ...
local BW = BossWishlist
local tooltip = GameTooltip
local playerName = UnitName("player") .. " - " .. GetRealmName() or "Default"

local function IsItemOwned(itemID)
    return GetItemCount(itemID, true) > 0
end

function BW:Print(msg)
    print("|cffffcc00[BossWishlist]|r " .. msg)
end

function BW:AddTooltip(tooltip, name)
    local list = BossWishlistDB.charData[playerName][name]
    if not list then return end

    tooltip:AddLine("|cffffcc00Wunschliste:|r")
    for _, itemID in ipairs(list) do
        local itemName, itemLink = GetItemInfo(itemID)
        local owned = IsItemOwned(itemID)
        local status = owned and "|cff00ff00(Besitzt)|r" or "|cffff0000(Fehlt)|r"
        local drop = BossWishlist_DropChances[itemID]
        local dropText = drop and (" |cffffff00Drop: " .. drop .. "%|r") or ""

        if itemLink then
            tooltip:AddLine("- " .. itemLink .. " " .. status .. dropText)
        else
            tooltip:AddLine("- ItemID " .. itemID .. " (Lade...)")
        end
    end
    tooltip:Show()
end

-- Tooltip Hook
GameTooltip:HookScript("OnTooltipSetUnit", function(tt)
    local name, unit = tt:GetUnit()
    if unit and UnitIsEnemy("player", unit) then
        BW:AddTooltip(tt, name)
    end
end)

hooksecurefunc(GameTooltip, "SetText", function(tt, text)
    if BossWishlistDB.charData[playerName][text] then
        BW:AddTooltip(tt, text)
    end
end)

-- ADDON LADEN
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, _, name)
    if name == addonName then
        BossWishlistDB = BossWishlistDB or {}
        BossWishlistDB.charData = BossWishlistDB.charData or {}
        BossWishlistDB.charData[playerName] = BossWishlistDB.charData[playerName] or {}
        BW:InitMinimap()
    end
end)
