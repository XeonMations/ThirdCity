/datum/job_config_type/allowed_splats
	name = "Allowed Splats"
	datum_var_name = "allowed_splats"

/datum/job_config_type/allowed_splats/validate_value(value)
	if(islist(value))
		return TRUE
	return FALSE


/datum/job_config_type/splat_slots
	name = "Splat Slots"
	datum_var_name = "splat_slots"

/datum/job_config_type/splat_slots/validate_value(value)
	if(islist(value))
		return TRUE
	return FALSE


/datum/job_config_type/minimal_generation
	name = "Minimal Generation"
	datum_var_name = "minimal_generation"

/datum/job_config_type/minimal_generation/validate_value(value)
	if(isnum(value))
		return TRUE
	return FALSE


/datum/job_config_type/minimum_masquerade
	name = "Minimal Generation"
	datum_var_name = "minimum_masquerade"

/datum/job_config_type/minimum_masquerade/validate_value(value)
	if(isnum(value))
		return TRUE
	return FALSE


/datum/job_config_type/minimum_immortal_age
	name = "Minimum Immortal Age"
	datum_var_name = "minimum_immortal_age"

/datum/job_config_type/minimum_immortal_age/validate_value(value)
	if(isnum(value))
		return TRUE
	return FALSE


/datum/job_config_type/maximum_immortal_age
	name = "Maximum Immortal Age"
	datum_var_name = "maximum_immortal_age"

/datum/job_config_type/maximum_immortal_age/validate_value(value)
	if(isnum(value))
		return TRUE
	return FALSE


/datum/job_config_type/whitelisted
	name = "Whitelisted"
	datum_var_name = "whitelisted"

/datum/job_config_type/whitelisted/validate_value(value)
	if((value == FALSE) || (value == TRUE))
		return TRUE
	return FALSE


/*
	///List of splats that are allowed to do this job.
	var/list/allowed_splats
	///List of species that are limited to a certain amount of that species doing this job. e.g: list(SPLAT_NONE = -1, SPLAT_GHOUL = -1, SPLAT_KINDRED = -1)
	var/list/splat_slots

	// VTM
	///Minimum vampire Generation necessary to do this job.
	var/minimal_generation = HIGHEST_GENERATION_LIMIT
	///Minimum Masquerade level necessary to do this job.
	var/minimum_masquerade = 0
	/// Character must be at least this age (in years) since embrace (chronological_age - age) to join as role.
	var/minimum_immortal_age = 0
	/// Character must not be over this age (in years) since embrace (chronological_age - age) to join as role. (Defaults null, set to desired age.)
	var/maximum_immortal_age = null
	///List of Clans that are allowed to do this job.
	var/list/allowed_clans
	///List of Clans that are disallowed to do this job.
	var/list/disallowed_clans

	// WTA
	///Minimum Renown Rank necessary to do this job.
	var/minimal_renown_rank
	///List of Tribes that are allowed to do this job.
	var/list/allowed_tribes
	var/list/disallowed_tribes
	///List of Auspices that are allowed to do this job.
	var/list/allowed_auspice
	var/list/disallowed_auspice


	///If this job requires whitelisting before it can be selected for characters.
	var/whitelisted = FALSE
	// Only for display in memories
	var/list/known_contacts = null

	///Guestbook flags, to establish who knowns who etc
	var/guestbook_flags = NONE
*/
