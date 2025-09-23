/**
 * =======================
 * WARNING WARNING WARNING
 * WARNING WARNING WARNING
 * WARNING WARNING WARNING
 * =======================
 * These names are used as keys in many locations in the database
 * you cannot change them trivially without breaking job bans and
 * role time tracking, if you do this and get it wrong you will die
 * and it will hurt the entire time
 */

//No department
#define JOB_CITIZEN "Citizen"

#define JOB_DISPLAY_ORDER_CITIZEN 1

#define DEPARTMENT_BITFLAG_CITIZEN (1<<0)
#define DEPARTMENT_CITIZEN "Citizen"

DEFINE_BITFIELD(departments_bitflags, list(
	"CITIZEN" = DEPARTMENT_BITFLAG_CITIZEN,
))

/// Combination flag for jobs which are considered regular crew members of the station.
#define CITY_JOB_FLAGS (JOB_CREW_MANIFEST|JOB_EQUIP_RANK|JOB_CREW_MEMBER|JOB_NEW_PLAYER_JOINABLE|JOB_REOPEN_ON_ROUNDSTART_LOSS|JOB_ASSIGN_QUIRKS)

#define FACTION_CITY "City"
#define FACTION_TREMERE VAMPIRE_CLAN_TREMERE

// Variable macros used to declare who is the supervisor for a given job, announced to the player when they join as any given job.
#define SUPERVISOR_PRINCE "the Prince"


