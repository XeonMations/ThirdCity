/mob/living/basic/mouse/rat/vampire
	icon = 'modular_darkpack/modules/npcs_nonhuman/icons/rat.dmi'
	icon_state = "rat"
	icon_living = "rat"
	icon_dead = "rat_dead"
	held_state = "rat"
	tame = TRUE

	bloodquality = BLOOD_QUALITY_LOW
	bloodpool = 1
	maxbloodpool = 1
	basic_mob_flags = FLAMMABLE_MOB

/mob/living/basic/mouse/rat/vampire/Initialize(mapload)
	. = ..()
	pixel_w = rand(-8, 8)
	pixel_z = rand(-8, 8)
