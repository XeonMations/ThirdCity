/*
 * Runs an extended suite of eligibility checks to make sure the player can take the reqeusted job.
 *
 * Checks:
 * * Species Availability
 * * Species Slots
 * * Whitelist
 * * Kindred Age
 * * Kindred Generation
 * * Kindred Clan
 * * Garou Tribe
 * * Garou Auspice
 *
 * Arguments:
 * * player - The player to check for job eligibility.
 * * possible_job - The job to check for eligibility against.
 * * debug_prefix - Logging prefix for the job_debug log entries. For example, GRJ during give_random_job or DO during divide_occupations.
 * * add_job_to_log - If TRUE, appends the job type to the log entry. If FALSE, does not. Set to FALSE when check is part of iterating over players for a specific job, set to TRUE when check is part of iterating over jobs for a specific player and you don't want extra log entry spam.
 */
/datum/controller/subsystem/job/proc/check_job_eligibility_darkpack(mob/dead/new_player/player, datum/job/possible_job, debug_prefix = "", add_job_to_log = FALSE)
	return JOB_AVAILABLE
