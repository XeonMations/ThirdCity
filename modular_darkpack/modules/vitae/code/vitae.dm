/datum/reagent/blood/vitae
	name = "Glowing blood"
	description = "It seems to be slightly glowing blood."
	color = "#fc0000"
	self_consuming = TRUE
	metabolization_rate = 100 * REAGENTS_METABOLISM // Vitae is supposed to instantly be consumed by the organism.

/datum/reagent/blood/vitae/expose_mob(mob/living/exposed_mob, methods, reac_volume, show_message, touch_protection)
	. = ..()

	if(!ishuman(exposed_mob)) //We do not have vitae implementations for non-human mobs.
		return
	var/mob/living/carbon/human/victim = exposed_mob
	var/datum/weakref/embracer_weakref = data["donor"]
	var/mob/living/carbon/human/embracer = embracer_weakref.resolve()
	if(ishumanbasic(victim)) //Are we a human species?
		if(victim.stat == DEAD) //If the human we are being added to is dead, embrace them.
			if(!embracer)
				return
			embracer.attempt_embrace_target(victim, (usr == embracer) ? null : usr)
			return
		else //Otherwise, ghoul them, since they aren't dead.
			victim.ghoulificate(embracer)
			//victim.prompt_permenant_ghouling()
			return
	if(isghoul(victim)) //Are we a ghoul  species?
		if(victim.stat == DEAD) //If the ghoul we are being added to is dead, embrace them.
			if(!embracer)
				return
			embracer.attempt_embrace_target(exposed_mob, (usr == embracer) ? null : usr)
			return
		else
			victim.bloodpool = min(victim.maxbloodpool, victim.bloodpool + (reac_volume / 50)) //Otherwise, they just consume vitae normally.
			victim.send_ghoul_vitae_consumption_message(embracer)
	if(iskindred(victim)) //Are we a kindred species?
		victim.bloodpool = min(victim.maxbloodpool, victim.bloodpool + (reac_volume / 50))
		if(embracer)
			victim.blood_bond(embracer)
	//if(isgarou(victim)) //Are we a garou species? DARKPACK TODO: GAROU
	//	victim.rollfrenzy()
