-- name: [CS] Mia the Mailwoman
-- description: remind me to write description

local E_MODEL_MIA = smlua_model_util_get_id("mia_geo")
local TEX_MIA_ICON = get_texture_info("mia-icon")
local TEXT_MOD_NAME = "[CS] Mia the Mailwoman"

local MIA_MOUTH_NORMAL = 0
local MIA_MOUTH_CAT = 1
local MIA_MOUTH_HAPPY = 2
local MIA_MOUTH_U = 3
local MIA_MOUTH_O = 4
local MIA_MOUTH_V = 5
local MIA_MOUTH_WATER = 6
local MIA_MOUTH_WAAA = 7

local MIA_HAND_DEFAULT = 0
local MIA_HAND_PACE = 1
local MIA_HAND_OPEN = 2

local MIA_ANIMTABLE = {
    [_G.charSelect.CS_ANIM_MENU] = "Mia_AnimMenu",
    --[_G.charSelect.CS_ANIM_MENU] = "Mia_Dance1",
    [CHAR_ANIM_IDLE_HEAD_LEFT] = "Mia_IdlePart1",
    [CHAR_ANIM_IDLE_HEAD_RIGHT] = "Mia_IdlePart2",
    [CHAR_ANIM_IDLE_HEAD_CENTER] = "Mia_IdlePart3",
    [CHAR_ANIM_FIRST_PERSON] = "Mia_Firstperson",

    [CHAR_ANIM_SINGLE_JUMP] = "Mia_SingleJump",

    [CHAR_ANIM_RUNNING] = "Mia_Run",

    [CHAR_ANIM_STAR_DANCE] = "Mia_StarDance",
    [CHAR_ANIM_RETURN_FROM_STAR_DANCE] = "Mia_ReturnStarDance",
}

-- 9 - happy
-- 10 - squirt
local MIA_ANIMTABLE_EYES = {
    [_G.charSelect.CS_ANIM_MENU] = MARIO_EYES_LOOK_RIGHT,

    [CHAR_ANIM_STAR_DANCE] = 9,
    [CHAR_ANIM_WATER_STAR_DANCE] = 9,
    [CHAR_ANIM_CREDITS_PEACE_SIGN] = 9,
    [CHAR_ANIM_CREDITS_WAVING] = 9,
    [CHAR_ANIM_PLACE_LIGHT_OBJ] = 9,

    [CHAR_ANIM_TRIPLE_JUMP_LAND] = 10,
    [CHAR_ANIM_AIR_KICK] = 10,
    [CHAR_ANIM_GROUND_KICK] = 10,
    [CHAR_ANIM_FORWARD_KB] = 10,
    [CHAR_ANIM_BACKWARD_KB] = 10,
    [CHAR_ANIM_SOFT_BACK_KB] = 10,
    [CHAR_ANIM_SOFT_FRONT_KB] = 10,
    [CHAR_ANIM_AIR_FORWARD_KB] = 10,
    [CHAR_ANIM_BACKWARD_AIR_KB] = 10,
    [CHAR_ANIM_WATER_FORWARD_KB] = 10,
    [CHAR_ANIM_BACKWARDS_WATER_KB] = 10,
    [CHAR_ANIM_THROW_CATCH_KEY] = 10,
    [CHAR_ANIM_BREAKDANCE] = 10,
    [CHAR_ANIM_GROUND_BONK] = 10,
    [CHAR_ANIM_DYING_IN_QUICKSAND] = 10,
    [CHAR_ANIM_FIRE_LAVA_BURN] = 10,
    [CHAR_ANIM_FALL_OVER_BACKWARDS] = 10,
    [CHAR_ANIM_LAND_ON_STOMACH] = 10,
    [CHAR_ANIM_GROUND_POUND_LANDING] = 10,
    [CHAR_ANIM_TWIRL] = 10,
    [CHAR_ANIM_SHOCKED] = 10,
    [CHAR_ANIM_RELEASE_BOWSER] = 10,
    [CHAR_ANIM_GRAB_BOWSER] = 10,
    [CHAR_ANIM_GRAB_HEAVY_OBJECT] = 10,
    [CHAR_ANIM_BEING_GRABBED] = 10,

    [CHAR_ANIM_DOUBLE_JUMP_FALL] = MARIO_EYES_LOOK_DOWN,
    [CHAR_ANIM_GROUND_POUND] = MARIO_EYES_LOOK_DOWN,
    [CHAR_ANIM_START_GROUND_POUND] = MARIO_EYES_LOOK_DOWN,
    [CHAR_ANIM_CLIMB_DOWN_LEDGE] = MARIO_EYES_LOOK_DOWN,
    [CHAR_ANIM_GENERAL_FALL] = MARIO_EYES_LOOK_DOWN,
    [CHAR_ANIM_IDLE_ON_POLE] = MARIO_EYES_LOOK_DOWN,
    [CHAR_ANIM_HANDSTAND_LEFT] = MARIO_EYES_LOOK_DOWN,
    [CHAR_ANIM_HANDSTAND_RIGHT] = MARIO_EYES_LOOK_DOWN,
    [CHAR_ANIM_HANG_ON_OWL] = MARIO_EYES_LOOK_DOWN,

    [CHAR_ANIM_DOUBLE_JUMP_RISE] = MARIO_EYES_LOOK_UP,
    [CHAR_ANIM_CLIMB_UP_POLE] = MARIO_EYES_LOOK_UP,
    [CHAR_ANIM_START_TWIRL] = MARIO_EYES_LOOK_UP,
    [CHAR_ANIM_IDLE_ON_LEDGE] = MARIO_EYES_LOOK_UP,
    [CHAR_ANIM_HANG_ON_CEILING] = MARIO_EYES_LOOK_UP,

    [CHAR_ANIM_SKID_ON_GROUND] = MARIO_EYES_LOOK_RIGHT,
    [CHAR_ANIM_TURNING_PART1] = MARIO_EYES_LOOK_RIGHT,
    [CHAR_ANIM_SIDESTEP_LEFT] = MARIO_EYES_LOOK_RIGHT,
    [CHAR_ANIM_SIDESTEP_RIGHT] = MARIO_EYES_LOOK_LEFT,

    [CHAR_ANIM_PUT_CAP_ON] = MARIO_EYES_CLOSED,
    [CHAR_ANIM_TAKE_CAP_OFF_THEN_ON] = MARIO_EYES_CLOSED,

    [CHAR_ANIM_START_SLEEP_IDLE] = MARIO_EYES_HALF_CLOSED,
    [CHAR_ANIM_START_SLEEP_SCRATCH] = MARIO_EYES_HALF_CLOSED,
    [CHAR_ANIM_START_SLEEP_SITTING] = MARIO_EYES_HALF_CLOSED,
    [CHAR_ANIM_START_SLEEP_YAWN] = MARIO_EYES_HALF_CLOSED,

}




local MIA_ANIMTABLE_HANDS = {
    [CHAR_ANIM_FIRST_PERSON] = MARIO_HAND_RIGHT_OPEN,
    [CHAR_ANIM_TRIPLE_JUMP_LAND] = MARIO_HAND_PEACE_SIGN
}

local MIA_ANIMTABLE_HAND2 = {
    [CHAR_ANIM_TRIPLE_JUMP_LAND] = MIA_HAND_PACE,
    [_G.charSelect.CS_ANIM_MENU] = MIA_HAND_OPEN
}


local VOICETABLE_MIA = {
}

local PALETTE_MIA = {
    name = "Classic",
    [PANTS] = "B53121",
    [SHIRT] = "AE6DD8",
    [GLOVES] = "ffffff",
    [HAIR] = "9429BB",
    [SHOES] = "9429BB",
    [SKIN] = "DFBF97",
    [CAP] = "B53121",
    [EMBLEM] = "AE6DD8",
}
local PALETTE_MIA_MODERN = {
    name = "Modern",
    [PANTS] = { r = 0, g = 0, b = 255 },
    [SHIRT] = { r = 255, g = 0, b = 255 },
    [GLOVES] = { r = 255, g = 255, b = 255 },
    [HAIR] = { r = 53, g = 30, b = 52 },
    [SHOES] = { r = 147, g = 44, b = 26 },
    [SKIN] = { r = 255, g = 189, b = 135 },
    [CAP] = { r = 255, g = 0, b = 255 },
    [EMBLEM] = { r = 255, g = 255, b = 255 },
}

--[[

local HEALTH_MIA = {
    label = {
        left = get_texture_info("mawio_power_meter1"),
        right = get_texture_info("mawio_power_meter2"),
    },
    pie = {
        [1] = get_texture_info("char_select_custom_meter_pie1"),
        [2] = get_texture_info("char_select_custom_meter_pie2"),
        [3] = get_texture_info("char_select_custom_meter_pie3"),
        [4] = get_texture_info("char_select_custom_meter_pie4"),
        [5] = get_texture_info("char_select_custom_meter_pie5"),
        [6] = get_texture_info("char_select_custom_meter_pie6"),
        [7] = get_texture_info("char_select_custom_meter_pie7"),
        [8] = get_texture_info("char_select_custom_meter_pie8"),
    }
}
--]]
if _G.charSelectExists then
    CT_MIA_MAILER = _G.charSelect.character_add("Mia", { "remind me to write a description" }, "Wall_E20",
        "9429BB", E_MODEL_MIA, CT_MARIO, TEX_MIA_ICON, 1.1)

    _G.charSelect.character_add_voice(E_MODEL_MIA, VOICETABLE_MIA)

    _G.charSelect.character_add_animations(E_MODEL_MIA, MIA_ANIMTABLE, MIA_ANIMTABLE_EYES, MIA_ANIMTABLE_HANDS)


    _G.charSelect.character_add_palette_preset(E_MODEL_MIA, PALETTE_MIA, PALETTE_MIA.name)
    _G.charSelect.character_add_palette_preset(E_MODEL_MIA, PALETTE_MIA_MODERN, PALETTE_MIA_MODERN.name)


    --_G.charSelect.character_add_celebration_star(E_MODEL_MIA, E_MODEL_MIA, TEX)

    --_G.charSelect.character_add_costume_health_meter(CT_MIA_MAILER, 1, HEALTH_MAWIO_W20)

    --_G.charSelect.character_add_graffiti(CT_MIA_MAILER, get_texture_info("mawio_cs_graffiti"))

    init_physbone_chain(E_MODEL_MIA, 0, nil, nil, nil, nil,
        function(rotNode, j)
            local o = geo_get_current_object()
            local m = geo_get_mario_state()
            local isMario = m.marioObj == o
            local fVel = o.oForwardVel ~= 0 and o.oForwardVel or m.forwardVel
            rotNode.rotation.z = rotNode.rotation.z - degrees_to_sm64(math.clamp(fVel, -10, 90 - 25))

            if isMario then
                rotNode.rotation.x = rotNode.rotation.x + m.marioBodyState.headAngle.z
                rotNode.rotation.z = rotNode.rotation.z + m.marioBodyState.headAngle.x

                if m.area.camera.mode == CAMERA_MODE_C_UP then
                    rotNode.rotation.z = rotNode.rotation.z + m.statusForCamera.headRotation.x*0.8;
                end
            end

            if find_water_level(o.oPosX, o.oPosZ) > o.oPosY + 120 then
                
                rotNode.rotation.z = rotNode.rotation.z + o.header.gfx.angle.x - degrees_to_sm64(90)

                if sm64_to_degrees(rotNode.rotation.z) > - 35 then
                    rotNode.rotation.z = degrees_to_sm64(-35)
                end
                --djui_chat_message_create(tostring(sm64_to_degrees(rotNode.rotation.z)))
            end
        end)


    hook_event(HOOK_CHARACTER_SOUND, function(m, sound)
        if _G.charSelect.character_get_voice(m) == VOICETABLE_MIA then return _G.charSelect.voice.sound(m, sound) end
    end)

    hook_event(HOOK_MARIO_UPDATE, function(m)
        if _G.charSelect.character_get_voice(m) == VOICETABLE_MIA then return _G.charSelect.voice.snore(m) end
    end)
else
    djui_popup_create(
        "\\#ffffdc\\\n" ..
        TEXT_MOD_NAME ..
        "\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!",
        6)
end


for i = 0, MAX_PLAYERS - 1 do
    gPlayerSyncTable[i].mia_mouth = 0
end


local MIA_ANIMTABLE_MOUTH = {

    [CHAR_ANIM_SLEEP_IDLE] = MIA_MOUTH_CAT,
    [CHAR_ANIM_SLEEP_LYING] = MIA_MOUTH_CAT,
    [CHAR_ANIM_SLEEP_START_LYING] = MIA_MOUTH_CAT,
    [CHAR_ANIM_CRAWLING] = MIA_MOUTH_CAT,

    [CHAR_ANIM_SINGLE_JUMP] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_DOUBLE_JUMP_RISE] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_JUMP_RIDING_SHELL] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_JUMP_WITH_LIGHT_OBJ] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_TRIPLE_JUMP] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_TRIPLE_JUMP_FLY] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_TRIPLE_JUMP_LAND] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_FIRST_PUNCH] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_FIRST_PUNCH_FAST] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_SLIDEJUMP] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_HANDSTAND_JUMP] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_SUMMON_STAR] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_STAR_DANCE] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_WATER_STAR_DANCE] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_FAST_LONGJUMP] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_AIR_KICK] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_GROUND_KICK] = MIA_MOUTH_HAPPY,
    [CHAR_ANIM_SLOW_LONGJUMP] = MIA_MOUTH_HAPPY,

    [CHAR_ANIM_CREDITS_LOOK_BACK_THEN_RUN] = MIA_MOUTH_U,
    [CHAR_ANIM_FAST_LEDGE_GRAB] = MIA_MOUTH_U,
    [CHAR_ANIM_IDLE_ON_LEDGE] = MIA_MOUTH_U,
    [CHAR_ANIM_SLOW_LAND_FROM_DIVE] = MIA_MOUTH_U,
    [CHAR_ANIM_BACKFLIP] = MIA_MOUTH_U,
    [CHAR_ANIM_SLIDE_KICK] = MIA_MOUTH_U,
    [CHAR_ANIM_FIRST_PERSON] = MIA_MOUTH_U,
    [CHAR_ANIM_SLIDE_MOTIONLESS] = MIA_MOUTH_U,
    [CHAR_ANIM_SLIDE] = MIA_MOUTH_U,
    [CHAR_ANIM_MOVE_ON_WIRE_NET_LEFT] = MIA_MOUTH_U,
    [CHAR_ANIM_MOVE_ON_WIRE_NET_RIGHT] = MIA_MOUTH_U,

    [CHAR_ANIM_DOUBLE_JUMP_FALL] = MIA_MOUTH_O,
    [CHAR_ANIM_SECOND_PUNCH] = MIA_MOUTH_O,
    [CHAR_ANIM_SECOND_PUNCH_FAST] = MIA_MOUTH_O,
    [CHAR_ANIM_DIVE] = MIA_MOUTH_O,
    [CHAR_ANIM_SLIDE_DIVE] = MIA_MOUTH_O,
    [CHAR_ANIM_RIDING_SHELL] = MIA_MOUTH_O,
    [CHAR_ANIM_START_RIDING_SHELL] = MIA_MOUTH_O,
    [CHAR_ANIM_SHOCKED] = MIA_MOUTH_O,
    [CHAR_ANIM_HEAD_STUCK_IN_GROUND] = MIA_MOUTH_O,
    [CHAR_ANIM_GROUND_THROW] = MIA_MOUTH_O,
    [CHAR_ANIM_BOTTOM_STUCK_IN_GROUND] = MIA_MOUTH_O,
    [CHAR_ANIM_LEGS_STUCK_IN_GROUND] = MIA_MOUTH_O,
    [CHAR_ANIM_THROW_LIGHT_OBJECT] = MIA_MOUTH_O,
    [CHAR_ANIM_SKID_ON_GROUND] = MIA_MOUTH_O,
    [CHAR_ANIM_SOFT_BACK_KB] = MIA_MOUTH_O,
    [CHAR_ANIM_SOFT_FRONT_KB] = MIA_MOUTH_O,
    [CHAR_ANIM_PICK_UP_LIGHT_OBJ] = MIA_MOUTH_O,
    [CHAR_ANIM_WATER_PICK_UP_OBJ] = MIA_MOUTH_O,
    [CHAR_ANIM_TURNING_PART1] = MIA_MOUTH_O,
    [CHAR_ANIM_TURNING_PART2] = MIA_MOUTH_O,
    [CHAR_ANIM_GRAB_POLE_SWING_PART1] = MIA_MOUTH_O,
    [CHAR_ANIM_GRAB_POLE_SWING_PART2] = MIA_MOUTH_O,
    [CHAR_ANIM_GRAB_POLE_SHORT] = MIA_MOUTH_O,
    [CHAR_ANIM_START_SLEEP_YAWN] = MIA_MOUTH_O,
    [CHAR_ANIM_HANG_ON_CEILING] = MIA_MOUTH_O,
    [CHAR_ANIM_TIPTOE] = MIA_MOUTH_O,
    [CHAR_ANIM_SHIVERING_WARMING_HAND] = MIA_MOUTH_O,
    [CHAR_ANIM_START_TWIRL] = MIA_MOUTH_O,


    [CHAR_ANIM_FORWARD_KB] = MIA_MOUTH_V,
    [CHAR_ANIM_BACKWARD_KB] = MIA_MOUTH_V,
    [CHAR_ANIM_WATER_FORWARD_KB] = MIA_MOUTH_V,
    [CHAR_ANIM_BACKWARDS_WATER_KB] = MIA_MOUTH_V,
    [CHAR_ANIM_STAND_UP_FROM_LAVA_BOOST] = MIA_MOUTH_V,
    [CHAR_ANIM_GROUND_BONK] = MIA_MOUTH_V,
    [CHAR_ANIM_IDLE_IN_QUICKSAND] = MIA_MOUTH_V,
    [CHAR_ANIM_START_SLEEP_SCRATCH] = MIA_MOUTH_V,
    [CHAR_ANIM_SHIVERING] = MIA_MOUTH_V,
    [CHAR_ANIM_RELEASE_BOWSER] = MIA_MOUTH_V,
    [CHAR_ANIM_SWINGING_BOWSER] = MIA_MOUTH_V,
    [CHAR_ANIM_GRAB_BOWSER] = MIA_MOUTH_V,
    [CHAR_ANIM_GRAB_HEAVY_OBJECT] = MIA_MOUTH_V,
    [CHAR_ANIM_BEING_GRABBED] = MIA_MOUTH_V,


    [CHAR_ANIM_IDLE_HEAVY_OBJ] = MIA_MOUTH_WATER,
    [CHAR_ANIM_WALK_WITH_HEAVY_OBJ] = MIA_MOUTH_WATER,
    [CHAR_ANIM_HEAVY_THROW] = MIA_MOUTH_WATER,
    [CHAR_ANIM_IDLE_WITH_LIGHT_OBJ] = MIA_MOUTH_WATER,
    [CHAR_ANIM_GROUND_POUND] = MIA_MOUTH_WATER,
    [CHAR_ANIM_GROUND_POUND_LANDING] = MIA_MOUTH_WATER,
    [CHAR_ANIM_START_GROUND_POUND] = MIA_MOUTH_WATER,
    [CHAR_ANIM_HOLDING_BOWSER] = MIA_MOUTH_WATER,
    [CHAR_ANIM_IDLE_ON_POLE] = MIA_MOUTH_WATER,
    [CHAR_ANIM_CLIMB_UP_POLE] = MIA_MOUTH_WATER,
    [CHAR_ANIM_CLIMB_DOWN_LEDGE] = MIA_MOUTH_WATER,
    [CHAR_ANIM_SLOW_LEDGE_GRAB] = MIA_MOUTH_WATER,
    [CHAR_ANIM_MOVE_IN_QUICKSAND] = MIA_MOUTH_WATER,
    [CHAR_ANIM_STAND_AGAINST_WALL] = MIA_MOUTH_WATER,
    [CHAR_ANIM_SIDESTEP_LEFT] = MIA_MOUTH_WATER,
    [CHAR_ANIM_SIDESTEP_RIGHT] = MIA_MOUTH_WATER,
    [CHAR_ANIM_SHIVERING_RETURN_TO_IDLE] = MIA_MOUTH_WATER,
    [CHAR_ANIM_HANDSTAND_LEFT] = MIA_MOUTH_WATER,
    [CHAR_ANIM_HANDSTAND_RIGHT] = MIA_MOUTH_WATER,


    [CHAR_ANIM_FIRE_LAVA_BURN] = MIA_MOUTH_WAAA,
    [CHAR_ANIM_AIR_FORWARD_KB] = MIA_MOUTH_WAAA,
    [CHAR_ANIM_BACKWARD_AIR_KB] = MIA_MOUTH_WAAA,
    [CHAR_ANIM_DYING_IN_QUICKSAND] = MIA_MOUTH_WAAA,
    [CHAR_ANIM_FALL_OVER_BACKWARDS] = MIA_MOUTH_WAAA,
    [CHAR_ANIM_LAND_ON_STOMACH] = MIA_MOUTH_WAAA,
    [CHAR_ANIM_SHOCKED] = MIA_MOUTH_WAAA,

    [_G.charSelect.CS_ANIM_MENU] = MIA_MOUTH_U,
}


local function special_expressions(m)
    local curranim = m.marioObj.header.gfx.animInfo.animID
    local animframe = m.marioObj.header.gfx.animInfo.animFrame
    local smluaanim = smlua_anim_util_get_current_animation_name(m.marioObj)
    if m.action == ACT_IDLE and m.actionTimer >= 7 then
        return { eyes = MARIO_EYES_HALF_CLOSED }

    elseif curranim == CHAR_ANIM_TURNING_PART2 and animframe < 9 then
        return { eyes = MARIO_EYES_LOOK_RIGHT, mouth = MIA_MOUTH_O }

    elseif (curranim == CHAR_ANIM_TRIPLE_JUMP_LAND) and animframe > 20 then
        return { eyes = MARIO_EYES_BLINK, mouth = MIA_MOUTH_NORMAL, hands = MARIO_HAND_FISTS }

    elseif (curranim == CHAR_ANIM_GROUND_KICK) and animframe > 15 then
        return { eyes = MARIO_EYES_BLINK, mouth = MIA_MOUTH_NORMAL }

    elseif (curranim == CHAR_ANIM_TRIPLE_JUMP) and animframe > 30 then
        return { eyes = MARIO_EYES_LOOK_DOWN, mouth = MIA_MOUTH_O }

    elseif ((curranim == CHAR_ANIM_FAST_LONGJUMP) or (curranim == CHAR_ANIM_SLOW_LONGJUMP)) and animframe > 11 then
        return { mouth = MIA_MOUTH_O }

    elseif (curranim == CHAR_ANIM_TAKE_CAP_OFF_THEN_ON) and animframe > 83 then
        return { eyes = MARIO_EYES_BLINK }

    elseif m.action == ACT_SOFT_BONK or m.action == ACT_SHOCKWAVE_BOUNCE or m.action == ACT_BUBBLED or ((m.particleFlags & PARTICLE_FIRE) ~= 0) or (m.hurtCounter > 0) then
        return { eyes = 10, mouth = MIA_MOUTH_V }

    elseif m.flags & MARIO_UNKNOWN_18 ~= 0 and (m.action & ACT_GROUP_CUTSCENE) == 0 then
        return { eyes = 10, mouth = MIA_MOUTH_WAAA }

    elseif m.action == ACT_STEEP_JUMP then
        return {mouth = MIA_MOUTH_O}

    elseif m.healCounter > 0 and (m.action & ACT_GROUP_CUTSCENE) == 0 and (m.action & ACT_FLAG_INVULNERABLE) == 0 then
        return { eyes = 9 }
        
    elseif m.action == ACT_WALKING or m.action == ACT_BUTT_SLIDE or
            m.action == ACT_DIVE_SLIDE or
            m.action == ACT_STOMACH_SLIDE or
            m.action == ACT_HOLD_BUTT_SLIDE or
            m.action == ACT_SLIDE_KICK_SLIDE or
            m.action == ACT_HOLD_STOMACH_SLIDE then
        if (m.input & INPUT_NONZERO_ANALOG ~= 0) then
            if (m.faceAngle.y < m.intendedYaw) then
                return { eyes = MARIO_EYES_LOOK_RIGHT }
            end

            if (m.faceAngle.y > m.intendedYaw) then
                return { eyes = MARIO_EYES_LOOK_LEFT }
            end
        end
        
    elseif (smluaanim == "Mia_StarDance") then
        if animframe < 27 then
            return { mouth = MIA_MOUTH_HAPPY, eyes = MARIO_EYES_BLINK , hands = MARIO_HAND_FISTS}
        elseif animframe >= 27 and animframe < 48 then
            return { mouth = MIA_MOUTH_O, eyes = 10 , hands = MARIO_HAND_OPEN}
        elseif animframe >= 48 and animframe <= 57 then
            return { mouth = MIA_MOUTH_NORMAL, eyes = MARIO_EYES_CLOSED, hands = MARIO_HAND_FISTS }
        elseif animframe > 57 then
            return { mouth = MIA_MOUTH_HAPPY, eyes = 9, hands = MARIO_HAND_PEACE_SIGN}
        end
    elseif (smluaanim == "Mia_Dance1") then
        obj_skip_interpolation(m.marioObj)
        play_step_sound(m, 11, 22)
        --m.particleFlags = m.particleFlags | PARTICLE_SPARKLES
        if animframe < 9 then
            return { mouth = MIA_MOUTH_U, eyes = MARIO_EYES_LOOK_RIGHT, hands = MARIO_HAND_PEACE_SIGN, hand2 = MIA_HAND_PACE }
        elseif animframe >= 15 and animframe < 24 then
            return { mouth = MIA_MOUTH_U, eyes = MARIO_EYES_LOOK_LEFT, hands = MARIO_HAND_PEACE_SIGN, hand2 = MIA_HAND_PACE }
        elseif (animframe >= 27 and animframe <= 35) or (animframe >= 41 and animframe <= 46) then
            return { mouth = MIA_MOUTH_HAPPY, eyes = 10, hand2 = MIA_HAND_DEFAULT}
        else
            return { mouth = MIA_MOUTH_NORMAL, eyes = MARIO_EYES_CLOSED, hand2 = MIA_HAND_DEFAULT }
        end
    else
        return
    end
end

-- 0 = default
-- 1 = :3
-- 2 = Open Happy
-- 3 = o
-- 4 = Oh
-- 5 = :<
-- 6 = Underwater/Struggle
-- 7 = Waaahh
function mia_mouth_func(node, matStackIndex)
    local m = geo_get_mario_state()
    local s = gPlayerSyncTable[m.playerIndex]
    local asSwitchNode = cast_graph_node(node)
    local mouth_id = MIA_MOUTH_NORMAL
    local special_expressions = special_expressions(m)
    local smluaanim = smlua_anim_util_get_current_animation_name(m.marioObj)

    if MIA_ANIMTABLE_MOUTH[m.marioObj.header.gfx.animInfo.animID] ~= nil then
        mouth_id = MIA_ANIMTABLE_MOUTH[m.marioObj.header.gfx.animInfo.animID]
    else
        mouth_id = MIA_MOUTH_NORMAL
    end

    if (m.action & ACT_FLAG_SWIMMING) ~= 0 or (m.input & INPUT_IN_POISON_GAS) ~= 0 and (m.action & ACT_GROUP_CUTSCENE) == 0 then
        mouth_id = MIA_MOUTH_WATER
        
    elseif (m.health < 768) and (m.action & ACT_GROUP_CUTSCENE) == 0 then
        if mouth_id == MIA_MOUTH_NORMAL then
            mouth_id = MIA_MOUTH_V
        end
    end

    if special_expressions then
        if special_expressions.mouth then
            mouth_id = special_expressions.mouth
        end
    end

    if smluaanim == "Mia_RunFast" then
        mouth_id = MIA_MOUTH_HAPPY
    end
    
    asSwitchNode.selectedCase = mouth_id
end
function mia_extra_switch_func(node, matStackIndex)
    local m = geo_get_mario_state()
    local special_expressions = special_expressions(m)
    local bodystate = geo_get_body_state()
    local asSwitchNode = cast_graph_node(node)

    if cast_graph_node(node).parameter == 0 then
        if m.waterLevel > m.pos.y + 70 then
            asSwitchNode.selectedCase = 1
        else
            asSwitchNode.selectedCase = 0
        end
    elseif cast_graph_node(node).parameter == 1 then
        if MIA_ANIMTABLE_HAND2[m.marioObj.header.gfx.animInfo.animID] ~= nil then
            asSwitchNode.selectedCase = MIA_ANIMTABLE_HAND2[m.marioObj.header.gfx.animInfo.animID]
        else
            asSwitchNode.selectedCase = MIA_HAND_DEFAULT
        end
        if special_expressions then
            if special_expressions.hand2 then
                asSwitchNode.selectedCase = special_expressions.hand2
            else
                asSwitchNode.selectedCase = MIA_HAND_DEFAULT
            end
        end
    elseif cast_graph_node(node).parameter == 2 then
        local wingrot = ((get_area_update_counter() % 16))
        local wingrot_flutter = ((get_area_update_counter() % 6))
        --djui_chat_message_create(tostring(wingrot_flutter))
        if bodystate.wingFlutter == 1 then
            if wingrot_flutter > (5 / 2) then
                asSwitchNode.selectedCase = 0
            else
                asSwitchNode.selectedCase = 1
            end
        else
            if wingrot > (15 / 2) then
                asSwitchNode.selectedCase = 0
            else
                asSwitchNode.selectedCase = 1
            end
        end
    end
end

hook_event(HOOK_MARIO_UPDATE, function(m)
    if charSelect.character_get_current_number(m.playerIndex) == CT_MIA_MAILER then
        local special_expressions = special_expressions(m)
        if m.action == ACT_WALKING then
            if m.forwardVel > 38 then
                smlua_anim_util_set_animation(m.marioObj, "Mia_RunFast")
                m.marioBodyState.torsoAngle.x = -degrees_to_sm64(5)
                m.marioBodyState.handState = MARIO_HAND_OPEN
                m.particleFlags = m.particleFlags | PARTICLE_DUST
            end
        end
        if special_expressions then
            if special_expressions.eyes then
                m.marioBodyState.eyeState = special_expressions.eyes
            end
            if special_expressions.hands then
                m.marioBodyState.handState = special_expressions.hands
            end
        end
        if (m.action & ACT_FLAG_SWIMMING_OR_FLYING) ~= 0 then
            local targetYawVel = -math.s16(10.0 * m.controller.stickX)
            local targetPitchVel = -math.s16(10.0 * m.controller.stickY)

            if (targetYawVel > 0) then
                m.marioBodyState.eyeState = MARIO_EYES_LOOK_RIGHT
            end
            if (targetYawVel < 0) then
                m.marioBodyState.eyeState = MARIO_EYES_LOOK_LEFT 
            end
            if (targetPitchVel > 0) then
                m.marioBodyState.eyeState = MARIO_EYES_LOOK_UP
            end
            if (targetPitchVel < 0) then
                m.marioBodyState.eyeState = MARIO_EYES_LOOK_DOWN
            end
        end
    end
end)
charSelect.character_hook_moveset(CT_MIA_MAILER, HOOK_MARIO_UPDATE, 
    function (m)
    if m.action == ACT_WALKING then
        if (m.controller.buttonDown & Y_BUTTON ) ~= 0 then
                if (m.floor ~= nil and m.floor.type == SURFACE_SLOW) then
                    m.forwardVel = m.forwardVel + 0.2 / (m.quicksandDepth + 1)
                else
                    m.forwardVel = m.forwardVel + 1.5 / (m.quicksandDepth + 1)
                end
            end
        end
    end)