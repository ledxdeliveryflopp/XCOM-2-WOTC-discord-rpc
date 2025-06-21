	class RPCContentInfo extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>

static event OnLoadedSavedGame()
{
	`LOG("Load RPC from Save",, 'RPC-ADDITINAL-INFO');
}


static event OnPostTemplatesCreated()
{
	`LOG("RPC INITED",, 'RPC-ADDITINAL-INFO');
}


/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}


/// <summary>
/// Called after HeadquartersAlien builds a Facility
/// </summary>
static event OnPostAlienFacilityCreated(XComGameState NewGameState, StateObjectReference MissionRef)
{
	`LOG("Aliens build Facility:",, 'RPC-ALIEN-INFO');
}


/// <summary>
/// Called just before the player launches into a tactical a mission while this DLC / Mod is installed.
/// Allows dlcs/mods to modify the start state before launching into the mission
/// </summary>
static event OnPreMission(XComGameState StartGameState, XComGameState_MissionSite MissionState)
{

    `LOG("------------------------------On-Pre-Mission-Start------------------------------",, 'RPC-MISSION-INFO');
	`LOG("------------------------------Base-INFO-----------------------------------------",, 'RPC-MISSION-INFO');
	`LOG("Op source:" @ MissionState.Source,, 'RPC-MISSION-INFO');
	`LOG("OpName:" @ MissionState.GeneratedMission.BattleOpName,, 'RPC-MISSION-INFO');
	`LOG("Op description:" @ MissionState.GeneratedMission.BattleDesc,, 'RPC-MISSION-INFO');
	`LOG("------------------------------Sitrep-INFO-----------------------------------------",, 'RPC-MISSION-INFO');
	`LOG("Sitrep list len:" @ String(MissionState.GeneratedMission.SitReps.Length),, 'RPC-MISSION-INFO');
	if (MissionState.GeneratedMission.SitReps.Length == 1){
		`LOG("Sitreps list 1:" @ MissionState.GeneratedMission.SitReps[0],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.SitReps.Length == 2){
		`LOG("Sitreps list 1:" @ MissionState.GeneratedMission.SitReps[0],, 'RPC-MISSION-INFO');
		`LOG("Sitreps list 2:" @ MissionState.GeneratedMission.SitReps[1],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.SitReps.Length == 3){
		`LOG("Sitreps list 1:" @ MissionState.GeneratedMission.SitReps[0],, 'RPC-MISSION-INFO');
		`LOG("Sitreps list 2:" @ MissionState.GeneratedMission.SitReps[1],, 'RPC-MISSION-INFO');
		`LOG("Sitreps list 3:" @ MissionState.GeneratedMission.SitReps[2],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.SitReps.Length == 4){
		`LOG("Sitreps list 1:" @ MissionState.GeneratedMission.SitReps[0],, 'RPC-MISSION-INFO');
		`LOG("Sitreps list 2:" @ MissionState.GeneratedMission.SitReps[1],, 'RPC-MISSION-INFO');
		`LOG("Sitreps list 3:" @ MissionState.GeneratedMission.SitReps[2],, 'RPC-MISSION-INFO');
		`LOG("Sitreps list 3:" @ MissionState.GeneratedMission.SitReps[3],, 'RPC-MISSION-INFO');
	}
	`LOG("------------------------------MISSION-CORE-INFO---------------------------------",, 'RPC-MISSION-INFO');
    `LOG("Core OP mission type:" @ MissionState.GeneratedMission.Mission.MissionName,, 'RPC-MISSION-INFO');
	`LOG("Core OP MapNames len:" @ String(MissionState.GeneratedMission.Mission.MapNames.Length),, 'RPC-MISSION-INFO');
	if (MissionState.GeneratedMission.Mission.MapNames.Length == 1){
		`LOG("Core OP MapNames 1:" @ MissionState.GeneratedMission.Mission.MapNames[0],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Mission.MapNames.Length == 2){
		`LOG("Core OP MapNames 1:" @ MissionState.GeneratedMission.Mission.MapNames[0],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 2:" @ MissionState.GeneratedMission.Mission.MapNames[1],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Mission.MapNames.Length == 3){
		`LOG("Core OP MapNames 1:" @ MissionState.GeneratedMission.Mission.MapNames[0],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 2:" @ MissionState.GeneratedMission.Mission.MapNames[1],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 3:" @ MissionState.GeneratedMission.Mission.MapNames[2],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Mission.MapNames.Length == 4){
		`LOG("Core OP MapNames 1:" @ MissionState.GeneratedMission.Mission.MapNames[0],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 2:" @ MissionState.GeneratedMission.Mission.MapNames[1],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 3:" @ MissionState.GeneratedMission.Mission.MapNames[2],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 4:" @ MissionState.GeneratedMission.Mission.MapNames[3],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Mission.MapNames.Length == 5){
		`LOG("Core OP MapNames 1:" @ MissionState.GeneratedMission.Mission.MapNames[0],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 2:" @ MissionState.GeneratedMission.Mission.MapNames[1],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 3:" @ MissionState.GeneratedMission.Mission.MapNames[2],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 4:" @ MissionState.GeneratedMission.Mission.MapNames[3],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 5:" @ MissionState.GeneratedMission.Mission.MapNames[4],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Mission.MapNames.Length == 6){
		`LOG("Core OP MapNames 1:" @ MissionState.GeneratedMission.Mission.MapNames[0],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 2:" @ MissionState.GeneratedMission.Mission.MapNames[1],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 3:" @ MissionState.GeneratedMission.Mission.MapNames[2],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 4:" @ MissionState.GeneratedMission.Mission.MapNames[3],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 5:" @ MissionState.GeneratedMission.Mission.MapNames[4],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 6:" @ MissionState.GeneratedMission.Mission.MapNames[5],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Mission.MapNames.Length == 7){
		`LOG("Core OP MapNames 1:" @ MissionState.GeneratedMission.Mission.MapNames[0],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 2:" @ MissionState.GeneratedMission.Mission.MapNames[1],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 3:" @ MissionState.GeneratedMission.Mission.MapNames[2],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 4:" @ MissionState.GeneratedMission.Mission.MapNames[3],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 5:" @ MissionState.GeneratedMission.Mission.MapNames[4],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 6:" @ MissionState.GeneratedMission.Mission.MapNames[5],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 7:" @ MissionState.GeneratedMission.Mission.MapNames[6],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Mission.MapNames.Length == 8){
		`LOG("Core OP MapNames 1:" @ MissionState.GeneratedMission.Mission.MapNames[0],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 2:" @ MissionState.GeneratedMission.Mission.MapNames[1],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 3:" @ MissionState.GeneratedMission.Mission.MapNames[2],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 4:" @ MissionState.GeneratedMission.Mission.MapNames[3],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 5:" @ MissionState.GeneratedMission.Mission.MapNames[4],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 6:" @ MissionState.GeneratedMission.Mission.MapNames[5],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 7:" @ MissionState.GeneratedMission.Mission.MapNames[6],, 'RPC-MISSION-INFO');
		`LOG("Core OP MapNames 8:" @ MissionState.GeneratedMission.Mission.MapNames[7],, 'RPC-MISSION-INFO');
	}
	`LOG("Core OP spawn tag:" @ MissionState.GeneratedMission.Mission.SpawnTag,, 'RPC-MISSION-INFO');
	`LOG("------------------------------MAP-CORE-INFO---------------------------------",, 'RPC-MISSION-INFO');
	`LOG("PlotName:" @ MissionState.GeneratedMission.Plot.MapName,, 'RPC-MISSION-INFO');
	`LOG("------------------------------MAP-OBJECTIVE-INFO---------------------------------",, 'RPC-MISSION-INFO');
	`LOG("Plot objective len:" @ String(MissionState.GeneratedMission.Plot.ObjectiveTags.Length),, 'RPC-MISSION-INFO');
	if (MissionState.GeneratedMission.Plot.ObjectiveTags.Length == 1){
		`LOG("Plot objective 1:" @ MissionState.GeneratedMission.Plot.ObjectiveTags[0],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Plot.ObjectiveTags.Length == 2){
		`LOG("Plot objective 1:" @ MissionState.GeneratedMission.Plot.ObjectiveTags[0],, 'RPC-MISSION-INFO');
		`LOG("Plot objective 2:" @ MissionState.GeneratedMission.Plot.ObjectiveTags[1],, 'RPC-MISSION-INFO');
	} else if (MissionState.GeneratedMission.Plot.ObjectiveTags.Length == 3){
		`LOG("Plot objective 1:" @ MissionState.GeneratedMission.Plot.ObjectiveTags[0],, 'RPC-MISSION-INFO');
		`LOG("Plot objective 2:" @ MissionState.GeneratedMission.Plot.ObjectiveTags[1],, 'RPC-MISSION-INFO');
		`LOG("Plot objective 3:" @ MissionState.GeneratedMission.Plot.ObjectiveTags[2],, 'RPC-MISSION-INFO');
	}
	`LOG("------------------------------MISSION-ADDITIONAL-INFO---------------------------------",, 'RPC-MISSION-INFO');
	`LOG("Mission Quest Item Template:" @ MissionState.GeneratedMission.MissionQuestItemTemplate,, 'RPC-MISSION-INFO');
	`LOG("------------------------------On-Pre-Mission-END--------------------------------",, 'RPC-MISSION-INFO');
}


/// <summary>
/// Called when the player completes a mission while this DLC / Mod is installed.
/// </summary>
static event OnPostMission()
{
	`LOG("------------------------------On-Post-Mission-END------------------------------",, 'RPC-MISSION-INFO');
}