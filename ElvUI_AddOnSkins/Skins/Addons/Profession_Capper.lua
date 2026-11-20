local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local AS = E:GetModule("AddOnSkins")

if not AS:IsAddonLODorEnabled("Profession_Capper") then return end

local _G = _G

S:AddCallbackForAddon("Profession_Capper", "Profession_Capper", function()
    local frame = _G.MainFrameCore
    if not frame or frame.ProfessionCapperSkinned then return end

    -- Main window
    frame:StripTextures()
    frame:SetTemplate("Transparent")

    -- Remove the original Blizzard dialog header art.
    if _G.MainFrameCoreTitle then
        _G.MainFrameCoreTitle:Hide()
    end

    -- Buttons
    if _G.MainFrameCoreCraft then
        S:HandleButton(_G.MainFrameCoreCraft)
    end
    if _G.MainFrameCoreNextRecipe then
        S:HandleButton(_G.MainFrameCoreNextRecipe)
    end
    if _G.MainFrameCorePreviousRecipe then
        S:HandleButton(_G.MainFrameCorePreviousRecipe)
    end

    -- Skill icon: retain the icon itself, but remove the default icon border effects.
    if _G.imgSkillIcon then
        _G.imgSkillIcon:SetTexCoord(unpack(E.TexCoords))
    end

    frame.ProfessionCapperSkinned = true
end)
