public exec function PortArmsDown()
{
    local BioPawn ChkPawn;
    
    ChkPawn = BioPawn(Outer.Pawn);
    if (bManualPortArms)
    {
        ChkPawn.bInPortArms = FALSE;
        ChkPawn.bPlayingPortArmsAnim = FALSE;
        ClearTimer('TriggerPortArms');
    }
}