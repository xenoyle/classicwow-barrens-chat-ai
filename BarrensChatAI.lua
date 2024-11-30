print("BarrensChatAI successfully loaded!")

if not BarrensChatAIDB then
    BarrensChatAIDB = {
        faction = nil, -- player's faction
        class = nil, -- player's class
        level = nil, -- player's current level
        zone = nil, -- player's current zone
        subZone = nil, -- player's current subzone
        health = nil, -- player's current health
        classResource = nil, -- player's current resource amount (mana, energy, rage, etc.)

        strength = nil, -- player's current strength stat
        agility = nil, -- player's current agility stat
        stamina = nil, -- player's current stamina stat
        intellect = nil, -- player's current intellect stat
        spirit = nil, -- player's current spirit stat
        armor = nil, -- player's current armor
        attackPower = nil, -- player's current attack power
        spellPower = nil, -- player's current spell power
        critChance = nil, -- player's current crit chance
        hitChance = nil, -- player's current hit chance
        movementSpeed = nil, -- player's current movement speed

        inCombat = nil, -- player's current combat status
        target = nil, -- player's current target
        targetLevel = nil, -- player's current target's level
        targetHealthPercent = nil -- player's current target's health percentage
        
    }
end

local mainFrame = CreateFrame("Frame", "BarrensChatAIMainFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(500, 350)
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
mainFrame.TitleBg:SetHeight(30)
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT", 5, -3)
mainFrame.title:SetText("Barrens Chat AI")
mainFrame:Hide()

mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
	self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
end)

mainFrame:SetScript("OnShow", function()
        PlaySound(808)
end)

mainFrame:SetScript("OnHide", function()
        PlaySound(808)
end)

SLASH_BARRENSCHATAI1 = "/barrenschatai"
SLASH_BARRENSCHATAI2 = "/bcai"
SlashCmdList["BARRENSCHATAI"] = function()
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        mainFrame:Show()
    end
end

table.insert(UISpecialFrames, "BarrensChatAIMainFrame")

mainFrame.playerName = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainFrame.playerName:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, -35)
mainFrame.playerName:SetText("Character: " .. UnitName("player") .. " (Level " .. UnitLevel("player") .. ")")