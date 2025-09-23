
/datum/job/vamp/citizen
	title = JOB_CITIZEN
	description = "Obey the authorities... Or don't. You are up late tonight for one reason or another."
	faction = FACTION_CITY
	total_positions = -1
	spawn_positions = -1
	outfit = /datum/outfit/job/citizen
	paycheck = PAYCHECK_LOWER

	exp_granted_type = EXP_TYPE_CREW

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_CITIZEN

	department_for_prefs = /datum/job_department/citizen

	//allowed_species = list("Vampire", "Ghoul", "Human", "Werewolf", "Kuei-Jin")
	//v_duty = "Follow the traditions of the Camarilla. Obey the Prince and their authority. The city belongs to him. Aligning yourself with your clan members would be of benefit."

	//minimal_masquerade = 0
	//allowed_bloodlines = list(VAMPIRE_CLAN_TRUE_BRUJAH, VAMPIRE_CLAN_DAUGHTERS_OF_CACOPHONY, VAMPIRE_CLAN_SALUBRI, VAMPIRE_CLAN_BAALI, VAMPIRE_CLAN_BRUJAH, VAMPIRE_CLAN_TREMERE, VAMPIRE_CLAN_VENTRUE, VAMPIRE_CLAN_NOSFERATU, VAMPIRE_CLAN_GANGREL, VAMPIRE_CLAN_TOREADOR, VAMPIRE_CLAN_MALKAVIAN, VAMPIRE_CLAN_BANU_HAQIM, VAMPIRE_CLAN_GIOVANNI, VAMPIRE_CLAN_FOLLOWERS_OF_SET, VAMPIRE_CLAN_TZIMISCE, VAMPIRE_CLAN_LASOMBRA, VAMPIRE_CLAN_CAITIFF, VAMPIRE_CLAN_OLD_CLAN_TZIMISCE, VAMPIRE_CLAN_KIASYD, VAMPIRE_CLAN_CAPPADOCIAN, VAMPIRE_CLAN_GARGOYLE)

	job_flags = CITY_JOB_FLAGS
	rpg_title = "Lout"
	config_tag = "CITIZEN"

/datum/outfit/job/vampire/citizen
	name = JOB_CITIZEN
	jobtype = /datum/job/vamp/citizen
	//l_pocket = /obj/item/vamp/phone
	id = /obj/item/cockclock

/datum/outfit/job/citizen/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.clan)
		if(H.gender == MALE)
			shoes = /obj/item/clothing/shoes/vampire
			if(H.clan.male_clothes)
				uniform = H.clan.male_clothes
		else
			shoes = /obj/item/clothing/shoes/vampire/heels
			if(H.clan.female_clothes)
				uniform = H.clan.female_clothes
	else
		uniform = /obj/item/clothing/under/vampire/emo
		if(H.gender == MALE)
			shoes = /obj/item/clothing/shoes/vampire
		else
			shoes = /obj/item/clothing/shoes/vampire/heels

	backpack_contents = list(/obj/item/passport, /obj/item/flashlight, /obj/item/card/credit)

/obj/effect/landmark/start/citizen
	name = "Citizen"
	icon_state = "Assistant"
