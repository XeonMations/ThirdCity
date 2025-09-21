/mob/living/basic/shadow_guard
	name = "shadow abomination"
	desc = "A shadow given life, creature of fathomless..."
	icon = 'modular_darkpack/modules/npc/icons/shadow_guard.dmi'
	icon_state = "shadow2"
	icon_living = "shadow2"

	basic_mob_flags = DEL_ON_DEATH

	speed = 0
	maxHealth = 200
	health = 200

	obj_damage = 50
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_verb_continuous = "gouges"
	attack_verb_simple = "gouge"
	attack_sound = 'sound/mobs/non-humanoids/venus_trap/venus_trap_hit.ogg'

	faction = list("Lasombra")
	bloodpool = 1
	maxbloodpool = 1

