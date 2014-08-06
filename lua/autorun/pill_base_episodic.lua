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

if SERVER then
	resource.AddWorkshop("211811884")
else
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