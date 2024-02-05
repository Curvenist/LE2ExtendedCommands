public exec function PrevWeapon()
{
    local SFXWeapon Weapon;
    local BioPawn ChkPawn;
    
    ChkPawn = BioPawn(Outer.Pawn);
    if (ChkPawn != None && ChkPawn.ActionState != EActionState.ActionState_Combat)
    {
        BioPawn(Outer.Pawn).m_oBehavior.SetActionState(1);
        if (bManualPortArms == TRUE)
        {
            TogglePortArms();
        }
        return;
    }
    Weapon = SFXWeapon(Outer.Pawn.Weapon);
    if (Weapon != None)
    {
        if (Weapon.IsInState('WeaponEquipping', ) || Weapon.IsInState('WeaponPuttingDown', ))
        {
            if (bManualPortArms)
            {
                TogglePortArms();
            }
            return;
        }
        if ((Outer.Pawn.InvManager != None && ChkPawn != None) && ChkPawn.IsInCoverLeaning() == FALSE)
        {
            Outer.Pawn.InvManager.PrevWeapon();
            if (bManualPortArms == TRUE)
            {
                TogglePortArms();
            }
        }
    }
}