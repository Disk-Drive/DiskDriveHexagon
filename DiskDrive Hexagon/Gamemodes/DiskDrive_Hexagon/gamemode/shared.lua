-- garrysmod/gamemodes/diskdrive_hexagon/gamemode/shared.lua

GM.Name = "DiskDrive Hexagon" -- 游戏模式的内部名称 (通常与 title 一致)
GM.Author = "Disk-Drive"
GM.Description = "A fast-paced hexagonal survival minigame."

-- 继承自基础游戏模式 "base"
-- 这会提供很多Garry's Mod的基础功能，比如玩家物理、移动等
DeriveGamemode("base")

-- 你可以在这里添加一些客户端和服务器都需要知道的变量或函数
-- 但对于这个简单的HUD游戏，可能不需要在这里添加太多东西

print("[DiskDrive Hexagon Gamemode] Shared loaded.")
