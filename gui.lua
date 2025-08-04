local BW = BossWishlist
local playerName = UnitName("player") .. " - " .. GetRealmName()

function BW:CreateMainUI()
    if self.mainFrame then return end

    local f = CreateFrame("Frame", "BossWishlistUI", UIParent, "BackdropTemplate")
    f:SetSize(400, 300)
    f:SetPoint("CENTER")
    f:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background" })
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local _, _, _, x, y = self:GetPoint()
        BossWishlistDB.ui.x = x
        BossWishlistDB.ui.y = y
    end)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -10)
    title:SetText("Boss Wishlist")

    local inputBoss = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    inputBoss:SetSize(200, 20)
    inputBoss:SetPoint("TOPLEFT", 20, -40)
    inputBoss:SetAutoFocus(false)
    inputBoss:SetText("Bossname")

    local inputItem = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    inputItem:SetSize(100, 20)
    inputItem:SetPoint("TOPLEFT", inputBoss, "BOTTOMLEFT", 0, -10)
    inputItem:SetText("ItemID")

    local addBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    addBtn:SetSize(100, 22)
    addBtn:SetPoint("TOPLEFT", inputItem, "BOTTOMLEFT", 0, -10)
    addBtn:SetText("Hinzufügen")

    addBtn:SetScript("OnClick", function()
        local boss = inputBoss:GetText()
        local itemID = tonumber(inputItem:GetText())
        if boss and itemID then
            BossWishlistDB.charData[playerName][boss] = BossWishlistDB.charData[playerName][boss] or {}
            table.insert(BossWishlistDB.charData[playerName][boss], itemID)
            BW:Print("Item " .. itemID .. " zu " .. boss .. " hinzugefügt.")
        end
    end)

    self.mainFrame = f
end

function BW:ToggleUI()
    if not self.mainFrame then self:CreateMainUI() end
    if self.mainFrame:IsShown() then
        self.mainFrame:Hide()
    else
        self.mainFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", BossWishlistDB.ui.x, BossWishlistDB.ui.y)
        self.mainFrame:Show()
    end
end
