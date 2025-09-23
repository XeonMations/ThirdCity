/**
 * This type is used to indicate a lack of a job.
 * The mind variable assigned_role will point here by default.
 * As any other job datum, this is a singleton.
 **/

/datum/job/vampire/unassigned
	title = "Ordinary Citizen"
	rpg_title = "Peasant"
	paycheck = PAYCHECK_ZERO

/datum/outfit/job/vampire
	uniform = /obj/item/clothing/under/color/grey
	id = null
	ears = null
	belt = null
	back = /obj/item/storage/backpack
	shoes = /obj/item/clothing/shoes/sneakers/black
	box = null
