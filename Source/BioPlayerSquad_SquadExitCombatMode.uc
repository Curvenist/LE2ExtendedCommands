public function SquadExitCombatMode()
{
    local BioAiController oMember;
    local BioPawn oMemberPawn;
    local SFXGame GameInfo;
    
    GameInfo = SFXGame(WorldInfo.Game);
    if (GameInfo != None && (GameInfo.bInCombat || GameInfo.bForceCombat))
    {
        return;
    }        
    foreach SquadMembers(oMember)
    {
        oMemberPawn = BioPawn(oMember.Pawn);
        if (oMemberPawn != None)
        {
            oMemberPawn.ShouldCrouch(FALSE);
            SFXGame(WorldInfo.Game).TriggerVocalizationEvent(30, oMemberPawn, None);
            oMember.ExploreMode(FRand());
        }
    }
    m_bEngagedHostileAction = FALSE;
}