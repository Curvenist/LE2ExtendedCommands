public exec function FireWeapon()
{
    local BioPawn ChkPawn;
    
    ChkPawn = BioPawn(Outer.Pawn);
    if (ChkPawn != None)
    {
        if (ChkPawn.ActionState != EActionState.ActionState_Combat)
        {
            ChkPawn.m_oBehavior.SetActionState(1);
        }
        if (ChkPawn.IsUsingPower())
        {
            BioActivePower(ChkPawn.m_oBehavior.m_oCurrentModalActive).ClearPreviousCoverAction();
        }
    }
    Outer.bFire = 1;
}