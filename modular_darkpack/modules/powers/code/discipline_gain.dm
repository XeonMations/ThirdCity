/**
 * Initialises Disciplines for new vampire mobs, applying effects and creating action buttons.
 *
 * Arguments:
 * * disciplines - list of discipline typepaths being granted
 */
/mob/living/carbon/human/proc/create_disciplines(list/disciplines)
	if(!HAS_TRAIT(src, TRAIT_VTM_DISCIPLINES))
		return

	for(var/discipline_typepath in disciplines)
		var/level = disciplines[discipline_typepath]
		var/datum/discipline/discipline = new discipline_typepath(level)

		// Prevent Disciplines from being used if not whitelisted for them
		if(discipline.clan_restricted)
			if(!can_access_discipline(type_to_create))
				qdel(discipline)
				continue

		give_discipline(discipline)

/**
 * Creates an action button and applies post_gain effects of the given Discipline.
 *
 * Arguments:
 * * discipline - Discipline datum that is being given to this mob.
 */
/mob/living/carbon/human/proc/give_discipline(datum/discipline/discipline)
	if (discipline.level > 0)
		var/datum/action/discipline/action = new(discipline)
		action.Grant(src)
	var/datum/species/human/species = dna.species
	LAZYADD(species.disciplines, discipline)

/**
 * Checks a vampire for whitelist access to a Discipline.
 *
 * Checks the given vampire to see if they have access to a certain Discipline through
 * one of their selectable Clans. This is only necessary for "unique" or Clan-restricted
 * Disciplines, as those have a chance to only be available to a certain Clan that
 * the vampire may or may not be whitelisted for.
 *
 * Arguments:
 * * vampire_checking - The vampire mob being checked for their access.
 * * discipline_checking - The Discipline type that access to is being checked.
 */
/mob/living/carbon/human/proc/can_access_discipline(discipline_checking)
	if(!HAS_TRAIT(src, TRAIT_VTM_DISCIPLINES))
		return FALSE
	if (!client)
		return FALSE

	//make sure it's actually restricted and this check is necessary
	var/datum/discipline/discipline_object_checking = new discipline_checking
	if (!discipline_object_checking.clan_restricted)
		qdel(discipline_object_checking)
		return TRUE
	qdel(discipline_object_checking)

	//first, check their Clan Disciplines to see if that gives them access
	if (clan.clan_disciplines.Find(discipline_checking))
		return TRUE

	//next, go through all Clans to check if they have access to any with the Discipline
	for (var/clan_type in subtypesof(/datum/vampire_clan))
		var/datum/vampire_clan/clan_checking = new clan_type

		//skip this if they can't access it due to whitelists
		// DARKPACK TODO - reimplement whitelisting
		/*
		if (clan_checking.whitelisted)
			if (!SSwhitelists.is_whitelisted(checked_ckey = ckey, checked_whitelist = clan_checking.name))
				qdel(clan_checking)
				continue
		*/

		if (clan_checking.clan_disciplines.Find(discipline_checking))
			qdel(clan_checking)
			return TRUE

		qdel(clan_checking)

	//nothing found
	return FALSE
