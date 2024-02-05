public exec function StandardBehavePortArms()
{
    local BioPawn ChkPawn;
    
    ChkPawn = BioPawn(Outer.Pawn);
    if (bManualPortArms)
    {
        bManualPortArms = FALSE;
        ChkPawn.PortArmsPlayerInterval = 0.100000001;
        ChkPawn.PortArmsTimer = ChkPawn.PortArmsPlayerInterval;
        ChkPawn.bInPortArms = FALSE;
        ChkPawn.bPlayingPortArmsAnim = FALSE;
        ClearTimer('TriggerPortArms');
    }
}