local BW = BossWishlist
local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("BossWishlist", {
    type = "data source",
    text = "Wishlist",
    icon = "Interface\\Icons\\INV_Misc_Listicon",
    OnClick = function() BW:ToggleUI() end,
    OnTooltipShow = function(tt)
        tt:AddLine("Boss Wishlist")
        tt:AddLine("Klicken zum Öffnen")
    end
})

function BW:InitMinimap()
    LibStub("LibDBIcon-1.0"):Register("BossWishlist", LDB, BossWishlistDB.minimap)
end
