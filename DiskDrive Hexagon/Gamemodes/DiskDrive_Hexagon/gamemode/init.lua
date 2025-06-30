AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

AddCSLuaFile("autorun/client/cl_DiskDriveHexagon.lua")


include('shared.lua')
print("[DiskDrive Hexagon Gamemode] Server Initialized.")

-- 当玩家第一次加入服务器时调用
function GM:PlayerInitialSpawn(ply)
    print("PlayerInitialSpawn: ", ply:Nick())
    ply:SetPlayerColor(Vector(math.random(), math.random(), math.random())) 
    ply:SetTeam(1) 
end

function GM:PlayerSpawn(ply)
    print("PlayerSpawn: ", ply:Nick())

    -- 首先调用基类的 PlayerSpawn 函数来处理核心生成逻辑
    self.BaseClass:PlayerSpawn(ply)

    ply:StripWeapons()
    ply:SetHealth(114514)
    ply:SetMaxHealth(114514)
    ply:SetArmor(0)
    ply:SetFrags(0)
    ply:SetDeaths(0)

end

function GM:PlayerLoadout(ply)

    return true
end


function GM:PlayerShouldTakeDamage(ply, attacker)
    return false -- 玩家无敌
end

function GM:PlayerDisconnected(ply)
    print("PlayerDisconnected: ", ply:Nick())
end
