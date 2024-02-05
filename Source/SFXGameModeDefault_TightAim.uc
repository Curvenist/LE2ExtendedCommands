public exec function TightAim()
{
    local BioPawn ChkPawn;
    
    PortArmsDown();
    ClearTimer('TurnOffTightAim');
    BioPlayerInput(Outer.PlayerInput).bWantsToZoom = 1;
    Outer.GenerateTutorialEvent(2);
    ChkPawn = BioPawn(Outer.Pawn);
    if (ChkPawn != None)
    {
        ChkPawn.m_oBehavior.SetActionState(1);
        if (ChkPawn.IsUsingPower())
        {
            BioActivePower(ChkPawn.m_oBehavior.m_oCurrentModalActive).ClearPreviousCoverAction();
        }
    }
}