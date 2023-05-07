createcommander(team) {
    planner_commander = plannerutility::createplannerfromasset("mp_tdm_commander.ai_htn");
    planner_squad = plannerutility::createplannerfromasset("mp_tdm_squad.ai_htn");

	commander = plannercommanderutility::createcommander(
        team, 
        planner_commander, 
        planner_squad
    );
	plannergenericcommander::commanderdaemons(commander);
	plannercommanderutility::addsquadevaluator(commander, "commanderScoreBotPresence");
	plannercommanderutility::addsquadevaluator(commander, "commanderScoreForceGoal");
	plannercommanderutility::addsquadevaluator(commander, "commanderScoreTeam");
	plannercommanderutility::addsquadevaluator(commander, "commanderScoreAge", [#"maxage":15000]);
	plannercommanderutility::addsquadevaluator(commander, "commanderScoreAlive");
	return commander;
}

init_bot_commanders() {
    if (!isdefined(level.teams)) {
        return;
    }
    foreach(team in level.teams) {
        createcommander(team);
    }
}
