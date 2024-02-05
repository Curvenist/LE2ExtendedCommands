public function TriggerPortArms()
{
    local BioPawn ChkPawn;
    
    ChkPawn = BioPawn(Outer.Pawn);
    bManualPortArms = TRUE;
    ChkPawn.bInPortArms = TRUE;
    ChkPawn.bPlayingPortArmsAnim = TRUE;
    ChkPawn.PortArmsTimer = 5.0;
    SetTimer(1.5, TRUE, 'TriggerPortArms');
}