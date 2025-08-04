local addonName, ns = ...

local button = CreateFrame("Button", "BossWishlistMinimapButton", Minimap)
button:SetSize(32, 32)
button:SetFrameStrata("MEDIUM")
button:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52, -52)

button.texture = button:CreateTexture(nil, "BACKGROUND")
button.texture:SetAllPoints()
button.texture:SetTexture("Interface\\Icons\\INV_Misc_Listicon")

button:SetMovable(true)
button:RegisterForDrag("LeftButton")
button:SetScript("OnDragStart", function(self) self:StartMoving() end)
button:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint()
    BossWishlistDB.minimap = {point = point, x = xOfs, y = yOfs}
end)

button:SetScript("OnClick", function()
    if ns.guiFrame:IsShown() then
        ns.guiFrame:Hide()
    else
        ns.guiFrame:Show()
    end
end)

ns.minimapButton = button
