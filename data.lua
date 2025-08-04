BossWishlist = BossWishlist or {}

-- Speicherstruktur: Char-spezifisch
local playerName = UnitName("player") .. " - " .. GetRealmName()
BossWishlistDB = BossWishlistDB or {}
BossWishlistDB.charData = BossWishlistDB.charData or {}
BossWishlistDB.charData[playerName] = BossWishlistDB.charData[playerName] or {}

BossWishlist.defaultData = {
    minimap = { hide = false, pos = 220 },
    ui = { x = 100, y = 100 }
}
