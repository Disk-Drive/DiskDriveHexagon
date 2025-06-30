-- DiskDrive Hexagon
-- Project Millennium

local DiskDriveHEX = {}
DiskDriveHEX.Active = false
DiskDriveHEX.InMenu = true
DiskDriveHEX.GameOver = false
DiskDriveHEX.SelectedLevel = 1
DiskDriveHEX.Score = 0
DiskDriveHEX.HighScore = 0
DiskDriveHEX.StartTime = 0
DiskDriveHEX.LastTime = 0 -- Delta值
DiskDriveHEX.Music = nil
DiskDriveHEX.RotationDirection = 1
DiskDriveHEX.RotationSpeedMultiplier = 1
DiskDriveHEX.LastRotationChange = 0
DiskDriveHEX.LastBackgroundRotate = 0
DiskDriveHEX.BackgroundRotation = 0
DiskDriveHEX.NextBackgroundRotateTime = 0 -- 下一次背景旋转的时间
DiskDriveHEX.NextBackgroundRotateInterval = math.Rand(1, 2) -- 随机旋转方向
DiskDriveHEX.ShowPlayerInfo = true
DiskDriveHEX.ShowInputDisplay = true
DiskDriveHEX.Cai_B_Mode = false -- 菜就多练，输不起就别玩

-- 发光描边效果
DiskDriveHEX.OutlineAlphaMultiplier = 0.3 -- 从0.2到0.4的倍率
DiskDriveHEX.OutlineAlphaDirection = 1
DiskDriveHEX.OutlineAlphaSpeed = 0.2 -- 变换速度

-- 最高分动画
DiskDriveHEX.NewBestAnimation = {
 active = false,
 startTime = 0,
 blinkCount = 0,
 maxBlinks = 6,
 blinkInterval = 0.08, -- 闪烁间隔
 fadeDuration = 0.2, -- 淡出时间
 alpha = 255,
 triggeredThisGame = false -- 我是理塘丁真，这就是策马
}

DiskDriveHEX.Tutorial = {
 active = false,
 startTime = 0,
 duration = 5,
 alpha = 255
}

DiskDriveHEX.Difficulty = {
 rotationSpeed = 1,
 obstacleSpeed = 1,
 lastRotationIncrease = 0,
 lastObstacleIncrease = 0,
 rotationIncreaseInterval = 5,
 obstacleIncreaseInterval = 10,
 rotationIncreaseAmount = 0.08,
 obstacleIncreaseAmount = 0.2,
 spawnRate = 2
}

-- 诶你怎么死了
DiskDriveHEX.EndAnimation = {
 active = false,
 startTime = 0,
 duration = 0.6,
 startRadius = 0,
 targetRadius = 400,
 currentRadius = 0
}

DiskDriveHEX.StartAnimation = {
 active = false,
 startTime = 0,
 duration = 0.3,
 startRadius = 800,
 targetRadius = 100,
 currentRadius = 0
}

-- 卧槽这个死妈状态机真的你妈难写死了
DiskDriveHEX.GameOverState = "none" -- "none", "flashing", "paused", "animating", "finished"四个状态
DiskDriveHEX.GameOverStateTimer = 0
DiskDriveHEX.GameOverFreeze = false --冻结玩家等
DiskDriveHEX.GameOverTextPosX = 0 -- 文字的X轴
DiskDriveHEX.GameOverOutwardSpeed = 3600 -- 飞起来！
DiskDriveHEX.GameOverTextSlideSpeed = 6 -- 文字滑入的速度

DiskDriveHEX.ColorTransition = {
 blendFactor = 0, -- 平滑插值
 targetBlend = 0,
 transitionSpeed = 0.05, -- 色板切换的速度
 direction = 1,
 extendedBlend = 0, -- HYPER MODE下的色板切换标志符
 lastLevel = 1,
 transitionProgress = 0,
 lastSwitchTime = 0,
 switchInterval = 2 -- 色板切换的间隔时间
}

-- Rainbow Color Flag State
DiskDriveHEX.ColorPad = {
 active = false,
 lastSwitchTime = 0,
 switchInterval = 2,
 transitionDuration = 0.8, -- Time for smooth transition between rainbow colors
 currentTransitionTime = 0,
 currentColor = Color(0,0,0),
 targetColor = Color(0,0,0),
 isGrayscale = false,
 grayscaleFadeDuration = 1.5, -- Duration to fade to grayscale
 isFadingToGrayscale = false
}
DiskDriveHEX.RainbowPalette = {
 Color(255, 60, 60),    -- Red
 Color(255, 165, 0), -- Orange
 Color(0, 161, 255),    -- Blue
 Color(60, 212, 60),    -- Green
 Color(0, 161, 255),    -- Blue2
 Color(75, 0, 130),   -- Indigo
 Color(200, 100, 200) -- Violet
}
DiskDriveHEX.GrayscaleColor = Color(164, 164, 164, 255) -- Predefined grayscale color

-- Random Rotation Flag State
DiskDriveHEX.RandomRotation = {
 active = false,
 lastEventTime = 0,
 nextEventTime = 0,
 isRotating = false,
 startTime = 0,
 duration = 1,
 startRotation = 0,
 targetRotation = 0,
 direction = 1
}


DiskDriveHEX.HyperModeTransition = {
 alpha = 0,
 targetAlpha = 0,
 transitionSpeed = 3
}

DiskDriveHEX.Pulse = {
 active = false,
 intensity = 0,
 duration = 0,
 timer = 0,
 nextPulseTime = 0,
 minInterval = 0.01,
 maxInterval = 0.3,
 minDuration = 0.05,
 maxDuration = 0.1,
 minIntensity = 2,
 maxIntensity = 10
}

DiskDriveHEX.LevelUpAnimation = {
 active = false,
 startTime = 0,
 blinkCount = 0,
 maxBlinks = 6,
 blinkInterval = 0.05,
 fadeDuration = 0.2
}

DiskDriveHEX.VoiceTriggers = {
 [12] = false,
 [24] = false,
 [36] = false,
 [48] = false,
 [60] = false
}

DiskDriveHEX.ColorSchemes = {
 {
     name = "Hexagon",
     palette1 = {
         light = Color(6, 14, 70, 255),
         dark = Color(8, 21, 105, 255),
         object = Color(59, 76, 198, 128),
         invert = Color(59, 76, 198, 255)
     },
     palette2 = {
         light = Color(1, 56, 68, 255),
         dark = Color(2, 84, 102, 255),
         object = Color(25, 104, 192, 128),
         invert = Color(25, 104, 192, 255)
     },
     music = "DiskDriveCHM/Hexagon.wav"
 },
 {
     name = "Hexagoner",
     palette1 = {
         light = Color(255, 255, 255, 255),
         dark = Color(249, 218, 238, 255),
         object = Color(220, 18, 145, 238),
         invert = Color(220, 18, 145, 255)
     },
     palette2 = {
         light = Color(230, 230, 255, 255),
         dark = Color(180, 180, 255, 255),
         object = Color(50, 50, 200, 238),
         invert = Color(50, 50, 200, 255)
     },
     music = "DiskDriveCHM/Hexagoner.wav"
 },
 {
     name = "Hexagonest",
     palette1 = {
         light = Color(122, 206, 255, 255),
         dark = Color(0, 161, 255, 255),
         object = Color(0, 63, 255, 212),
         invert = Color(52, 103, 255, 255)
     },
     palette2 = {
         light = Color(122, 206, 255, 255),
         dark = Color(0, 161, 255, 255),
         object = Color(0, 63, 255, 212),
         invert = Color(52, 103, 255, 255)
     },
     music = "DiskDriveCHM/Hexagonest.wav"
 },
 {
     name = "Custom",
     palette1 = {
         light = Color(150, 150, 150, 255),
         dark = Color(100, 100, 100, 255),
         object = Color(200, 200, 200, 128),
         invert = Color(200, 200, 200, 255)
     },
     palette2 = {
         light = Color(200, 100, 100, 255),
         dark = Color(150, 50, 50, 255),
         object = Color(255, 150, 150, 128),
         invert = Color(255, 150, 150, 255)
     },
     music = "DiskDriveCHM/Courtesy.wav"
 }
}

DiskDriveHEX.Levels = {
 {name = "DISKDRIVE", difficulty = "HARD", speed = 1.5, bestTime = 0},
 {name = "SUPER DISKDRIVE", difficulty = "HARDER", speed = 2, bestTime = 0},
 {name = "ULTIMATE DISKDRIVE!", difficulty = "HARDEST", speed = 3, bestTime = 0}, -- 这里是硬编码的
 {name = "", difficulty = "CUSTOM", speed = 2, bestTime = 0},
}

DiskDriveHEX.Player = {
 angle = 0,
 size = 15,
 distanceOffset = 40,
 collisionSizeMultiplier = 0.75 -- 玩家的碰撞箱倍率
}

DiskDriveHEX.Hexagon = {
 radius = 100,
 pulseMin = 110,
 pulseMax = 120,
 pulseSpeed = 0.5,
 rotation = 0,
 rotationSpeed = 0.1,
 outlineThickness = 10,
 currentPulseRadius = 100
}

DiskDriveHEX.Obstacles = {}
DiskDriveHEX.ObstacleSettings = {
 spawnDistance = 1300,
 thickness = 80,
 lastSpawn = 0,
 baseSpeed = 200,
 spawnRate = 2
}

DiskDriveHEX.CustomSettings = {
 palette1Light = Color(150, 150, 150, 255),
 palette1Dark = Color(100, 100, 100, 255),
 palette1Object = Color(200, 200, 200, 128),
 palette1Invert = Color(200, 200, 200, 255),
 palette2Light = Color(200, 100, 100, 255),
 palette2Dark = Color(150, 50, 50, 255),
 palette2Object = Color(255, 150, 150, 128),
 palette2Invert = Color(255, 150, 150, 255),
 customSpeed = 2,
 customName = "Custom",
 customMusic = "DiskDriveCHM/Courtesy.wav",
 showPlayerInfo = true,
 showInputDisplay = false,
 enableColorPad = false, -- 自定义色板参数
 enableRandomRotation = false, -- 自定义转圈转圈转圈圈参数
 Cai_B_Mode = false -- 菜就多练
}

-- 检查ColorPad的触发机制
function DiskDriveHEX.IsColorPadActive()
 return (DiskDriveHEX.SelectedLevel == 3) or (DiskDriveHEX.SelectedLevel == 4 and DiskDriveHEX.CustomSettings.enableColorPad)
end

-- 检查随机转圈参数
function DiskDriveHEX.IsRandomRotationActive()
 return (DiskDriveHEX.SelectedLevel == 3) or (DiskDriveHEX.SelectedLevel == 4 and DiskDriveHEX.CustomSettings.enableRandomRotation)
end

-- 保存所有参数
function DiskDriveHEX.SaveCustomSettings()
 local settings = {
     palette1Light = {r = DiskDriveHEX.CustomSettings.palette1Light.r, g = DiskDriveHEX.CustomSettings.palette1Light.g, b = DiskDriveHEX.CustomSettings.palette1Light.b, a = DiskDriveHEX.CustomSettings.palette1Light.a},
     palette1Dark = {r = DiskDriveHEX.CustomSettings.palette1Dark.r, g = DiskDriveHEX.CustomSettings.palette1Dark.g, b = DiskDriveHEX.CustomSettings.palette1Dark.b, a = DiskDriveHEX.CustomSettings.palette1Dark.a},
     palette1Object = {r = DiskDriveHEX.CustomSettings.palette1Object.r, g = DiskDriveHEX.CustomSettings.palette1Object.g, b = DiskDriveHEX.CustomSettings.palette1Object.b, a = DiskDriveHEX.CustomSettings.palette1Object.a},
     palette1Invert = {r = DiskDriveHEX.CustomSettings.palette1Invert.r, g = DiskDriveHEX.CustomSettings.palette1Invert.g, b = DiskDriveHEX.CustomSettings.palette1Invert.b, a = DiskDriveHEX.CustomSettings.palette1Invert.a},
     palette2Light = {r = DiskDriveHEX.CustomSettings.palette2Light.r, g = DiskDriveHEX.CustomSettings.palette2Light.g, b = DiskDriveHEX.CustomSettings.palette2Light.b, a = DiskDriveHEX.CustomSettings.palette2Light.a},
     palette2Dark = {r = DiskDriveHEX.CustomSettings.palette2Dark.r, g = DiskDriveHEX.CustomSettings.palette2Dark.g, b = DiskDriveHEX.CustomSettings.palette2Dark.b, a = DiskDriveHEX.CustomSettings.palette2Dark.a},
     palette2Object = {r = DiskDriveHEX.CustomSettings.palette2Object.r, g = DiskDriveHEX.CustomSettings.palette2Object.g, b = DiskDriveHEX.CustomSettings.palette2Object.b, a = DiskDriveHEX.CustomSettings.palette2Object.a},
     palette2Invert = {r = DiskDriveHEX.CustomSettings.palette2Invert.r, g = DiskDriveHEX.CustomSettings.palette2Invert.g, b = DiskDriveHEX.CustomSettings.palette2Invert.b, a = DiskDriveHEX.CustomSettings.palette2Invert.a},
     customSpeed = DiskDriveHEX.CustomSettings.customSpeed,
     customName = DiskDriveHEX.CustomSettings.customName,
     customMusic = DiskDriveHEX.CustomSettings.customMusic,
     showPlayerInfo = DiskDriveHEX.CustomSettings.showPlayerInfo,
     showInputDisplay = DiskDriveHEX.CustomSettings.showInputDisplay,
     enableColorPad = DiskDriveHEX.CustomSettings.enableColorPad,
     enableRandomRotation = DiskDriveHEX.CustomSettings.enableRandomRotation,
     Cai_B_Mode = DiskDriveHEX.CustomSettings.Cai_B_Mode -- 你是不是菜？你是不是菜？
 }
 file.Write("DiskDriveHexagon_custom.txt", util.TableToJSON(settings))
end

function DiskDriveHEX.LoadCustomSettings()
 if file.Exists("DiskDriveHexagon_custom.txt", "DATA") then
     local data = util.JSONToTable(file.Read("DiskDriveHexagon_custom.txt", "DATA"))
     if data then
         DiskDriveHEX.CustomSettings.palette1Light = Color(data.palette1Light.r or 150, data.palette1Light.g or 150, data.palette1Light.b or 150, data.palette1Light.a or 255)
         DiskDriveHEX.CustomSettings.palette1Dark = Color(data.palette1Dark.r or 100, data.palette1Dark.g or 100, data.palette1Dark.b or 100, data.palette1Dark.a or 255)
         DiskDriveHEX.CustomSettings.palette1Object = Color(data.palette1Object.r or 200, data.palette1Object.g or 200, data.palette1Object.b or 200, data.palette1Object.a or 128)
         DiskDriveHEX.CustomSettings.palette1Invert = Color(data.palette1Invert.r or 200, data.palette1Invert.g or 200, data.palette1Invert.b or 200, data.palette1Invert.a or 255)
         DiskDriveHEX.CustomSettings.palette2Light = Color(data.palette2Light.r or 200, data.palette2Light.g or 100, data.palette2Light.b or 100, data.palette2Light.a or 255)
         DiskDriveHEX.CustomSettings.palette2Dark = Color(data.palette2Dark.r or 150, data.palette2Dark.g or 50, data.palette2Dark.b or 50, data.palette2Dark.a or 255)
         DiskDriveHEX.CustomSettings.palette2Object = Color(data.palette2Object.r or 255, data.palette2Object.g or 150, data.palette2Object.b or 150, data.palette2Object.a or 128)
         DiskDriveHEX.CustomSettings.palette2Invert = Color(data.palette2Invert.r or 255, data.palette2Invert.g or 150, data.palette2Invert.b or 150, data.palette2Invert.a or 255)
         DiskDriveHEX.CustomSettings.customSpeed = data.customSpeed or 2
         DiskDriveHEX.CustomSettings.customName = data.customName or "Custom"
         DiskDriveHEX.CustomSettings.customMusic = data.customMusic or "DiskDriveCHM/Courtesy.wav"
         DiskDriveHEX.CustomSettings.showPlayerInfo = data.showPlayerInfo -- 向下兼容
         if DiskDriveHEX.CustomSettings.showPlayerInfo == nil then DiskDriveHEX.CustomSettings.showPlayerInfo = true end
         DiskDriveHEX.CustomSettings.showInputDisplay = data.showInputDisplay or false
         DiskDriveHEX.CustomSettings.enableColorPad = data.enableColorPad or false
         DiskDriveHEX.CustomSettings.enableRandomRotation = data.enableRandomRotation or false
         DiskDriveHEX.Levels[4].name = DiskDriveHEX.CustomSettings.customName
         DiskDriveHEX.ShowPlayerInfo = DiskDriveHEX.CustomSettings.showPlayerInfo
         DiskDriveHEX.ShowInputDisplay = DiskDriveHEX.CustomSettings.showInputDisplay
         DiskDriveHEX.Cai_B_Mode = DiskDriveHEX.CustomSettings.Cai_B_Mode
     end
 end
end

function DiskDriveHEX.SaveHighScores()
 local highScores = {}
 for i, level in ipairs(DiskDriveHEX.Levels) do
     highScores[i] = level.bestTime
 end
 file.Write("DiskDriveHexagon_highscores.txt", util.TableToJSON(highScores))
end

function DiskDriveHEX.LoadHighScores()
 if file.Exists("DiskDriveHexagon_highscores.txt", "DATA") then
     local data = util.JSONToTable(file.Read("DiskDriveHexagon_highscores.txt", "DATA"))
     if data then
         for i, score in ipairs(data) do
             if DiskDriveHEX.Levels[i] then
                 DiskDriveHEX.Levels[i].bestTime = tonumber(score) or 0
             end
         end
     end
 end
end

function DiskDriveHEX.ClearSaveData()
 if file.Exists("DiskDriveHexagon_highscores.txt", "DATA") then
     file.Delete("DiskDriveHexagon_highscores.txt")
 end
 if file.Exists("DiskDriveHexagon_custom.txt", "DATA") then
     file.Delete("DiskDriveHexagon_custom.txt")
 end
 for _, level in ipairs(DiskDriveHEX.Levels) do
     level.bestTime = 0
 end
 -- 重置所有参数
 DiskDriveHEX.CustomSettings = {
     palette1Light = Color(150, 150, 150, 255),
     palette1Dark = Color(100, 100, 100, 255),
     palette1Object = Color(200, 200, 200, 128),
     palette1Invert = Color(200, 200, 200, 255),
     palette2Light = Color(200, 100, 100, 255),
     palette2Dark = Color(150, 50, 50, 255),
     palette2Object = Color(255, 150, 150, 128),
     palette2Invert = Color(255, 150, 150, 255),
     customSpeed = 4, -- 直接开始干，它受不了的
     customName = "Custom",
     customMusic = "DiskDriveCHM/Courtesy.wav",
     showPlayerInfo = true,
     showInputDisplay = false,
     enableColorPad = false,
     enableRandomRotation = false,
     Cai_B_Mode = false -- 菜死你得了
 }
 DiskDriveHEX.Levels[4].name = "Custom"
 DiskDriveHEX.ShowPlayerInfo = DiskDriveHEX.CustomSettings.showPlayerInfo
 DiskDriveHEX.ShowInputDisplay = DiskDriveHEX.CustomSettings.showInputDisplay
 DiskDriveHEX.Cai_B_Mode = DiskDriveHEX.CustomSettings.Cai_B_Mode
 DiskDriveHEX.SaveCustomSettings()
 DiskDriveHEX.SaveHighScores()
 print("DiskDrive Hexagon: All save data cleared!")
end

DiskDriveHEX.LoadCustomSettings()
DiskDriveHEX.LoadHighScores()

surface.CreateFont("DiskDriveMillennium", {
 font = "Bump it up fixed 0",
 size = 50,
 weight = 700,
 antialias = true
})

surface.CreateFont("DiskDriveMillenniumSmall", {
 font = "Bump it up fixed 0",
 size = 40,
 weight = 500,
 antialias = true
})

surface.CreateFont("DiskDriveHUDSmall", {
 font = "DiskDriveHUD3",
 size = 40,
 weight = 500,
 antialias = true
})

surface.CreateFont("DiskDriveMillenniumLarge", {
 font = "Bump it up fixed 0",
 size = 70,
 weight = 700,
 antialias = true
})

surface.CreateFont("DiskDriveMillenniumHuge", {
 font = "Bump it up fixed 0",
 size = 96,
 weight = 700,
 antialias = true
})

surface.CreateFont("DiskDriveHUDHuge", {
 font = "DiskDriveHUD3",
 size = 144,
 weight = 100,
 antialias = true
})

function DiskDriveHEX.LerpColor(col1, col2, t)
 t = math.Clamp(t, 0, 1) -- 调色板变换
 col1 = col1 or Color(0,0,0,255)
 col2 = col2 or Color(0,0,0,255)
 return Color(
     Lerp(t, col1.r, col2.r),
     Lerp(t, col1.g, col2.g),
     Lerp(t, col1.b, col2.b),
     Lerp(t, col1.a, col2.a)
 )
end

function DiskDriveHEX.SmoothStep(t)
 if type(t) ~= "number" then
     t = 0
 end
 t = math.Clamp(t, 0, 1)
 return t * t * (3 - 2 * t)
end


function DiskDriveHEX.DrawOutlinedText(text, font, x, y, color, align, outlineColor)
 if not outlineColor then
     local targetAlpha = math.floor(color.a * DiskDriveHEX.OutlineAlphaMultiplier)
     outlineColor = Color(0, 130, 255, targetAlpha)
 end

 for offsetX = -3, 3, 3 do
     for offsetY = -3, 3, 3 do
         if offsetX ~= 0 or offsetY ~= 0 then
             draw.SimpleText(text, font, x + offsetX, y + offsetY, outlineColor, align)
         end
     end
 end
 draw.SimpleText(text, font, x, y, color, align)
end

-- RGB线性插值
function DiskDriveHEX.GetRainbowInterpolatedColor()
 if not DiskDriveHEX.ColorPad.active then return nil end

 local t = 0
 if DiskDriveHEX.ColorPad.isFadingToGrayscale then
     t = DiskDriveHEX.SmoothStep(math.min(DiskDriveHEX.ColorPad.currentTransitionTime / DiskDriveHEX.ColorPad.grayscaleFadeDuration, 1))
 elseif DiskDriveHEX.ColorPad.isGrayscale then
     return DiskDriveHEX.GrayscaleColor -- 通关后进入灰度模式
 else
      t = DiskDriveHEX.SmoothStep(math.min(DiskDriveHEX.ColorPad.currentTransitionTime / DiskDriveHEX.ColorPad.transitionDuration, 1))
 end

 return DiskDriveHEX.LerpColor(DiskDriveHEX.ColorPad.currentColor, DiskDriveHEX.ColorPad.targetColor, t)
end

function DiskDriveHEX.GetCurrentColorScheme()
 -- 这就是真正的色!彩!(RGB彩虹色板处理机制)，此次，读取关卡FLAG，通过关卡头来确定是否启用随机色板模式
 if DiskDriveHEX.IsColorPadActive() and DiskDriveHEX.ColorPad.active then
     local ColorPad = DiskDriveHEX.GetRainbowInterpolatedColor()
     if ColorPad then
         -- 调色板生成函数，根据随机传入的颜色值自动生成对应的色板
         local darkColor = DiskDriveHEX.LerpColor(ColorPad, Color(0, 0, 0, ColorPad.a), 0.4)
         local objectColor = DiskDriveHEX.LerpColor(ColorPad, Color(255, 255, 255, 180), 0.5) -- 让障碍的色板稍微变!亮!
         objectColor.a = 180 -- 障碍的Alpha值低一些，实现分层视觉
         local invertColor = Color(255 - ColorPad.r, 255 - ColorPad.g, 255 - ColorPad.b, 255) -- 反色效果

         -- 在进入灰白色板之前，翻转色板颜色即可做出非常帅的过渡动画
         if DiskDriveHEX.Score > 60 then
              DiskDriveHEX.ColorTransition.extendedBlend = math.min(DiskDriveHEX.ColorTransition.extendedBlend + FrameTime(), 1) -- 使用帧间时间(妈的别再用高帧率了我真的红温了)
              local hyperT = DiskDriveHEX.SmoothStep(DiskDriveHEX.ColorTransition.extendedBlend)
              return {
                  light = DiskDriveHEX.LerpColor(ColorPad, invertColor, hyperT),
                  dark = DiskDriveHEX.LerpColor(darkColor, darkColor, hyperT), -- 暗色区块仍然使用较暗的色板
                  object = DiskDriveHEX.LerpColor(objectColor, ColorPad, hyperT), -- 直接肘击它，它受不了的
                  invert = invertColor
              }
         end

         return {
             light = ColorPad,
             dark = darkColor,
             object = objectColor,
             invert = invertColor
         }
     end
 end

 -- 当未使用随机色板模式时，读取读取默认设置
 local levelScheme = DiskDriveHEX.ColorSchemes[DiskDriveHEX.SelectedLevel]
 local pal1, pal2

 if DiskDriveHEX.SelectedLevel == 4 then
     pal1 = {
         light = DiskDriveHEX.CustomSettings.palette1Light,
         dark = DiskDriveHEX.CustomSettings.palette1Dark,
         object = DiskDriveHEX.CustomSettings.palette1Object,
         invert = DiskDriveHEX.CustomSettings.palette1Invert
     }
     pal2 = {
         light = DiskDriveHEX.CustomSettings.palette2Light,
         dark = DiskDriveHEX.CustomSettings.palette2Dark,
         object = DiskDriveHEX.CustomSettings.palette2Object,
         invert = DiskDriveHEX.CustomSettings.palette2Invert
     }
 else
     -- 给Nil值爆了（生气）
     if not levelScheme then return DiskDriveHEX.ColorSchemes[1].palette1 end -- Default to level 1 palette 1 if something is wrong
     pal1 = levelScheme.palette1
     pal2 = levelScheme.palette2
 end

 -- 传递平滑参数值进行平滑渐变
 local t = DiskDriveHEX.SmoothStep(DiskDriveHEX.ColorTransition.blendFactor)
 local baseScheme = {
     light = DiskDriveHEX.LerpColor(pal1.light, pal2.light, t),
     dark = DiskDriveHEX.LerpColor(pal1.dark, pal2.dark, t),
     object = DiskDriveHEX.LerpColor(pal1.object, pal2.object, t),
     invert = DiskDriveHEX.LerpColor(pal1.invert, pal2.invert, t)
 }

 -- Hyper Mode混合参数，普通调色板
 if DiskDriveHEX.Score > 60 then
     DiskDriveHEX.ColorTransition.extendedBlend = math.min(DiskDriveHEX.ColorTransition.extendedBlend + FrameTime(), 1)
     local hyperT = DiskDriveHEX.SmoothStep(DiskDriveHEX.ColorTransition.extendedBlend)
     --HYPER模式下，反转色板
     return {
         light = DiskDriveHEX.LerpColor(baseScheme.light, baseScheme.invert, hyperT), 
         dark = DiskDriveHEX.LerpColor(baseScheme.dark, baseScheme.dark, hyperT), 
         object = DiskDriveHEX.LerpColor(baseScheme.object, baseScheme.light, hyperT),
         invert = baseScheme.invert
     }
 end

 return baseScheme
end


function DiskDriveHEX.Initialize()
 DiskDriveHEX.LastTime = CurTime() -- 初始化帧间隔计时器
 DiskDriveHEX.Player.angle = 0
 DiskDriveHEX.Hexagon.rotation = 0
 DiskDriveHEX.BackgroundRotation = 0 -- 重置背景旋转值
 DiskDriveHEX.Obstacles = {}
 DiskDriveHEX.Score = 0
 DiskDriveHEX.StartTime = CurTime()
 DiskDriveHEX.GameOver = false
 DiskDriveHEX.GameOverState = "none" -- 重置游戏结束状态
 DiskDriveHEX.GameOverFreeze = false
 DiskDriveHEX.GameOverTextPosX = 0
 DiskDriveHEX.InMenu = false
 DiskDriveHEX.RotationDirection = 1
 DiskDriveHEX.RotationSpeedMultiplier = 1
 DiskDriveHEX.LastRotationChange = CurTime()
 DiskDriveHEX.LastBackgroundRotate = CurTime() -- 初始化背景跳动
 DiskDriveHEX.NextBackgroundRotateInterval = math.Rand(1, 3) -- 1到3秒的随机间隔
 DiskDriveHEX.NextBackgroundRotateTime = CurTime() + DiskDriveHEX.NextBackgroundRotateInterval -- 直接开肘！

 DiskDriveHEX.Pulse.active = false
 DiskDriveHEX.Pulse.nextPulseTime = CurTime() + math.Rand(DiskDriveHEX.Pulse.minInterval, DiskDriveHEX.Pulse.maxInterval)

 DiskDriveHEX.Difficulty.rotationSpeed = 1
 DiskDriveHEX.Difficulty.obstacleSpeed = 1
 DiskDriveHEX.Difficulty.lastRotationIncrease = CurTime()
 DiskDriveHEX.Difficulty.lastObstacleIncrease = CurTime()
 DiskDriveHEX.ObstacleSettings.spawnRate = 2

 DiskDriveHEX.EndAnimation.active = false
 DiskDriveHEX.EndAnimation.currentRadius = DiskDriveHEX.Hexagon.radius -- 重置六边形动画半径

 DiskDriveHEX.StartAnimation.active = true
 DiskDriveHEX.StartAnimation.startTime = CurTime()
 DiskDriveHEX.StartAnimation.currentRadius = DiskDriveHEX.StartAnimation.startRadius

 -- 重置颜色渐变状态机
 DiskDriveHEX.ColorTransition.blendFactor = 0
 DiskDriveHEX.ColorTransition.extendedBlend = 0
 DiskDriveHEX.ColorTransition.transitionProgress = 0
 DiskDriveHEX.ColorTransition.targetBlend = 0 -- 从色板1取色
 DiskDriveHEX.ColorTransition.lastSwitchTime = CurTime()
 DiskDriveHEX.HyperModeTransition.alpha = 0

 -- 初始化ColorPad机制
 DiskDriveHEX.ColorPad.active = DiskDriveHEX.IsColorPadActive()
 if DiskDriveHEX.ColorPad.active then
     DiskDriveHEX.ColorPad.lastSwitchTime = CurTime()
     DiskDriveHEX.ColorPad.currentTransitionTime = 0
     DiskDriveHEX.ColorPad.isGrayscale = false
     DiskDriveHEX.ColorPad.isFadingToGrayscale = false
     -- 随机取色
     local startIndex = math.random(1, #DiskDriveHEX.RainbowPalette)
     local targetIndex = math.random(1, #DiskDriveHEX.RainbowPalette - 1)
     if targetIndex >= startIndex then targetIndex = targetIndex + 1 end
     DiskDriveHEX.ColorPad.currentColor = DiskDriveHEX.RainbowPalette[startIndex]
     DiskDriveHEX.ColorPad.targetColor = DiskDriveHEX.RainbowPalette[targetIndex]
     DiskDriveHEX.ColorPad.currentTransitionTime = DiskDriveHEX.ColorPad.transitionDuration
 end

 -- 初始化随机转转转状态机
 DiskDriveHEX.RandomRotation.active = DiskDriveHEX.IsRandomRotationActive()
 if DiskDriveHEX.RandomRotation.active then
     DiskDriveHEX.RandomRotation.lastEventTime = CurTime()
     DiskDriveHEX.RandomRotation.nextEventTime = CurTime() + math.Rand(10, 16)
     DiskDriveHEX.RandomRotation.isRotating = false
     DiskDriveHEX.RandomRotation.startRotation = DiskDriveHEX.Hexagon.rotation
     DiskDriveHEX.RandomRotation.targetRotation = 0
 end

 DiskDriveHEX.NewBestAnimation.active = false
 DiskDriveHEX.NewBestAnimation.triggeredThisGame = false -- 重置标志

 if DiskDriveHEX.SelectedLevel == 1 then
     DiskDriveHEX.Tutorial.active = true
     DiskDriveHEX.Tutorial.startTime = CurTime()
     DiskDriveHEX.Tutorial.alpha = 255
 else
     DiskDriveHEX.Tutorial.active = false
 end

 for time in pairs(DiskDriveHEX.VoiceTriggers) do
     DiskDriveHEX.VoiceTriggers[time] = false
 end

 if DiskDriveHEX.Music then
     DiskDriveHEX.Music:Stop()
 end
 local musicFile = (DiskDriveHEX.SelectedLevel == 4) and DiskDriveHEX.CustomSettings.customMusic or DiskDriveHEX.ColorSchemes[DiskDriveHEX.SelectedLevel].music
 sound.PlayFile("sound/" .. musicFile, "noblock", function(station)
     if IsValid(station) then
         DiskDriveHEX.Music = station
         station:Play()
         station:SetVolume(0.5)
         station:EnableLooping(true)
     end
 end)

 if DiskDriveHEX.SelectedLevel == 4 then
     DiskDriveHEX.Levels[4].speed = DiskDriveHEX.CustomSettings.customSpeed
     DiskDriveHEX.Levels[4].name = DiskDriveHEX.CustomSettings.customName
 end
end

function DiskDriveHEX.StopMusic()
 if DiskDriveHEX.Music and IsValid(DiskDriveHEX.Music) then
     DiskDriveHEX.Music:Stop()
     DiskDriveHEX.Music = nil
 end
end

function DiskDriveHEX.ReturnToMenu()
 DiskDriveHEX.InMenu = true
 DiskDriveHEX.GameOver = false
 DiskDriveHEX.GameOverState = "none" -- 回到菜单时应该重置状态
 DiskDriveHEX.GameOverFreeze = false
 DiskDriveHEX.Hexagon.radius = 100
 DiskDriveHEX.Hexagon.currentPulseRadius = 100
 DiskDriveHEX.StopMusic()

 -- 回菜单时重置色板参数
 DiskDriveHEX.ColorTransition.blendFactor = 0 -- 重置混合参数
 DiskDriveHEX.ColorTransition.targetBlend = 0
 DiskDriveHEX.ColorTransition.transitionProgress = 1 -- 立即完成色板切换
 DiskDriveHEX.ColorTransition.extendedBlend = 0
 DiskDriveHEX.HyperModeTransition.alpha = 0

 -- 禁用特殊参数
 DiskDriveHEX.ColorPad.active = false
 DiskDriveHEX.RandomRotation.active = false
 DiskDriveHEX.RandomRotation.isRotating = false -- 让转圈停下来

 DiskDriveHEX.BackgroundRotation = 0

 if DiskDriveHEX.PlayerAvatar then DiskDriveHEX.PlayerAvatar:SetVisible(false) end
end

-- 这里是伪3D旋转变换参数
function DiskDriveHEX.GetTransformMatrix(time)
 local angleX = math.sin(time * 0.2) * 0.27
 local angleY = math.cos(time * 0.15) * 0.27
 local cosX, sinX = math.cos(angleX), math.sin(angleX)
 local cosY, sinY = math.cos(angleY), math.sin(angleY)

 local rotX = {
     {1, 0, 0},
     {0, cosX, -sinX},
     {0, sinX, cosX}
 }
 local rotY = {
     {cosY, 0, sinY},
     {0, 1, 0},
     {-sinY, 0, cosY}
 }

 local transform = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}}
 for i = 1, 3 do
     local t1, t2, t3 = 0, 0, 0
     for j = 1, 3 do
         t1 = t1 + rotX[i][j] * (rotY[j][1] or 0)
         t2 = t2 + rotX[i][j] * (rotY[j][2] or 0)
         t3 = t3 + rotX[i][j] * (rotY[j][3] or 0)
     end
     transform[i] = {t1, t2, t3}
 end

 return transform
end

function DiskDriveHEX.ProjectPoint(x, y, z, centerX, centerY)
 local d = 1000
 local scale = d / (d + z + 1e-6)
 return centerX + x * scale, centerY + y * scale, scale
end

function DiskDriveHEX.TransformAndProject(points, transform, centerX, centerY, zOffset)
 local transformed = {}
 zOffset = zOffset or 0
 for _, p in ipairs(points) do
     local x, y, z = p.x, p.y, (p.z or 0) + zOffset
     local tx = transform[1][1] * x + transform[1][2] * y + transform[1][3] * z
     local ty = transform[2][1] * x + transform[2][2] * y + transform[2][3] * z
     local tz = transform[3][1] * x + transform[3][2] * y + transform[3][3] * z
     local px, py, scale = DiskDriveHEX.ProjectPoint(tx, ty, tz, centerX, centerY)
     table.insert(transformed, {x = px, y = py, scale = scale})
 end
 return transformed
end

function DiskDriveHEX.DrawHexagon(x, y, radius, rotation, colorScheme, transform)
 local sides = 6
 local points = {}

 for i = 0, sides - 1 do
     local angle = math.rad(rotation + (i * 360 / sides))
     table.insert(points, {
         x = math.cos(angle) * radius,
         y = math.sin(angle) * radius,
         z = 0
     })
 end

 local projected = DiskDriveHEX.TransformAndProject(points, transform, x, y, 0)

 -- fallback参数
 if not colorScheme or not colorScheme.light then
     colorScheme = { light = Color(255,255,255), object = Color(200,200,200) } -- 这是默认值
 end

 surface.SetDrawColor(colorScheme.light)
 draw.NoTexture()
 surface.DrawPoly(projected)

 surface.SetDrawColor(colorScheme.object)
 for thickness = 1, DiskDriveHEX.Hexagon.outlineThickness do
     local offset = thickness - DiskDriveHEX.Hexagon.outlineThickness / 2
     local offsetPoints = {}

     for i = 0, sides - 1 do
         local angle = math.rad(rotation + (i * 360 / sides))
         local offsetRadius = radius + offset
         table.insert(offsetPoints, {
             x = math.cos(angle) * offsetRadius,
             y = math.sin(angle) * offsetRadius,
             z = 0
         })
     end

     local projectedOffset = DiskDriveHEX.TransformAndProject(offsetPoints, transform, x, y, 0)
     for i = 1, #projectedOffset do
         local nextIndex = i % #projectedOffset + 1
         surface.DrawLine(projectedOffset[i].x, projectedOffset[i].y, projectedOffset[nextIndex].x, projectedOffset[nextIndex].y)
     end
 end
end

function DiskDriveHEX.DrawPlayer(x, y, angle, radius, colorScheme, transform)
 if DiskDriveHEX.GameOverFreeze then return end

 local size = DiskDriveHEX.Player.size -- 绘制玩家
 local effectiveAngle = angle + DiskDriveHEX.Hexagon.rotation
 local playerDistance = radius + DiskDriveHEX.Player.distanceOffset

 local centerPoint = {
     x = math.cos(math.rad(effectiveAngle)) * playerDistance,
     y = math.sin(math.rad(effectiveAngle)) * playerDistance,
     z = 0
 }

 local triangleOffsets = {
     {x = math.cos(math.rad(effectiveAngle)) * size, y = math.sin(math.rad(effectiveAngle)) * size},
     {x = math.cos(math.rad(effectiveAngle + 120)) * size, y = math.sin(math.rad(effectiveAngle + 120)) * size},
     {x = math.cos(math.rad(effectiveAngle + 240)) * size, y = math.sin(math.rad(effectiveAngle + 240)) * size}
 }

 local trianglePoints = {}
 for _, offset in ipairs(triangleOffsets) do
     table.insert(trianglePoints, {
         x = centerPoint.x + offset.x,
         y = centerPoint.y + offset.y,
         z = 0
     })
 end

 local projected = DiskDriveHEX.TransformAndProject(trianglePoints, transform, x, y, 0)

 if not colorScheme or not colorScheme.object then
    colorScheme = { object = Color(200,200,200) } -- 默认的回滚参数
 end

 surface.SetDrawColor(colorScheme.object)
 draw.NoTexture()
 surface.DrawPoly(projected)
end

function DiskDriveHEX.SpawnObstacle()
 local patterns = {"100000", "110000", "101000", "100100", "100010", "111000", "101100", "100110", "101010", "111100", "101110", "101011", "101101", "111110"}
 local pattern = patterns[math.random(1, #patterns)]
 local sideCount = 0
 local walls = {}

 local randomness = math.random(0, 5) * 60

 for i = 1, 6 do
     if pattern:sub(i,i) == "1" then
         sideCount = sideCount + 1
         table.insert(walls, {
             distance = DiskDriveHEX.ObstacleSettings.spawnDistance,
             side = (i - 1 + math.floor(randomness / 60)) % 6,
             creationTime = CurTime(),
             thickness = DiskDriveHEX.ObstacleSettings.thickness
         })
     end
 end

 local level = DiskDriveHEX.Levels[DiskDriveHEX.SelectedLevel]
 local speedFactor = (level and level.speed or 1) * DiskDriveHEX.Difficulty.obstacleSpeed
 local nextSpawnDelay = (0.7 + sideCount * 0.4) / math.max(0.1, speedFactor) -- 细分参数
 DiskDriveHEX.ObstacleSettings.spawnRate = nextSpawnDelay

 for _, wall in ipairs(walls) do
     table.insert(DiskDriveHEX.Obstacles, wall)
 end
end

function DiskDriveHEX.DrawObstacles(centerX, centerY, colorScheme, transform)
 if not colorScheme or not colorScheme.object then
    colorScheme = { object = Color(200,200,200) } -- 默认值
 end

 surface.SetDrawColor(colorScheme.object) -- 在循环外设置颜色

 for i, wall in pairs(DiskDriveHEX.Obstacles) do
     local sideAngle = wall.side * 60
     local startAngle = sideAngle + DiskDriveHEX.Hexagon.rotation
     local endAngle = startAngle + 60

     -- 优化了碰撞检测和体积检查
     local innerRadius = wall.distance
     local outerRadius = wall.distance + wall.thickness

     if innerRadius > DiskDriveHEX.ObstacleSettings.spawnDistance + 1000 then goto skip_obstacle end

     local pointsInner = {
         {x = math.cos(math.rad(startAngle)) * innerRadius, y = math.sin(math.rad(startAngle)) * innerRadius, z = 0},
         {x = math.cos(math.rad(endAngle)) * innerRadius, y = math.sin(math.rad(endAngle)) * innerRadius, z = 0}
     }
     local pointsOuter = {
         {x = math.cos(math.rad(startAngle)) * outerRadius, y = math.sin(math.rad(startAngle)) * outerRadius, z = 0},
         {x = math.cos(math.rad(endAngle)) * outerRadius, y = math.sin(math.rad(endAngle)) * outerRadius, z = 0}
     }

     local projectedInner = DiskDriveHEX.TransformAndProject(pointsInner, transform, centerX, centerY, 0)
     local projectedOuter = DiskDriveHEX.TransformAndProject(pointsOuter, transform, centerX, centerY, 0)

     if #projectedInner == 2 and #projectedOuter == 2 then
         local poly = {
             projectedInner[1],
             projectedOuter[1],
             projectedOuter[2],
             projectedInner[2]
         }
         local onScreen = false
         for _, p in ipairs(poly) do
             if p.x > -500 and p.x < ScrW() + 500 and p.y > -500 and p.y < ScrH() + 500 then
                 onScreen = true
                 break
             end
         end
         if onScreen then
             surface.DrawPoly(poly)
         end
     else
     end
     ::skip_obstacle::
 end
end

function DiskDriveHEX.UpdatePulse(dt)
 if not DiskDriveHEX.Pulse.active and CurTime() >= DiskDriveHEX.Pulse.nextPulseTime then
     DiskDriveHEX.Pulse.active = true
     DiskDriveHEX.Pulse.duration = math.Rand(DiskDriveHEX.Pulse.minDuration, DiskDriveHEX.Pulse.maxDuration)
     DiskDriveHEX.Pulse.intensity = math.Rand(DiskDriveHEX.Pulse.minIntensity, DiskDriveHEX.Pulse.maxIntensity)
     DiskDriveHEX.Pulse.timer = 0
 end

 if DiskDriveHEX.Pulse.active then
     DiskDriveHEX.Pulse.timer = DiskDriveHEX.Pulse.timer + dt
     if DiskDriveHEX.Pulse.timer >= DiskDriveHEX.Pulse.duration then
         DiskDriveHEX.Pulse.active = false
         DiskDriveHEX.Pulse.nextPulseTime = CurTime() + math.Rand(DiskDriveHEX.Pulse.minInterval, DiskDriveHEX.Pulse.maxInterval)
     end
 end

 local pulseRange = DiskDriveHEX.Hexagon.pulseMax - DiskDriveHEX.Hexagon.pulseMin
 local baseRadius = DiskDriveHEX.Hexagon.pulseMin + (math.sin(CurTime() * DiskDriveHEX.Hexagon.pulseSpeed) + 1) * 0.5 * pulseRange
 local pulseEffect = 0
 if DiskDriveHEX.Pulse.active then
     local pulseProgress = DiskDriveHEX.Pulse.timer / math.max(0.01, DiskDriveHEX.Pulse.duration)
     pulseEffect = math.sin(pulseProgress * math.pi) * DiskDriveHEX.Pulse.intensity
 end

 if DiskDriveHEX.EndAnimation.active then
 elseif DiskDriveHEX.StartAnimation.active then
     DiskDriveHEX.Hexagon.currentPulseRadius = DiskDriveHEX.StartAnimation.currentRadius
 else
     DiskDriveHEX.Hexagon.currentPulseRadius = math.max(1, baseRadius + pulseEffect)
 end

 if DiskDriveHEX.EndAnimation.active then
     return DiskDriveHEX.EndAnimation.currentRadius
 elseif DiskDriveHEX.StartAnimation.active then
      return DiskDriveHEX.StartAnimation.currentRadius
 else
     return DiskDriveHEX.Hexagon.currentPulseRadius
 end
end

function DiskDriveHEX.UpdateEndAnimation(dt)
 if not DiskDriveHEX.EndAnimation.active then return end

 local timeElapsed = CurTime() - DiskDriveHEX.EndAnimation.startTime
 local progress = math.min(timeElapsed / math.max(0.01, DiskDriveHEX.EndAnimation.duration), 1)
 local easedProgress = 1 - (1 - progress) * (1 - progress)
 DiskDriveHEX.EndAnimation.currentRadius = Lerp(easedProgress, DiskDriveHEX.EndAnimation.startRadius, DiskDriveHEX.EndAnimation.targetRadius)

end

function DiskDriveHEX.UpdateStartAnimation(dt)
 if not DiskDriveHEX.StartAnimation.active then return end

 local timeElapsed = CurTime() - DiskDriveHEX.StartAnimation.startTime
 local progress = math.min(timeElapsed / math.max(0.01, DiskDriveHEX.StartAnimation.duration), 1)
 local easedProgress = progress * progress
 DiskDriveHEX.StartAnimation.currentRadius = Lerp(easedProgress, DiskDriveHEX.StartAnimation.startRadius, DiskDriveHEX.StartAnimation.targetRadius)

 if progress >= 1 then
     DiskDriveHEX.StartAnimation.active = false
     DiskDriveHEX.Hexagon.currentPulseRadius = DiskDriveHEX.StartAnimation.targetRadius
 end
end

function DiskDriveHEX.UpdateTutorialAnimation(dt)
 if not DiskDriveHEX.Tutorial.active then return end

 local timeElapsed = CurTime() - DiskDriveHEX.Tutorial.startTime
 local progress = math.min(timeElapsed / math.max(0.01, DiskDriveHEX.Tutorial.duration), 1)
 DiskDriveHEX.Tutorial.alpha = Lerp(progress, 255, 0)

 if progress >= 1 then
     DiskDriveHEX.Tutorial.active = false
 end
end

function DiskDriveHEX.UpdateNewBestAnimation(dt)
 if not DiskDriveHEX.NewBestAnimation.active then return end

 local elapsed = CurTime() - DiskDriveHEX.NewBestAnimation.startTime
 local blinkTime = DiskDriveHEX.NewBestAnimation.blinkInterval * (DiskDriveHEX.NewBestAnimation.maxBlinks * 2)
 local fadeStartTime = blinkTime
 local fadeEndTime = fadeStartTime + DiskDriveHEX.NewBestAnimation.fadeDuration

 if elapsed < blinkTime then

     DiskDriveHEX.NewBestAnimation.blinkCount = math.floor(elapsed / math.max(0.01, DiskDriveHEX.NewBestAnimation.blinkInterval)) -- Avoid division by zero
     DiskDriveHEX.NewBestAnimation.alpha = (DiskDriveHEX.NewBestAnimation.blinkCount % 2 == 0) and 255 or 128
 elseif elapsed < fadeEndTime then

     local fadeProgress = (elapsed - fadeStartTime) / math.max(0.01, DiskDriveHEX.NewBestAnimation.fadeDuration)
     DiskDriveHEX.NewBestAnimation.alpha = Lerp(fadeProgress, 255, 0)
 else

     DiskDriveHEX.NewBestAnimation.alpha = 0
     DiskDriveHEX.NewBestAnimation.active = false
 end
end

function DiskDriveHEX.StartEndAnimation()
 DiskDriveHEX.EndAnimation.active = true
 DiskDriveHEX.EndAnimation.startTime = CurTime()
 DiskDriveHEX.EndAnimation.startRadius = DiskDriveHEX.UpdatePulse(0)
 DiskDriveHEX.EndAnimation.currentRadius = DiskDriveHEX.EndAnimation.startRadius

end

--主碰撞检测模块
function DiskDriveHEX.CheckCollision()
 -- 菜！B!
 if DiskDriveHEX.Cai_B_Mode then return false end

 -- 人都死了还检查什么哦
 if DiskDriveHEX.GameOver or DiskDriveHEX.GameOverState ~= "none" then return false end

 local playerAngle = (DiskDriveHEX.Player.angle + DiskDriveHEX.Hexagon.rotation) % 360
 local currentHexRadius = DiskDriveHEX.UpdatePulse(0) -- 同步更新碰撞位置
 local playerDistance = currentHexRadius + DiskDriveHEX.Player.distanceOffset

 -- 碰撞检测在这里
 for _, wall in pairs(DiskDriveHEX.Obstacles) do
     local wallInnerEdge = wall.distance
     local wallOuterEdge = wall.distance + wall.thickness

     -- 检测玩家和障碍的距离
     if playerDistance >= wallInnerEdge and playerDistance <= wallOuterEdge then
         -- 检测玩家的碰撞盒
         local sideAngle = wall.side * 60
         local startAngle = (sideAngle + DiskDriveHEX.Hexagon.rotation) % 360
         local endAngle = (startAngle + 60) % 360

         -- 向量归一化
         local normalizedPlayerAngle = (playerAngle + 360) % 360
         local normalizedStartAngle = (startAngle + 360) % 360
         local normalizedEndAngle = (endAngle + 360) % 360

         local collides = false
         if normalizedEndAngle < normalizedStartAngle then
             if normalizedPlayerAngle >= normalizedStartAngle or normalizedPlayerAngle < normalizedEndAngle then
                 collides = true
             end
         else -- 大家好啊，我是电棍
             -- 检查玩家在范围内的角度，实现碰撞检测
             if normalizedPlayerAngle >= normalizedStartAngle and normalizedPlayerAngle < normalizedEndAngle then
                 collides = true
             end
         end

         if collides then
             return true -- 诶你怎么死了
         end
     end
 end
 return false -- 哇袄
end


function DiskDriveHEX.DrawBackground(centerX, centerY, colorScheme, transform)
 local sides = 6
 -- 背景跳动效果
 local baseRotation = (DiskDriveHEX.Hexagon.rotation or 0) + (DiskDriveHEX.BackgroundRotation or 0)


 if not colorScheme or not colorScheme.light or not colorScheme.dark then
     colorScheme = { light = Color(50,50,150), dark = Color(30,30,100) } -- 默认值
 end

 for i = 0, sides - 1 do
     local startAngle = math.rad(baseRotation + (i * 360 / sides))
     local endAngle = math.rad(baseRotation + ((i + 1) * 360 / sides))

     local extendRadius = math.max(ScrW(), ScrH()) * 1.4
     local points = {
         {x = 0, y = 0, z = 0},
         {x = math.cos(startAngle) * extendRadius, y = math.sin(startAngle) * extendRadius, z = 0},
         {x = math.cos(endAngle) * extendRadius, y = math.sin(endAngle) * extendRadius, z = 0}
     }

     local projected = DiskDriveHEX.TransformAndProject(points, transform, centerX, centerY, 0)

     local color = i % 2 == 0 and colorScheme.light or colorScheme.dark

     surface.SetDrawColor(color)
     draw.NoTexture()
     local p1, p2, p3 = projected[1], projected[2], projected[3]
     if p1 and p2 and p3 then
         -- AABB碰撞盒
         local minX = math.min(p1.x, p2.x, p3.x)
         local maxX = math.max(p1.x, p2.x, p3.x)
         local minY = math.min(p1.y, p2.y, p3.y)
         local maxY = math.max(p1.y, p2.y, p3.y)
         if maxX > 0 and minX < ScrW() and maxY > 0 and minY < ScrH() then
              surface.DrawPoly(projected)
         end
     end
 end
end

DiskDriveHEX.PlayerAvatar = DiskDriveHEX.PlayerAvatar or vgui.Create("AvatarImage")
DiskDriveHEX.PlayerAvatar:SetSize(80, 80)
DiskDriveHEX.PlayerAvatar:SetPos(10, ScrH() - 90)
DiskDriveHEX.PlayerAvatar:SetPlayer(LocalPlayer(), 80)
DiskDriveHEX.PlayerAvatar:SetVisible(false)

--都开内挂了还想保存分数？
function DiskDriveHEX.DrawPlayerInfo()
 if not DiskDriveHEX.ShowPlayerInfo or DiskDriveHEX.InMenu or DiskDriveHEX.GameOver then
     DiskDriveHEX.PlayerAvatar:SetVisible(false)
     return
 end

 local ply = LocalPlayer()
 if not IsValid(ply) then return end

 local level = DiskDriveHEX.Levels[DiskDriveHEX.SelectedLevel]
 if not level then return end

 local currentBestTime = level.bestTime or 0
 local bestTimeText = currentBestTime > 0 and string.format("%.2f", currentBestTime) or "00.00"

 DiskDriveHEX.PlayerAvatar:SetVisible(true)
 DiskDriveHEX.PlayerAvatar:SetPlayer(ply, 80)
 DiskDriveHEX.PlayerAvatar:PaintManual()

 if DiskDriveHEX.Cai_B_Mode then
     DiskDriveHEX.DrawOutlinedText("菜", "DiskDriveMillennium", 50, ScrH() - 144, Color(255, 0, 0, 255), TEXT_ALIGN_CENTER)
 end

 -- 绘制玩家名字
 DiskDriveHEX.DrawOutlinedText(ply:Nick(), "DiskDriveMillenniumSmall", 100, ScrH() - 50, Color(255, 255, 255), TEXT_ALIGN_LEFT)

 -- 绘制最高分或当前分数（如果打破记录）
 local scoreText = DiskDriveHEX.Score > currentBestTime and string.format("%.2f", DiskDriveHEX.Score) or bestTimeText
 local scoreColor = DiskDriveHEX.Score > currentBestTime and Color(255, 215, 0) or Color(200, 200, 200)
 DiskDriveHEX.DrawOutlinedText("BEST: " .. scoreText, "DiskDriveMillenniumSmall", 100, ScrH() - 90, scoreColor, TEXT_ALIGN_LEFT)

 -- 处理“NEW BEST！”动画效果
 if DiskDriveHEX.Score > currentBestTime and currentBestTime > 0 and not DiskDriveHEX.NewBestAnimation.triggeredThisGame then
     DiskDriveHEX.NewBestAnimation.active = true
     DiskDriveHEX.NewBestAnimation.startTime = CurTime()
     DiskDriveHEX.NewBestAnimation.blinkCount = 0
     DiskDriveHEX.NewBestAnimation.alpha = 255
     DiskDriveHEX.NewBestAnimation.triggeredThisGame = true -- 设置标志防止重复触发
     surface.PlaySound("DiskDriveCHM/TrackGroup/Lvls_RecordBreak.wav")
 end

 if DiskDriveHEX.NewBestAnimation.active and DiskDriveHEX.NewBestAnimation.alpha > 0 then
     DiskDriveHEX.DrawOutlinedText("NEW BEST!", "DiskDriveMillennium", 13, ScrH() - 145, Color(255, 148, 112, DiskDriveHEX.NewBestAnimation.alpha), TEXT_ALIGN_LEFT)
 end
end

function DiskDriveHEX.DrawInputDisplay()
 if not DiskDriveHEX.ShowInputDisplay or DiskDriveHEX.InMenu or DiskDriveHEX.GameOver then return end

 local inputs = {}
 if input.IsKeyDown(KEY_LEFT) or input.IsKeyDown(KEY_A) then
     table.insert(inputs, "6")
 end
 if input.IsKeyDown(KEY_RIGHT) or input.IsKeyDown(KEY_D) then
     table.insert(inputs, "7")
 end
 if input.IsKeyDown(KEY_LSHIFT) then
     table.insert(inputs, "=")
 end

 local inputText = table.concat(inputs, " + ")
 if inputText == "" then
     inputText = "NO INPUT"
 end

 DiskDriveHEX.DrawOutlinedText(inputText, "DiskDriveHUDSmall", ScrW() - 10, ScrH() - 50, Color(255, 255, 255, 128), TEXT_ALIGN_RIGHT)
end

--菜B就要有菜B的觉悟
function DiskDriveHEX.DrawMenu(centerX, centerY, dt)
 local colorScheme = DiskDriveHEX.GetCurrentColorScheme()
 DiskDriveHEX.ColorTransition.transitionProgress = math.min(DiskDriveHEX.ColorTransition.transitionProgress + dt * DiskDriveHEX.ColorTransition.transitionSpeed * 5, 1)
 local currentBlend = DiskDriveHEX.ColorTransition.blendFactor
 DiskDriveHEX.ColorTransition.blendFactor = Lerp(DiskDriveHEX.SmoothStep(DiskDriveHEX.ColorTransition.transitionProgress), currentBlend, DiskDriveHEX.ColorTransition.targetBlend)


 -- 转
 DiskDriveHEX.Hexagon.rotation = (DiskDriveHEX.Hexagon.rotation + 60 * dt) % 360
 local menuRadius = DiskDriveHEX.UpdatePulse(dt)

 -- 背景无需矩阵变换，直接pass个nil上去
 local oldDrawBackground = DiskDriveHEX.DrawBackground
 DiskDriveHEX.DrawBackground = function(cx, cy, cs, transform)
     local sides = 6
     local baseRotation = (DiskDriveHEX.Hexagon.rotation or 0)
     if not cs or not cs.light or not cs.dark then cs = { light = Color(50,50,150), dark = Color(30,30,100) } end -- 兜个底

     for i = 0, sides - 1 do
         local startAngle = math.rad(baseRotation + (i * 360 / sides))
         local endAngle = math.rad(baseRotation + ((i + 1) * 360 / sides))

         local extendRadius = math.max(ScrW(), ScrH()) * 1.4
         local startX = cx + math.cos(startAngle) * extendRadius
         local startY = cy + math.sin(startAngle) * extendRadius
         local endX = cx + math.cos(endAngle) * extendRadius
         local endY = cy + math.sin(endAngle) * extendRadius

         local color = i % 2 == 0 and cs.light or cs.dark

         surface.SetDrawColor(color)
         draw.NoTexture()
         surface.DrawPoly({
             {x = cx, y = cy},
             {x = startX, y = startY},
             {x = endX, y = endY}
         })
     end
 end
 DiskDriveHEX.DrawBackground(centerX, ScrH()+500, colorScheme, nil) -- 爆
 DiskDriveHEX.DrawBackground = oldDrawBackground

 local oldDrawHexagon = DiskDriveHEX.DrawHexagon
 DiskDriveHEX.DrawHexagon = function(cx, cy, radius, rotation, cs, transform) -- 无变换
     local sides = 6
     local points = {}
     if not cs or not cs.light or not cs.object then cs = { light = Color(255,255,255), object = Color(200,200,200) } end -- Fallback

     for i = 0, sides - 1 do
         local angle = math.rad(rotation + (i * 360 / sides))
         table.insert(points, {
             x = cx + math.cos(angle) * radius,
             y = cy + math.sin(angle) * radius
         })
     end

     surface.SetDrawColor(cs.light)
     draw.NoTexture()
     surface.DrawPoly(points)

     surface.SetDrawColor(cs.object)
     for thickness = 1, DiskDriveHEX.Hexagon.outlineThickness do
         local offset = thickness - DiskDriveHEX.Hexagon.outlineThickness / 2
         local offsetPoints = {}

         for i = 0, sides - 1 do
             local angle = math.rad(rotation + (i * 360 / sides))
             local offsetRadius = radius + offset
             table.insert(offsetPoints, {
                 x = cx + math.cos(angle) * offsetRadius,
                 y = cy + math.sin(angle) * offsetRadius
             })
         end

         for i = 1, #offsetPoints do
             local nextIndex = i % #offsetPoints + 1
             surface.DrawLine(offsetPoints[i].x, offsetPoints[i].y, offsetPoints[nextIndex].x, offsetPoints[nextIndex].y)
         end
     end
 end
 DiskDriveHEX.DrawHexagon(centerX, ScrH()+1145, menuRadius, DiskDriveHEX.Hexagon.rotation, colorScheme, nil) -- 诶，这样就不会应用3D变换了
 DiskDriveHEX.DrawHexagon = oldDrawHexagon -- 用未经处理的逻辑

 DiskDriveHEX.DrawOutlinedText("6/7 - SELECT LEVEL", "DiskDriveHUDSmall", centerX - 600, 20, Color(255, 215, 0), TEXT_ALIGN_LEFT)
 DiskDriveHEX.DrawOutlinedText("8 - EXIT GAME", "DiskDriveHUDSmall", centerX + 600, 20, Color(255, 215, 0), TEXT_ALIGN_RIGHT)

 local titleColor = colorScheme.dark or Color(0,0,0)
 local titleInvert = colorScheme.invert or Color(255,255,255)

 -- 绘制标题
 local titleYOffset1 = -260
 local titleYOffset2 = -154
 draw.SimpleText("DISKDRIVE", "DiskDriveMillenniumHuge", centerX - 14, centerY + titleYOffset1, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("HEXAGON", "DiskDriveMillenniumHuge", centerX + 134, centerY + titleYOffset2, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("DISKDRIVE", "DiskDriveMillenniumHuge", centerX - 6, centerY + titleYOffset1 + 9, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("HEXAGON", "DiskDriveMillenniumHuge", centerX + 126, centerY + titleYOffset2 + 8, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("DISKDRIVE", "DiskDriveMillenniumHuge", centerX - 14, centerY + titleYOffset1 + 9, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("HEXAGON", "DiskDriveMillenniumHuge", centerX + 134, centerY + titleYOffset2 + 8, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("DISKDRIVE", "DiskDriveMillenniumHuge", centerX - 6, centerY + titleYOffset1, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("HEXAGON", "DiskDriveMillenniumHuge", centerX + 126, centerY + titleYOffset2, titleColor, TEXT_ALIGN_CENTER)

 draw.SimpleText("DISKDRIVE", "DiskDriveMillenniumHuge", centerX - 10, centerY + titleYOffset1 + 4, titleInvert, TEXT_ALIGN_CENTER)
 draw.SimpleText("HEXAGON", "DiskDriveMillenniumHuge", centerX + 130, centerY + titleYOffset2 + 4, titleInvert, TEXT_ALIGN_CENTER)

 -- 菜B模式，启动！
 if DiskDriveHEX.Cai_B_Mode then
     local noobTextY = centerY + titleYOffset2 + 60 -- 调整Y轴
     DiskDriveHEX.DrawOutlinedText("菜B特供版", "DiskDriveMillenniumLarge", centerX+150, noobTextY, Color(255, 40, 40, 255), TEXT_ALIGN_CENTER, Color(255, 255, 0, 200))
 end

 draw.SimpleText("4", "DiskDriveHUDHuge", 260, centerY + 328, Color(128,128,128,192), TEXT_ALIGN_CENTER)
 draw.SimpleText("0", "DiskDriveHUDHuge", 250, centerY + 316, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("1", "DiskDriveHUDHuge", 250, centerY + 320, titleInvert, TEXT_ALIGN_CENTER)

 draw.SimpleText("5", "DiskDriveHUDHuge", ScrW() - 260, centerY + 328, Color(128,128,128,192), TEXT_ALIGN_CENTER)
 draw.SimpleText("2", "DiskDriveHUDHuge", ScrW() - 250, centerY + 316, titleColor, TEXT_ALIGN_CENTER)
 draw.SimpleText("3", "DiskDriveHUDHuge", ScrW() - 250, centerY + 320, titleInvert, TEXT_ALIGN_CENTER)

 local numLight = colorScheme.light or Color(255,255,255)
 local numInvert = colorScheme.invert or Color(255,255,255)

 local level = DiskDriveHEX.Levels[DiskDriveHEX.SelectedLevel]
 if not level then return end -- 安全退出机制，哥别再爆lua error了

 local levelName = (level.name or "???"):upper()
 draw.SimpleText(levelName, "DiskDriveMillenniumLarge", centerX - 3, centerY + 33, numLight, TEXT_ALIGN_CENTER)
 draw.SimpleText(levelName, "DiskDriveMillenniumLarge", centerX + 3, centerY + 27, numLight, TEXT_ALIGN_CENTER)
 draw.SimpleText(levelName, "DiskDriveMillenniumLarge", centerX + 3, centerY + 33, numLight, TEXT_ALIGN_CENTER)
 draw.SimpleText(levelName, "DiskDriveMillenniumLarge", centerX - 3, centerY + 27, numLight, TEXT_ALIGN_CENTER)

 draw.SimpleText(levelName, "DiskDriveMillenniumLarge", centerX, centerY + 30, numInvert, TEXT_ALIGN_CENTER)

 DiskDriveHEX.DrawOutlinedText("DIFFICULTY: " .. (level.difficulty or "???"):upper(), "DiskDriveMillennium", centerX, centerY + 120, Color(255, 255, 255), TEXT_ALIGN_CENTER)
 local bestTimeText = (level.bestTime or 0) > 0 and string.format("%.2f", level.bestTime) or "00.00"
 DiskDriveHEX.DrawOutlinedText("BEST TIME: " .. bestTimeText, "DiskDriveMillennium", centerX, centerY + 180, Color(255, 255, 255), TEXT_ALIGN_CENTER)

 DiskDriveHEX.DrawOutlinedText("PRESS SPACE TO START", "DiskDriveMillennium", centerX, ScrH() - 70, Color(255, 215, 0), TEXT_ALIGN_CENTER)
end

function DiskDriveHEX.DrawGameOver(centerX, centerY, dt)
 local colorScheme = DiskDriveHEX.GetCurrentColorScheme()

 local transform = DiskDriveHEX.GetTransformMatrix(CurTime()) -- 保持3D矩阵变换

 DiskDriveHEX.DrawBackground(centerX, centerY, colorScheme, transform)
 DiskDriveHEX.DrawHexagon(centerX, centerY, DiskDriveHEX.EndAnimation.currentRadius, DiskDriveHEX.Hexagon.rotation, colorScheme, transform)
 DiskDriveHEX.DrawObstacles(centerX, centerY, colorScheme, transform)

 -- 根据时间输出(嘲讽)文本
 local gameOverText = " "
 local textColor = Color(255, 100, 100) -- 这是默认色
 local score = DiskDriveHEX.Score or 0
 if score < 10 then
     gameOverText = "菜就多练"
     textColor = Color(255, 255, 100) -- 菜，就多练
 elseif score >= 20 and score < 60 then
     gameOverText = " "
     textColor = Color(255, 100, 100) -- 似了
 elseif score >= 60 then
     gameOverText = "STAGE COMPLETE!"
     textColor = Color(100, 255, 100) -- 漫长的60秒
 end

 -- 文字缓动划入效果
 if DiskDriveHEX.GameOverState == "animating" or DiskDriveHEX.GameOverState == "finished" then
     DiskDriveHEX.DrawOutlinedText(gameOverText, "DiskDriveMillenniumLarge", DiskDriveHEX.GameOverTextPosX, centerY - 150, textColor, TEXT_ALIGN_CENTER)
     DiskDriveHEX.DrawOutlinedText("GAME OVER!", "DiskDriveMillenniumHuge", DiskDriveHEX.GameOverTextPosX, centerY - 90, textColor, TEXT_ALIGN_CENTER)
     local scoreTextAlpha = 0
     if DiskDriveHEX.GameOverState == "finished" then
         scoreTextAlpha = 255
     elseif DiskDriveHEX.GameOverState == "animating" then
          local textDist = math.abs(DiskDriveHEX.GameOverTextPosX - centerX)
          local maxDist = ScrW() / 2 + 400
          scoreTextAlpha = math.max(0, 255 * (1 - math.Clamp(textDist / (maxDist * 0.5), 0, 1))) -- Fade in faster
     end

     if scoreTextAlpha > 10 then
        DiskDriveHEX.DrawOutlinedText("SCORE: " .. string.format("%.2f", score), "DiskDriveMillennium", centerX, centerY + 50, Color(255, 255, 255, scoreTextAlpha), TEXT_ALIGN_CENTER)
    end
 end

 -- 动画完全播放完以后显示操作UI
 if DiskDriveHEX.GameOverState == "finished" then
     DiskDriveHEX.DrawOutlinedText("SPACE - RESTART", "DiskDriveMillenniumSmall", centerX, centerY + 400, Color(200, 200, 200), TEXT_ALIGN_CENTER)
     DiskDriveHEX.DrawOutlinedText("9 - MENU", "DiskDriveHUDSmall", centerX, centerY + 450, Color(200, 200, 200), TEXT_ALIGN_CENTER)
 end
end

function DiskDriveHEX.TriggerVoice(time)
 local voiceFiles = {
     [12] = "DiskDriveCHM/TrackGroup/Lvls_line.wav",
     [24] = "DiskDriveCHM/TrackGroup/Lvls_Triangle.wav",
     [36] = "DiskDriveCHM/TrackGroup/Lvls_Square.wav",
     [48] = "DiskDriveCHM/TrackGroup/Lvls_Pentagon.wav",
     [60] = "DiskDriveCHM/TrackGroup/Lvls_Hexagon.wav"
 }

 if voiceFiles[time] then
     surface.PlaySound(voiceFiles[time])
 end
end

function DiskDriveHEX.UpdateColorTransition(dt)
 local currentTime = CurTime()

 -- 爆
 if DiskDriveHEX.ColorPad.active then
     DiskDriveHEX.ColorPad.currentTransitionTime = DiskDriveHEX.ColorPad.currentTransitionTime + dt

     -- 失去色彩.png
     if DiskDriveHEX.Score >= 60 and not DiskDriveHEX.ColorPad.isGrayscale and not DiskDriveHEX.ColorPad.isFadingToGrayscale then
         DiskDriveHEX.ColorPad.isFadingToGrayscale = true
         DiskDriveHEX.ColorPad.currentColor = DiskDriveHEX.GetRainbowInterpolatedColor() or DiskDriveHEX.RainbowPalette[1] -- 开始平滑过渡
         DiskDriveHEX.ColorPad.targetColor = DiskDriveHEX.GrayscaleColor -- 锁定灰度色板
         DiskDriveHEX.ColorPad.currentTransitionTime = 0 -- 计时器重置
     end

     -- 灰度系统检查
     if DiskDriveHEX.ColorPad.isFadingToGrayscale and DiskDriveHEX.ColorPad.currentTransitionTime >= DiskDriveHEX.ColorPad.grayscaleFadeDuration then
         DiskDriveHEX.ColorPad.isGrayscale = true
         DiskDriveHEX.ColorPad.isFadingToGrayscale = false
         DiskDriveHEX.ColorPad.currentColor = DiskDriveHEX.ColorPad.targetColor -- 卡在这里了
         DiskDriveHEX.ColorPad.targetColor = DiskDriveHEX.ColorPad.currentColor -- 哇袄
     end

     -- R!G!B!
     if not DiskDriveHEX.ColorPad.isGrayscale and not DiskDriveHEX.ColorPad.isFadingToGrayscale then
          -- 色板变换完成了吗？
         if DiskDriveHEX.ColorPad.currentTransitionTime >= DiskDriveHEX.ColorPad.transitionDuration then
             if currentTime - DiskDriveHEX.ColorPad.lastSwitchTime >= DiskDriveHEX.ColorPad.switchInterval then
                 DiskDriveHEX.ColorPad.currentColor = DiskDriveHEX.ColorPad.targetColor -- 翻转色板目标
                 local newTargetIndex
                 local currentTargetIndex = table.KeyFromValue(DiskDriveHEX.RainbowPalette, DiskDriveHEX.ColorPad.targetColor) or 1
                 repeat
                     newTargetIndex = math.random(1, #DiskDriveHEX.RainbowPalette)
                 until newTargetIndex ~= currentTargetIndex -- 确保是新颜色
                 DiskDriveHEX.ColorPad.targetColor = DiskDriveHEX.RainbowPalette[newTargetIndex]
                 DiskDriveHEX.ColorPad.currentTransitionTime = 0 -- 启动
                 DiskDriveHEX.ColorPad.lastSwitchTime = currentTime
             end
         end
     end

 -- 色板转换系统
 elseif not DiskDriveHEX.InMenu and DiskDriveHEX.GameOverState == "none" then -- 只在游戏时启用
        if currentTime - DiskDriveHEX.ColorTransition.lastSwitchTime >= DiskDriveHEX.ColorTransition.switchInterval then
            DiskDriveHEX.ColorTransition.targetBlend = 1 - DiskDriveHEX.ColorTransition.targetBlend -- 翻转色板目标
            DiskDriveHEX.ColorTransition.transitionProgress = 0 -- 重置渐变进度
            DiskDriveHEX.ColorTransition.lastSwitchTime = currentTime
        end
        DiskDriveHEX.ColorTransition.transitionProgress = math.min(DiskDriveHEX.ColorTransition.transitionProgress + dt * DiskDriveHEX.ColorTransition.transitionSpeed, 1)

        local currentBlend = DiskDriveHEX.ColorTransition.blendFactor
        DiskDriveHEX.ColorTransition.blendFactor = Lerp(DiskDriveHEX.SmoothStep(DiskDriveHEX.ColorTransition.transitionProgress), currentBlend, DiskDriveHEX.ColorTransition.targetBlend)
    end
end


function DiskDriveHEX.UpdateLevelUpAnimation(dt)
    if not DiskDriveHEX.LevelUpAnimation.active then return end

    local elapsed = CurTime() - DiskDriveHEX.LevelUpAnimation.startTime
    local blinkTime = DiskDriveHEX.LevelUpAnimation.blinkInterval * (DiskDriveHEX.LevelUpAnimation.maxBlinks * 2)

    if elapsed < blinkTime then
        DiskDriveHEX.LevelUpAnimation.blinkCount = math.floor(elapsed / math.max(0.01, DiskDriveHEX.LevelUpAnimation.blinkInterval)) -- 想挨肘？
    elseif elapsed >= blinkTime + DiskDriveHEX.LevelUpAnimation.fadeDuration then
        DiskDriveHEX.LevelUpAnimation.active = false
    end
end

-- 给Garry爆了（恼），这个Lua真的难用啊
function DiskDriveHEX.Update(dt)
 if dt <= 0 then return end

 local currentTime = CurTime()
 local screenW = ScrW()
 local centerX = screenW / 2

 -- 似了，启动状态机
 if DiskDriveHEX.GameOverState == "flashing" then
     if currentTime - DiskDriveHEX.GameOverStateTimer > 0.03 then
         DiskDriveHEX.GameOverState = "paused"
         DiskDriveHEX.GameOverStateTimer = currentTime
     end

 elseif DiskDriveHEX.GameOverState == "paused" then
     if currentTime - DiskDriveHEX.GameOverStateTimer > 0.2 then
         DiskDriveHEX.GameOverState = "animating"
         DiskDriveHEX.GameOverFreeze = false
         DiskDriveHEX.GameOverTextPosX = screenW + 400 
         DiskDriveHEX.StartEndAnimation() 
     end

 elseif DiskDriveHEX.GameOverState == "animating" then
     -- 检查动画状态机
     if math.abs(DiskDriveHEX.GameOverTextPosX - centerX) < 1 then
          DiskDriveHEX.GameOverState = "finished"
          DiskDriveHEX.GameOverTextPosX = centerX -- 中心对齐...
     end
 end

 local level = DiskDriveHEX.Levels[DiskDriveHEX.SelectedLevel]
 if not level then return end

 if currentTime >= DiskDriveHEX.NextBackgroundRotateTime then
     DiskDriveHEX.BackgroundRotation = (DiskDriveHEX.BackgroundRotation + 60) % 360
     DiskDriveHEX.LastBackgroundRotate = currentTime
     DiskDriveHEX.NextBackgroundRotateInterval = math.Rand(1, 4) -- Get new random interval
     DiskDriveHEX.NextBackgroundRotateTime = currentTime + DiskDriveHEX.NextBackgroundRotateInterval
 end

 local currentRotation = DiskDriveHEX.Hexagon.rotation
 if DiskDriveHEX.RandomRotation.active and DiskDriveHEX.RandomRotation.isRotating then
      local elapsed = currentTime - DiskDriveHEX.RandomRotation.startTime
      local t = math.min(elapsed / math.max(0.01, DiskDriveHEX.RandomRotation.duration), 1)
      local easedT = DiskDriveHEX.SmoothStep(t)
      currentRotation = Lerp(easedT, DiskDriveHEX.RandomRotation.startRotation, DiskDriveHEX.RandomRotation.targetRotation)
      if t >= 1 then
          DiskDriveHEX.RandomRotation.isRotating = false
          DiskDriveHEX.RandomRotation.nextEventTime = currentTime + math.Rand(10, 16)
          currentRotation = DiskDriveHEX.RandomRotation.targetRotation % 360
      end
 else
      -- 转也
      local difficultyRotationSpeed = DiskDriveHEX.Difficulty.rotationSpeed
      if not DiskDriveHEX.GameOverFreeze then -- 转速递增
         if currentTime - DiskDriveHEX.LastRotationChange > math.random(5, 10) then
             DiskDriveHEX.RotationDirection = math.random(0, 1) == 0 and 1 or -1
             DiskDriveHEX.RotationSpeedMultiplier = math.random(10, 20) / 10
             DiskDriveHEX.LastRotationChange = currentTime
         end
         -- 难度递增
         if currentTime - DiskDriveHEX.Difficulty.lastRotationIncrease > DiskDriveHEX.Difficulty.rotationIncreaseInterval then
             DiskDriveHEX.Difficulty.rotationSpeed = DiskDriveHEX.Difficulty.rotationSpeed + DiskDriveHEX.Difficulty.rotationIncreaseAmount
             DiskDriveHEX.Difficulty.lastRotationIncrease = currentTime
             difficultyRotationSpeed = DiskDriveHEX.Difficulty.rotationSpeed -- 速度递增
         end
      end
      local normalDelta = DiskDriveHEX.RotationDirection *
                          DiskDriveHEX.Hexagon.rotationSpeed *
                          (level.speed or 1) *
                          360 * dt *
                          DiskDriveHEX.RotationSpeedMultiplier *
                          difficultyRotationSpeed
      currentRotation = currentRotation + normalDelta

      -- 转
       if not DiskDriveHEX.GameOverFreeze and DiskDriveHEX.RandomRotation.active and currentTime >= DiskDriveHEX.RandomRotation.nextEventTime then
           DiskDriveHEX.RandomRotation.isRotating = true
           DiskDriveHEX.RandomRotation.startTime = currentTime
           DiskDriveHEX.RandomRotation.startRotation = currentRotation % 360
           DiskDriveHEX.RandomRotation.direction = math.random(0, 1) == 0 and 1 or -1
           DiskDriveHEX.RandomRotation.targetRotation = DiskDriveHEX.RandomRotation.startRotation + 360 * DiskDriveHEX.RandomRotation.direction
           local easedT = DiskDriveHEX.SmoothStep(0)
           currentRotation = Lerp(easedT, DiskDriveHEX.RandomRotation.startRotation, DiskDriveHEX.RandomRotation.targetRotation)
       end
 end
 DiskDriveHEX.Hexagon.rotation = currentRotation % 360

 -- 科比牢大直升机
 DiskDriveHEX.UpdatePulse(dt)
 DiskDriveHEX.UpdateStartAnimation(dt)
 DiskDriveHEX.UpdateEndAnimation(dt)


 if DiskDriveHEX.GameOverFreeze then
     return
 end

 -- 似了
 if DiskDriveHEX.GameOverState == "animating" then
      -- 再装B让你飞起来！
      for i = #DiskDriveHEX.Obstacles, 1, -1 do
          local wall = DiskDriveHEX.Obstacles[i]
          wall.distance = wall.distance + DiskDriveHEX.GameOverOutwardSpeed * dt
          if wall.distance > DiskDriveHEX.ObstacleSettings.spawnDistance + 1000 then -- Remove if very far out
              table.remove(DiskDriveHEX.Obstacles, i)
          end
      end
      -- 文字动画
      DiskDriveHEX.GameOverTextPosX = Lerp(dt * DiskDriveHEX.GameOverTextSlideSpeed, DiskDriveHEX.GameOverTextPosX, centerX)
      return
 end


 if DiskDriveHEX.GameOverState == "finished" then
     return
 end


 if DiskDriveHEX.GameOverState ~= "none" then return end

 DiskDriveHEX.Score = currentTime - DiskDriveHEX.StartTime

 DiskDriveHEX.UpdateColorTransition(dt)
 DiskDriveHEX.UpdateNewBestAnimation(dt)
 DiskDriveHEX.HyperModeTransition.targetAlpha = DiskDriveHEX.Score > 60 and 255 or 0
 DiskDriveHEX.HyperModeTransition.alpha = Lerp(dt * DiskDriveHEX.HyperModeTransition.transitionSpeed, DiskDriveHEX.HyperModeTransition.alpha, DiskDriveHEX.HyperModeTransition.targetAlpha)

 -- 玩家移动
 local speedModifier = input.IsKeyDown(KEY_LSHIFT) and 0.6 or 1
 local moveSpeed = (level.speed or 1) * 300 * dt * speedModifier
 if input.IsKeyDown(KEY_LEFT) or input.IsKeyDown(KEY_A) then
     DiskDriveHEX.Player.angle = DiskDriveHEX.Player.angle - moveSpeed
 end
 if input.IsKeyDown(KEY_RIGHT) or input.IsKeyDown(KEY_D) then
     DiskDriveHEX.Player.angle = DiskDriveHEX.Player.angle + moveSpeed
 end
 DiskDriveHEX.Player.angle = DiskDriveHEX.Player.angle % 360

 -- 难度递增（邪恶）
 if currentTime - DiskDriveHEX.Difficulty.lastObstacleIncrease > DiskDriveHEX.Difficulty.obstacleIncreaseInterval then
     DiskDriveHEX.Difficulty.obstacleSpeed = DiskDriveHEX.Difficulty.obstacleSpeed + DiskDriveHEX.Difficulty.obstacleIncreaseAmount
     DiskDriveHEX.Difficulty.lastObstacleIncrease = currentTime
 end

 DiskDriveHEX.UpdateLevelUpAnimation(dt)
 DiskDriveHEX.UpdateTutorialAnimation(dt)

 -- 生成障碍
 if currentTime - DiskDriveHEX.ObstacleSettings.lastSpawn > DiskDriveHEX.ObstacleSettings.spawnRate then
     DiskDriveHEX.SpawnObstacle()
     DiskDriveHEX.ObstacleSettings.lastSpawn = currentTime
 end

 -- 障碍的移动
 local obstacleMoveDist = (DiskDriveHEX.ObstacleSettings.baseSpeed * (level.speed or 1) * dt * DiskDriveHEX.Difficulty.obstacleSpeed)
 for i = #DiskDriveHEX.Obstacles, 1, -1 do
     local wall = DiskDriveHEX.Obstacles[i]
     wall.distance = wall.distance - obstacleMoveDist
     if wall.distance < -wall.thickness - 100 then -- 过原点后立即移除
          table.remove(DiskDriveHEX.Obstacles, i)
     end
 end

 -- 升级语音
 local currentScoreFloor = math.floor(DiskDriveHEX.Score)
 for triggerTime in pairs(DiskDriveHEX.VoiceTriggers) do
     if currentScoreFloor >= triggerTime and not DiskDriveHEX.VoiceTriggers[triggerTime] then
         DiskDriveHEX.TriggerVoice(triggerTime)
         DiskDriveHEX.VoiceTriggers[triggerTime] = true
         DiskDriveHEX.LevelUpAnimation.active = true
         DiskDriveHEX.LevelUpAnimation.startTime = currentTime
         DiskDriveHEX.LevelUpAnimation.blinkCount = 0
     end
 end

 -- 诶你怎么死了
 if DiskDriveHEX.CheckCollision() then
     DiskDriveHEX.GameOver = true
     DiskDriveHEX.GameOverFreeze = true -- 菜
     DiskDriveHEX.GameOverState = "flashing" -- 就
     DiskDriveHEX.GameOverStateTimer = currentTime -- 多
     surface.PlaySound("DiskDriveCHM/TrackGroup/Lvls_GameOver.wav") -- 练
     DiskDriveHEX.StopMusic()
     local currentLevel = DiskDriveHEX.Levels[DiskDriveHEX.SelectedLevel]
     if currentLevel then
         -- 保存最高分
         if (DiskDriveHEX.Score or 0) > (currentLevel.bestTime or 0) then
              currentLevel.bestTime = DiskDriveHEX.Score
              DiskDriveHEX.SaveHighScores()
         end
     end
 end
end

hook.Add("PostDrawHUD", "DiskDriveHexagonDraw", function()
 if not DiskDriveHEX.Active then return end

 local screenW, screenH = ScrW(), ScrH()
 local centerX, centerY = screenW / 2, screenH / 2
 local currentTime = CurTime()
 local dt = currentTime - (DiskDriveHEX.LastTime or currentTime)
 DiskDriveHEX.LastTime = currentTime
 dt = math.Clamp(dt, 0, 0.1) -- 帧间隔计算

 -- 描边呼吸灯效果
 if dt > 0 then
     DiskDriveHEX.OutlineAlphaMultiplier = DiskDriveHEX.OutlineAlphaMultiplier + DiskDriveHEX.OutlineAlphaDirection * DiskDriveHEX.OutlineAlphaSpeed * dt
     if DiskDriveHEX.OutlineAlphaMultiplier >= 0.4 then
         DiskDriveHEX.OutlineAlphaMultiplier = 0.4
         DiskDriveHEX.OutlineAlphaDirection = -1
     elseif DiskDriveHEX.OutlineAlphaMultiplier <= 0.2 then
         DiskDriveHEX.OutlineAlphaMultiplier = 0.2
         DiskDriveHEX.OutlineAlphaDirection = 1
     end
 end


 if DiskDriveHEX.GameOverState == "flashing" then
     surface.SetDrawColor(255, 255, 255, 255)
     surface.DrawRect(0, 0, screenW, screenH)
     if not DiskDriveHEX.InMenu then
          DiskDriveHEX.Update(dt)
     end
     return
 end

 local colorScheme = DiskDriveHEX.GetCurrentColorScheme()

 -- 更新状态机，按帧间隔
 if not DiskDriveHEX.InMenu then
     DiskDriveHEX.Update(dt)
 end

 -- 绘制游戏画面
 if DiskDriveHEX.InMenu then
     DiskDriveHEX.DrawMenu(centerX, centerY, dt)
 elseif DiskDriveHEX.GameOver then
     DiskDriveHEX.DrawGameOver(centerX, centerY, dt)
     DiskDriveHEX.PlayerAvatar:SetVisible(false)
 else

     local transform = DiskDriveHEX.GetTransformMatrix(currentTime)
     DiskDriveHEX.DrawBackground(centerX, centerY, colorScheme, transform)
     DiskDriveHEX.DrawObstacles(centerX, centerY, colorScheme, transform)
     local currentHexRadius = DiskDriveHEX.UpdatePulse(0)
     DiskDriveHEX.DrawHexagon(centerX, centerY, currentHexRadius, DiskDriveHEX.Hexagon.rotation, colorScheme, transform)
     DiskDriveHEX.DrawPlayer(centerX, centerY, DiskDriveHEX.Player.angle, currentHexRadius, colorScheme, transform)


     local level = DiskDriveHEX.Levels[DiskDriveHEX.SelectedLevel] or {}
     local levelName = level.name or "???"
     local scoreDisplay = string.format("%.2f", DiskDriveHEX.Score or 0)
     local objColor = colorScheme.object or Color(200,200,200,128)
     local textColor = Color(255, 255, 255)
     local textSubColor = Color(200, 200, 200)

     DiskDriveHEX.DrawOutlinedText("TIME" .. "  " .. scoreDisplay, "DiskDriveMillennium", screenW - 5, 25, objColor, TEXT_ALIGN_RIGHT)
     DiskDriveHEX.DrawOutlinedText(levelName, "DiskDriveMillenniumSmall", screenW - 15, 75, objColor, TEXT_ALIGN_RIGHT)

     DiskDriveHEX.DrawOutlinedText("TIME" .. "  " .. scoreDisplay, "DiskDriveMillennium", screenW - 10, 20, textColor, TEXT_ALIGN_RIGHT)
     DiskDriveHEX.DrawOutlinedText(levelName, "DiskDriveMillenniumSmall", screenW - 20, 70, textSubColor, TEXT_ALIGN_RIGHT)

     if DiskDriveHEX.HyperModeTransition.alpha > 0 then
         DiskDriveHEX.DrawOutlinedText("HYPER MODE", "DiskDriveMillenniumSmall", 20, 20, Color(255, 0, 0, DiskDriveHEX.HyperModeTransition.alpha), TEXT_ALIGN_LEFT)
     end

     if DiskDriveHEX.LevelUpAnimation.active then
         local elapsed = CurTime() - DiskDriveHEX.LevelUpAnimation.startTime
         local blinkTime = DiskDriveHEX.LevelUpAnimation.blinkInterval * (DiskDriveHEX.LevelUpAnimation.maxBlinks * 2)
         local alpha = 255
         local levelUpText = ""
         local levelUpTexts = {"LINE", "TRIANGLE", "SQUARE", "PENTAGON", "HEXAGON"}
         local triggeredLevel = 0
         for triggerTime, triggered in pairs(DiskDriveHEX.VoiceTriggers) do
              if triggered and triggerTime > triggeredLevel then
                  triggeredLevel = triggerTime
              end
         end
         if triggeredLevel > 0 then
              levelUpText = levelUpTexts[math.floor(triggeredLevel / 12)] or ""
         end

         if elapsed < blinkTime then
             alpha = (DiskDriveHEX.LevelUpAnimation.blinkCount % 2 == 0) and 255 or 128
         else
             alpha = math.max(0, 255 * (1 - (elapsed - blinkTime) / math.max(0.01, DiskDriveHEX.LevelUpAnimation.fadeDuration)))
         end

         -- 妈的给状态机爆了（恼）
         if DiskDriveHEX.HyperModeTransition.alpha < 255 then
             DiskDriveHEX.DrawOutlinedText("LEVEL UP!", "DiskDriveMillennium", 20, 20, Color(255, 255, 0, alpha), TEXT_ALIGN_LEFT)
             DiskDriveHEX.DrawOutlinedText(levelUpText, "DiskDriveMillennium", 20, 80, Color(255, 255, 0, alpha), TEXT_ALIGN_LEFT)
         end
     end

     if DiskDriveHEX.Tutorial.active then
         DiskDriveHEX.DrawOutlinedText("6/7 - MOVE", "DiskDriveHUDSmall", centerX, screenH - 130, Color(255, 255, 255, DiskDriveHEX.Tutorial.alpha), TEXT_ALIGN_CENTER)
         DiskDriveHEX.DrawOutlinedText("= - SLOW DOWN", "DiskDriveHUDSmall", centerX, screenH - 90, Color(255, 255, 255, DiskDriveHEX.Tutorial.alpha), TEXT_ALIGN_CENTER)
         DiskDriveHEX.DrawOutlinedText("9 - RETURN TO MENU", "DiskDriveHUDSmall", centerX, screenH - 50, Color(255, 255, 255, DiskDriveHEX.Tutorial.alpha), TEXT_ALIGN_CENTER)
     end

     DiskDriveHEX.DrawPlayerInfo() -- 绘制玩家UI
     DiskDriveHEX.DrawInputDisplay()
 end
end)

local lastLeftPress = 0
local lastRightPress = 0
local lastSpacePress = 0
local lastEPress = 0
local lastAPress = 0
local lastDPress = 0
local lastRPress = 0
local lastKey8Press = 0
local debounceTime = 0.2
local lastKeyR = false
local lastKey8 = false
local lastKey9 = false

hook.Add("Think", "DiskDriveHexagonInput", function()
 if not DiskDriveHEX.Active then return end

 local currentTime = CurTime()

 -- 关卡选择器
 if DiskDriveHEX.InMenu then
     -- 关卡选择（左键检查）
     if (input.IsKeyDown(KEY_LEFT) or input.IsKeyDown(KEY_A)) and currentTime - lastLeftPress > debounceTime and currentTime - lastAPress > debounceTime and DiskDriveHEX.SelectedLevel > 1 then
         local previousLevel = DiskDriveHEX.SelectedLevel
         DiskDriveHEX.SelectedLevel = DiskDriveHEX.SelectedLevel - 1
         DiskDriveHEX.ColorTransition.lastLevel = previousLevel
         DiskDriveHEX.ColorTransition.transitionProgress = 0 -- 重置色板进度
         DiskDriveHEX.ColorTransition.targetBlend = math.random(0, 1) -- 随机选择一个色板
         local currentBlend = DiskDriveHEX.ColorTransition.blendFactor -- 保存变换系数以便继续颜色切换
         DiskDriveHEX.ColorTransition.blendFactor = Lerp(0, currentBlend, DiskDriveHEX.ColorTransition.targetBlend) -- 这个启动颜色变换
         surface.PlaySound("DiskDriveCHM/TrackGroup/Lvls_MenuChoose.wav")
         lastLeftPress = currentTime
         lastAPress = currentTime
     end

     -- 关卡选择(右键检查)
     if (input.IsKeyDown(KEY_RIGHT) or input.IsKeyDown(KEY_D)) and currentTime - lastRightPress > debounceTime and currentTime - lastDPress > debounceTime and DiskDriveHEX.SelectedLevel < #DiskDriveHEX.Levels then
         local previousLevel = DiskDriveHEX.SelectedLevel
         DiskDriveHEX.SelectedLevel = DiskDriveHEX.SelectedLevel + 1
         DiskDriveHEX.ColorTransition.lastLevel = previousLevel
         DiskDriveHEX.ColorTransition.transitionProgress = 0 -- 还是重置色板进度
         DiskDriveHEX.ColorTransition.targetBlend = math.random(0, 1) -- 还是随机选择一个色板
         local currentBlend = DiskDriveHEX.ColorTransition.blendFactor -- 还是保存变换系数以便继续颜色切换
         DiskDriveHEX.ColorTransition.blendFactor = Lerp(0, currentBlend, DiskDriveHEX.ColorTransition.targetBlend) -- 我懒得写注释了
         surface.PlaySound("DiskDriveCHM/TrackGroup/Lvls_MenuChoose.wav")
         lastRightPress = currentTime
         lastDPress = currentTime
     end

     -- 启动！
     if input.IsKeyDown(KEY_SPACE) and currentTime - lastSpacePress > debounceTime then
         DiskDriveHEX.Initialize()
         surface.PlaySound("DiskDriveCHM/TrackGroup/Lvls_LevelStart.wav")
         lastSpacePress = currentTime
     end

     -- 额，我还是把这段删掉比较好呢...
--     if input.IsKeyDown(KEY_R) and not lastKeyR and currentTime - lastRPress > debounceTime then
--          DiskDriveHEX.Active = false
--          LocalPlayer():ConCommand("-speed")
--          DiskDriveHEX.StopMusic()
--          DiskDriveHEX.ReturnToMenu() -- Ensure clean state reset
--          lastKeyR = true
--          lastRPress = currentTime
--     end
 end

 -- 死了以后只在动画状态机完毕后才会进行检测
 if DiskDriveHEX.GameOver and DiskDriveHEX.GameOverState == "finished" then
     -- 重开
     if input.IsKeyDown(KEY_SPACE) and currentTime - lastSpacePress > debounceTime then
         DiskDriveHEX.Initialize() -- 重开游戏
         surface.PlaySound("DiskDriveCHM/TrackGroup/Lvls_LevelStart.wav")
         lastSpacePress = currentTime
     end
     -- 菜单
     if (input.IsKeyDown(KEY_E) or input.IsKeyDown(KEY_9)) and currentTime - lastEPress > debounceTime then
         DiskDriveHEX.ReturnToMenu()
         lastEPress = currentTime
     end
 end

 -- 按E回菜单
 if not DiskDriveHEX.InMenu and not DiskDriveHEX.GameOver then
     if (input.IsKeyDown(KEY_E) or input.IsKeyDown(KEY_9)) and currentTime - lastEPress > debounceTime then
         DiskDriveHEX.ReturnToMenu()
         lastEPress = currentTime
     end
 end

    -- 退出键
    if input.IsKeyDown(KEY_R) and not lastKeyR and currentTime - lastRPress > debounceTime then
        -- 获取当前游戏模式的文件夹名称
        local currentGamemodeFolder = engine.ActiveGamemode()

        if currentGamemodeFolder ~= "diskdrive_hexagon" then
            DiskDriveHEX.Active = false
            if LocalPlayer and IsValid(LocalPlayer()) then LocalPlayer():ConCommand("-speed") end
            DiskDriveHEX.StopMusic()
            DiskDriveHEX.ReturnToMenu()
            print("[DiskDrive Hexagon]非锁定，允许退出" .. currentGamemodeFolder .. ")")
        else
        end

        lastKeyR = true
        lastRPress = currentTime

    elseif not input.IsKeyDown(KEY_R) then
        lastKeyR = false
        -- Think 钩子末尾的重置逻辑保持不变
    end

 -- 更新冷静时间
 if not (input.IsKeyDown(KEY_A) or input.IsKeyDown(KEY_LEFT)) then lastAPress = 0; lastLeftPress = 0 end
 if not (input.IsKeyDown(KEY_D) or input.IsKeyDown(KEY_RIGHT)) then lastDPress = 0; lastRightPress = 0 end
 if not input.IsKeyDown(KEY_SPACE) then lastSpacePress = 0 end
 if not (input.IsKeyDown(KEY_E) or input.IsKeyDown(KEY_9)) then lastEPress = 0 end
 if not input.IsKeyDown(KEY_R) then lastRPress = 0; lastKeyR = false end

end)


hook.Add("PlayerBindPress", "DiskDriveHexagonBlockMovement", function(ply, bind, pressed)
 if DiskDriveHEX.Active then
     -- 嗯..屏蔽玩家移动
     if DiskDriveHEX.InMenu or DiskDriveHEX.GameOver or (not DiskDriveHEX.InMenu and not DiskDriveHEX.GameOver) then
          -- 按SHIFT速度减半，这下更像东方了（雾）
          if bind == "+jump" or bind == "+forward" or bind == "+back" or bind == "+moveleft" or bind == "+moveright" or bind == "+duck" or bind == "+speed" then
              return true -- 爆
          end
     end
 end
end)


hook.Add("PlayerSwitchWeapon", "DiskDriveHexagonBlockWeapon", function(ply, oldWeapon, newWeapon)
 if DiskDriveHEX.Active then
     return true
 end
end)

hook.Add("Initialize", "DiskDriveHexagon_AutoStartOnGamemode", function()
    -- 获取当前游戏模式名称
    local currentGamemodeFolder = engine.ActiveGamemode()
--是吗？是的！
    if currentGamemodeFolder == "diskdrive_hexagon" then
        timer.Simple(0.5, function()
            if not DiskDriveHEX.Active then
                RunConsoleCommand("diskdrive_hexagon_start")
            end
        end)
    end
end)

hook.Add("PlayerButtonDown", "DiskDriveHexagonBlockAttack", function(ply, button)
 if DiskDriveHEX.Active then
     if button == MOUSE_LEFT or button == MOUSE_RIGHT then
         return true
     end
 end
end)

concommand.Add("diskdrive_hexagon_clear", function()
 DiskDriveHEX.ClearSaveData()
end)

concommand.Add("diskdrive_hexagon_paintplayer", function(ply, cmd, args)
 local enable = tonumber(args[1]) or 0
 DiskDriveHEX.ShowPlayerInfo = enable == 1
 DiskDriveHEX.CustomSettings.showPlayerInfo = DiskDriveHEX.ShowPlayerInfo
 DiskDriveHEX.SaveCustomSettings()
 print("DiskDrive Hexagon: Player info display " .. (DiskDriveHEX.ShowPlayerInfo and "enabled" or "disabled"))
end)

concommand.Add("diskdrive_hexagon_inputdisplay", function(ply, cmd, args)
 local enable = tonumber(args[1]) or 0
 DiskDriveHEX.ShowInputDisplay = enable == 1
 DiskDriveHEX.CustomSettings.showInputDisplay = DiskDriveHEX.ShowInputDisplay
 DiskDriveHEX.SaveCustomSettings()
 print("DiskDrive Hexagon: Input display " .. (DiskDriveHEX.ShowInputDisplay and "enabled" or "disabled"))
end)

concommand.Add("diskdrive_hexagon_start", function(ply, cmd, args)
    if DiskDriveHEX.Active and not DiskDriveHEX.InMenu then
        return
    end
    DiskDriveHEX.Active = true      -- 激活主渲染循环
end)

hook.Add("PopulateToolMenu", "DiskDriveHexagonMenu", function()
 spawnmenu.AddToolMenuOption("Utilities", "Disk-Drive的好玩东西", "DiskDrive Hexagon", "DiskDrive Hexagon", "", "", function(panel)
     panel:ClearControls()
     local button = panel:Button("PRESS HERE TO START")
     button.DoClick = function()
         DiskDriveHEX.Active = true
         DiskDriveHEX.InMenu = true
         DiskDriveHEX.GameOver = false
         DiskDriveHEX.LastTime = CurTime() -- 执行初始化
         DiskDriveHEX.ReturnToMenu() -- 清除状态位
     end

     panel:Help("自定义关卡设定 - Custom Level Settings")

     local nameEntry = panel:TextEntry("关卡名称 - Level Name")
     nameEntry:SetValue(DiskDriveHEX.CustomSettings.customName)
     nameEntry.OnEnter = function(self)
         DiskDriveHEX.CustomSettings.customName = self:GetValue()
         DiskDriveHEX.Levels[4].name = self:GetValue()
         DiskDriveHEX.SaveCustomSettings()
     end

     local speedSlider = panel:NumSlider("速度 - Speed", nil, 0.5, 5, 2)
     speedSlider:SetValue(DiskDriveHEX.CustomSettings.customSpeed)
     speedSlider.OnValueChanged = function(self, value)
         DiskDriveHEX.CustomSettings.customSpeed = value
         DiskDriveHEX.SaveCustomSettings()
     end

     panel:Help("自定义音乐 - Custom Music")
     local musicButton = panel:Button("SELECT MUSIC FILE")
     local musicLabel = panel:Help("Current: " .. (DiskDriveHEX.CustomSettings.customMusic or "None"))
     musicButton.DoClick = function()
         local frame = vgui.Create("DFrame")
         frame:SetSize(400, 300)
         frame:Center()
         frame:SetTitle("SELECT MUSIC FILE")
         frame:MakePopup()

         local fileList = vgui.Create("DListView", frame)
         fileList:Dock(FILL)
         fileList:AddColumn("File Name")

         local files = file.Find("sound/DiskDriveCHM/*", "GAME")
         table.sort(files) -- 额，记得把文件放进去啊
         for _, fName in pairs(files) do
             if string.match(fName, "%.wav$") or string.match(fName, "%.mp3$") then
                 fileList:AddLine(fName)
             end
         end

         fileList.OnRowSelected = function(self, lineID, line)
             local selectedFile = line:GetValue(1)
             DiskDriveHEX.CustomSettings.customMusic = "DiskDriveCHM/" .. selectedFile
             musicLabel:SetText("Current: DiskDriveCHM/" .. selectedFile)
             DiskDriveHEX.SaveCustomSettings()
             frame:Close()
         end
     end

     panel:Help("HUD设定 - HUD Options")
     local playerInfoCheck = panel:CheckBox("显示玩家信息 - Display Player Avatar")
     playerInfoCheck:SetValue(DiskDriveHEX.CustomSettings.showPlayerInfo)
     playerInfoCheck.OnChange = function(self, value)
         DiskDriveHEX.CustomSettings.showPlayerInfo = value
         DiskDriveHEX.ShowPlayerInfo = value -- 同步更新设定
         DiskDriveHEX.SaveCustomSettings()
     end

     local inputDisplayCheck = panel:CheckBox("显示键盘输入 - Display Keyboard Input")
     inputDisplayCheck:SetValue(DiskDriveHEX.CustomSettings.showInputDisplay)
     inputDisplayCheck.OnChange = function(self, value)
         DiskDriveHEX.CustomSettings.showInputDisplay = value
         DiskDriveHEX.ShowInputDisplay = value -- 也是同步更新设定
         DiskDriveHEX.SaveCustomSettings()
     end

     -- 自定义关卡的特殊值
     panel:Help("自定义关卡特殊参数 - Special Custom Flags")
     local rainbowCheck = panel:CheckBox("启用RGB特效 - Enable Rainbow Palette")
     rainbowCheck:SetValue(DiskDriveHEX.CustomSettings.enableColorPad)
     rainbowCheck.OnChange = function(self, value)
         DiskDriveHEX.CustomSettings.enableColorPad = value
         DiskDriveHEX.SaveCustomSettings()
     end

     local rotationCheck = panel:CheckBox("启用随机旋转 - Random Fast Rotation")
     rotationCheck:SetValue(DiskDriveHEX.CustomSettings.enableRandomRotation)
     rotationCheck.OnChange = function(self, value)
         DiskDriveHEX.CustomSettings.enableRandomRotation = value
         DiskDriveHEX.SaveCustomSettings()
     end

     -- 菜死你得了，干脆注释化了
     --panel:Help("emm...特殊设置(智将)")
     --local Cai_B_ModeCheck = panel:CheckBox("菜B模式 - NOOB MODE")
     --Cai_B_ModeCheck:SetValue(DiskDriveHEX.CustomSettings.Cai_B_Mode)
     --Cai_B_ModeCheck.OnChange = function(self, value)
         --DiskDriveHEX.CustomSettings.Cai_B_Mode = value
         --DiskDriveHEX.Cai_B_Mode = value -- Update live setting too
         --DiskDriveHEX.SaveCustomSettings()
     --end


     panel:Help("调色板1的颜色 - Palette 1 Color")
     panel:ControlHelp("亮色 - Light Color")
     local p1Light = vgui.Create("DColorMixer")
     p1Light:SetAlphaBar(true)
     p1Light:SetPalette(true)
     p1Light:SetColor(DiskDriveHEX.CustomSettings.palette1Light)
     p1Light:SetSize(200, 200)
     p1Light.ValueChanged = function(self, color)
         DiskDriveHEX.CustomSettings.palette1Light = color
         DiskDriveHEX.SaveCustomSettings()
     end
     panel:AddItem(p1Light)

     panel:ControlHelp("暗色 - Dark Color")
     local p1Dark = vgui.Create("DColorMixer")
     p1Dark:SetAlphaBar(true)
     p1Dark:SetPalette(true)
     p1Dark:SetColor(DiskDriveHEX.CustomSettings.palette1Dark)
     p1Dark:SetSize(200, 200)
     p1Dark.ValueChanged = function(self, color)
         DiskDriveHEX.CustomSettings.palette1Dark = color
         DiskDriveHEX.SaveCustomSettings()
     end
     panel:AddItem(p1Dark)

     panel:ControlHelp("障碍的颜色 - Obstacle Color")
     local p1Object = vgui.Create("DColorMixer")
     p1Object:SetAlphaBar(true)
     p1Object:SetPalette(true)
     p1Object:SetColor(DiskDriveHEX.CustomSettings.palette1Object)
     p1Object:SetSize(200, 200)
     p1Object.ValueChanged = function(self, color)
         DiskDriveHEX.CustomSettings.palette1Object = color
         DiskDriveHEX.SaveCustomSettings()
     end
     panel:AddItem(p1Object)

     panel:ControlHelp("反转颜色 - HYPER Color")
     local p1Invert = vgui.Create("DColorMixer")
     p1Invert:SetAlphaBar(true)
     p1Invert:SetPalette(true)
     p1Invert:SetColor(DiskDriveHEX.CustomSettings.palette1Invert)
     p1Invert:SetSize(200, 200)
     p1Invert.ValueChanged = function(self, color)
         DiskDriveHEX.CustomSettings.palette1Invert = color
         DiskDriveHEX.SaveCustomSettings()
     end
     panel:AddItem(p1Invert)


     panel:Help("调色板2的颜色 - Palette 2 Color")
     panel:ControlHelp("亮色 - Light Color")
     local p2Light = vgui.Create("DColorMixer")
     p2Light:SetAlphaBar(true)
     p2Light:SetPalette(true)
     p2Light:SetColor(DiskDriveHEX.CustomSettings.palette2Light)
     p2Light:SetSize(200, 200)
     p2Light.ValueChanged = function(self, color)
         DiskDriveHEX.CustomSettings.palette2Light = color
         DiskDriveHEX.SaveCustomSettings()
     end
     panel:AddItem(p2Light)

     panel:ControlHelp("暗色 - Dark Color")
     local p2Dark = vgui.Create("DColorMixer")
     p2Dark:SetAlphaBar(true)
     p2Dark:SetPalette(true)
     p2Dark:SetColor(DiskDriveHEX.CustomSettings.palette2Dark)
     p2Dark:SetSize(200, 200)
     p2Dark.ValueChanged = function(self, color)
         DiskDriveHEX.CustomSettings.palette2Dark = color
         DiskDriveHEX.SaveCustomSettings()
     end
     panel:AddItem(p2Dark)

     panel:ControlHelp("障碍的颜色 - Obstacle Color")
     local p2Object = vgui.Create("DColorMixer")
     p2Object:SetAlphaBar(true)
     p2Object:SetPalette(true)
     p2Object:SetColor(DiskDriveHEX.CustomSettings.palette2Object)
     p2Object:SetSize(200, 200)
     p2Object.ValueChanged = function(self, color)
         DiskDriveHEX.CustomSettings.palette2Object = color
         DiskDriveHEX.SaveCustomSettings()
     end
     panel:AddItem(p2Object)

     panel:ControlHelp("反转颜色 - HYPER Color")
        local p2Invert = vgui.Create("DColorMixer")
        p2Invert:SetAlphaBar(true)
        p2Invert:SetPalette(true)
        p2Invert:SetColor(DiskDriveHEX.CustomSettings.palette2Invert)
        p2Invert:SetSize(200, 200)
        p2Invert.ValueChanged = function(self, color)
            DiskDriveHEX.CustomSettings.palette2Invert = color
            DiskDriveHEX.SaveCustomSettings()
        end
        panel:AddItem(p2Invert)

        panel:Help("A/D或左右键移动，空格键确认，E键回到主菜单，按R退出")
        panel:Help("Created by Disk-Drive")
    end)
end)
--直接上去肘击它，它受不了的
print("PROJECT MILLENNIUM - DiskDrive Hexagon")
print("DiskDrive Hexagon - 成功加载!")

