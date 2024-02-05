public exec function StormOn()
{
    local bool bCanStorm;
    local ECoverAction CoverAction;
    
    if (Outer.RemappedJoyUp > 0.0)
    {
        bCanStorm = TRUE;
        if (Outer.IsInCoverState())
        {
            CoverAction = BioPawn(Outer.Pawn).CoverAction;
            if (((CoverAction != ECoverAction.CA_LeanLeft && CoverAction != ECoverAction.CA_LeanRight) && CoverAction != ECoverAction.CA_PeekLeft) && CoverAction != ECoverAction.CA_PeekRight)
            {
                bCanStorm = FALSE;
            }
            if (bCanStorm)
            {
                Outer.BreakFromCover();
            }
        }
        if (bCanStorm)
        {
            Outer.bWantsToStorm = 1;
            ClearTimer('TurnStormOff');
            if (bManualPortArms == TRUE)
            {
                PortArmsDown();
            }
            Outer.GenerateTutorialEvent(5);
        }
    }
}