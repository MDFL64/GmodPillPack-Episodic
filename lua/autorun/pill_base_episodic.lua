--------------------------
-- BOOTSTRAP CODE START --
--------------------------

if !pcall(require,"pk_pills") then
	if SERVER then
		hook.Add("PlayerInitialSpawn","pk_pill_extfail_cl",function(ply)
			if game.SinglePlayer() || ply:IsListenServerHost() then
				ply:SendLua('notification.AddLegacy("One or more pill extensions failed to load. Did you forget to install Parakeet\'s Pill Pack?",NOTIFY_ERROR,30)')
			end
		end)
		hook.Add("Initialize","pk_pill_extfail_sv",function(ply)
			print("[ALERT] One or more pill extensions failed to load. Did you forget to install Parakeet's Pill Pack?")
		end)
	end
	return
end

------------------------
-- BOOTSTRAP CODE END --
------------------------

AddCSLuaFile()

if CLIENT then
	game.AddParticles("particles/weapon_fx.pcf")
	PrecacheParticleSystem("weapon_combine_ion_cannon")
	PrecacheParticleSystem("weapon_combine_ion_cannon_explosion")

	game.AddParticles("particles/striderbuster.pcf")
	PrecacheParticleSystem("striderbuster_attach")
	PrecacheParticleSystem("striderbuster_attach_flash")
	PrecacheParticleSystem("striderbuster_explode_core")
	PrecacheParticleSystem("striderbuster_explode_flash")
	PrecacheParticleSystem("striderbuster_break")

	game.AddParticles("particles/advisor_fx.pcf")
	PrecacheParticleSystem("advisor_psychic_shield_idle")
end

include("include/pill_ep1.lua")
include("include/pill_ep2.lua")

pk_pills.addFiles{
	"models/birdbrainswagtrain/zombie/zombine_frame.mdl",
	"models/birdbrainswagtrain/episodic/floor_turret.mdl",
	"models/birdbrainswagtrain/episodic/roller.mdl",
	"models/birdbrainswagtrain/episodic/roller_spikes.mdl"
}

pk_pills.addIcons{
	"pill_wep_magnade",
	"pill_wep_csniper"
}

pk_pills.addWorkshop("211811884")