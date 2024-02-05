public exec function bool TryExitCover(bool bForceExit)
{
    local float MoveStickMag;
    local float MoveStickAngle;
    local Rotator MoveStickRot;
    local bool bCanStormOut;
    local ECoverAction CoverAction;
    
    Outer.ComputeMovementStickAngle(MoveStickMag, MoveStickAngle, MoveStickRot);
    bCanStormOut = TRUE;
    CoverAction = BioPawn(Outer.Pawn).CoverAction;
    if (((CoverAction != ECoverAction.CA_LeanLeft && CoverAction != ECoverAction.CA_LeanRight) && CoverAction != ECoverAction.CA_PeekLeft) && CoverAction != ECoverAction.CA_PeekRight)
    {
        bCanStormOut = FALSE;
    }
    if (Outer.IsInCoverState() && (bForceExit || MoveStickMag > 0.0 && bCanStormOut))
    {
        SFXWeapon(Outer.Pawn.Weapon).CancelReload();
        Outer.BreakFromCover();
        if (Outer.IsCameraAlignedWithCoverSlot())
        {
            Outer.m_bDoCoverExitAccel = bForceExit;
        }
        if (bManualPortArms == TRUE)
        {
            TogglePortArms();
        }
        return TRUE;
    }
    return FALSE;
}