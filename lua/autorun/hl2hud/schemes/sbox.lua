
if SERVER then return end

local SCHEME = HL2HUD.scheme.Create()

SCHEME:Font('HudIcons', 'HalfLife2', 38, 0, true)

SCHEME:Scheme({
  Normal = Color(255, 180, 32),
  Caution = Color(255, 0, 0),
  FgColor = Color(255, 184, 20),
  BrightFg = Color(255, 200, 0),
  BgColor = Color(0, 0, 0, 0),
  BrightBg = Color(0, 0, 0, 0),
  DamagedBg = Color(0, 0, 0, 0),
  BrightDamagedBg = Color(0, 0, 0, 0),
  SelectionNumberFg = Color(255, 200, 20),
  SelectionTextFg = Color(255, 200, 20),
  AuxPowerHighColor = Color(255, 184, 20),
  SquadMemberAdded = Color(255, 200, 0),
  SquadMember = Color(255, 184, 20, 160),
  ZoomReticleColor = Color(255, 180, 32)
})

SCHEME:Layout({
  HudHealth = {
    wide = 84,
    digit_xpos = 32,
    text = '+',
    text_font = 'HudIcons',
    text_ypos = -5
  },
  HudSuit = {
    xpos = 104,
    wide = 84,
    digit_xpos = 32,
    text = '*',
    text_font = 'HudIcons',
    text_ypos = -5
  },
  HudAmmo = {
    xpos = 82,
    wide = 96,
    digit_xpos = 56,
    digit_align = 2,
    digit2_xpos = 62,
    digit2_ypos = 12,
    text = ''
  },
  HudAmmoSecondary = {
    text = ''
  },
  HudSuitPower = {
    ypos = 42,
    text2_ypos = 24
  },
  HudSquadStatus = {
    xpos = 32,
    ypos = 50,
    tall = 36,
    text = ''
  }
})

SCHEME:Animations({
  SuitPowerZero = {
    { 'StopEvent', 'SuitDamageTaken', 0 },
    { 'Animate', 'HudSuit', 'Alpha', 32, 'Linear', 0, .4 }
  },
  WeaponUsesClips = {},
	WeaponDoesNotUseClips = {},
  WeaponUsesSecondaryAmmo = {
    { 'StopAnimation', 'HudAmmo', 'Position', 0 },
    { 'StopAnimation', 'HudAmmo', 'Size', 0 },
    { 'StopPanelAnimations', 'HudAmmoSecondary', 0 },
    { 'Animate', 'HudAmmoSecondary', 'BgColor', 'BrightBg', 'Linear', 0, .1 },
    { 'Animate', 'HudAmmoSecondary', 'BgColor', 'BgColor', 'Deaccel', .1, 1 },
    { 'Animate', 'HudAmmoSecondary', 'FgColor', 'BrightFg', 'Linear', 0, .1 },
    { 'Animate', 'HudAmmoSecondary', 'FgColor', 'FgColor', 'Linear', .2, 1.5 },
    { 'Animate', 'HudAmmoSecondary', 'Alpha', 255, 'Linear', 0, .1 }
	},
  SuitAuxPowerNoItemsActive = {},
  SuitAuxPowerOneItemActive = {},
  SuitAuxPowerTwoItemsActive = {},
  SuitAuxPowerThreeItemsActive = {}
})

HL2HUD.scheme.Register('G&Mod', SCHEME)
