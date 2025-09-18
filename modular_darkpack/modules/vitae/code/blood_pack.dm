//Regular blooc packs are considered O-, due to being the all-purpose donation blood type.
/obj/item/reagent_containers/blood
	icon = 'modular_darkpack/modules/vitae/icons/bloodpack.dmi'
	lefthand_file = 'modular_darkpack/modules/vitae/icons/lefthand.dmi'
	righthand_file = 'modular_darkpack/modules/vitae/icons/righthand.dmi'
	onflooricon = 'modular_darkpack/modules/vitae/icons/onfloor.dmi'
	icon_state = "blood100"
	inhand_icon_state = "blood100"
	reagent_flags = OPENCONTAINER | REFILLABLE | DRAWABLE

	var/amount_of_bloodpoints = 2

/obj/item/reagent_containers/blood/update_appearance(updates)
	. = ..()
	var/percent = round((reagents.total_volume / volume) * 100)
	switch(percent)
		if(100)
			icon_state = "blood100"
		if(75)
			icon_state = "blood75"
		if(50)
			icon_state = "blood50"
		if(25)
			icon_state = "blood25"
		if(0)
			icon_state = "blood0"
	inhand_icon_state = icon_state
	onflooricon_state = icon_state

/// Handles updating the container when the reagents change.
/obj/item/reagent_containers/blood/on_reagent_change(datum/reagents/holder, ...)
	if(!holder)
		return
	return ..()

/obj/item/reagent_containers/blood/update_appearance(updates)
	update_blood_type()
	. = ..()

/obj/item/reagent_containers/blood/proc/update_blood_type()
	if(!reagents)
		return
	var/datum/reagent/blood/B = (reagents.has_reagent(/datum/reagent/blood) || reagents.has_reagent(/datum/reagent/blood/vitae))
	if(B && B.data && B.data["blood_type"])
		blood_type = B.data["blood_type"]
	else
		blood_type = null

/obj/item/reagent_containers/blood/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!canconsume(M, user))
		return
	if(!reagents.holder_full())
		return
	if(!do_after(user, 3 SECONDS, M))
		return
	reagents.trans_to(M, reagents.total_volume, transferred_by = user, methods = EXPOSE_VAMPIRE, show_message = FALSE)

	playsound(M.loc, 'sound/items/drink.ogg', 50, TRUE)
	update_appearance()
	//SEND_SIGNAL(M, COMSIG_MASQUERADE_VIOLATION)
	if(ishumanbasic(M) || (isghoul(M) && !reagents.has_reagent(/datum/reagent/blood/vitae)))
		to_chat(M, span_notice("That didn't taste very good..."))
		M.adjust_disgust(DISGUST_LEVEL_GROSS)
		M.add_mood_event("toxic_food", /datum/mood_event/disgusting_food)
	if(iskindred(M) || (isghoul(M) && reagents.has_reagent(/datum/reagent/blood/vitae)))
		M.bloodpool = min(M.maxbloodpool, M.bloodpool+amount_of_bloodpoints)
		M.adjustBruteLoss(-20, TRUE)
		M.adjustFireLoss(-20, TRUE)
		M.update_blood_hud()

/obj/item/reagent_containers/blood/empty
	blood_type = null

/obj/item/reagent_containers/blood/ab_plus
	blood_type = BLOOD_TYPE_AB_PLUS

/obj/item/reagent_containers/blood/ab_minus
	blood_type = BLOOD_TYPE_AB_MINUS

/obj/item/reagent_containers/blood/vitae
	name = "\improper vampire vitae pack (full)"
	amount_of_bloodpoints = 4
	blood_type = /datum/blood_type/kindred

/obj/item/reagent_containers/blood/random

/obj/item/reagent_containers/blood/random/Initialize(mapload)
	if(mapload)
		blood_type = random_human_blood_type()
	return ..()


/////////////////////////////////////////////////////////////////

/obj/item/reagent_containers/blood/bweedpack
	name = "\improper elite blood pack (full)"
	blood_type = null

/obj/item/reagent_containers/blood/bweedpack/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/drug/cannabis, 20)
	reagents.add_reagent(/datum/reagent/toxin/lipolicide, 20)
	reagents.add_reagent(/datum/reagent/blood, 160,
		list("donor" = null,
			"viruses" = null,
			"blood_DNA" = null,
			"blood_type" = random_human_blood_type(),
			"resistances" = null,
			"trace_chem" = null))
	update_appearance()

/obj/item/reagent_containers/blood/cokepack
	name = "\improper elite blood pack (full)"
	blood_type = null

/obj/item/reagent_containers/blood/cokepack/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/drug/methamphetamine, 15)
	reagents.add_reagent(/datum/reagent/blood, 185,
		list("donor" = null,
			"viruses" = null,
			"blood_DNA" = null,
			"blood_type" = random_human_blood_type(),
			"resistances" = null,
			"trace_chem" = null))
	update_appearance()

/obj/item/reagent_containers/blood/morphpack
	name = "\improper elite blood pack (full)"
	blood_type = null

/obj/item/reagent_containers/blood/morphpack/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/toxin/chloralhydrate, 10)
	reagents.add_reagent(/datum/reagent/medicine/morphine, 10)
	reagents.add_reagent(/datum/reagent/blood, 180,
		list("donor" = null,
			"viruses" = null,
			"blood_DNA" = null,
			"blood_type" = random_human_blood_type(),
			"resistances" = null,
			"trace_chem" = null))
	update_appearance()

/obj/item/reagent_containers/blood/methpack
	name = "\improper elite blood pack (full)"
	blood_type = null

/obj/item/reagent_containers/blood/methpack/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/drug/methamphetamine, 15)
	reagents.add_reagent(/datum/reagent/blood, 185,
		list("donor" = null,
			"viruses" = null,
			"blood_DNA" = null,
			"blood_type" = random_human_blood_type(),
			"resistances" = null,
			"trace_chem" = null))
	update_appearance()
