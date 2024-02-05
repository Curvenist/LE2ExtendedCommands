public exec function TryReload()
{
    local SFXWeapon Weapon;
    local BioPawn ChkPawn;
    
    ChkPawn = BioPawn(Outer.Pawn);
    if (ChkPawn != None && ChkPawn.ActionState != EActionState.ActionState_Combat)
    {
        ChkPawn.m_oBehavior.SetActionState(1);
        if (bManualPortArms == TRUE)
        {
            TogglePortArms();
        }
        return;
    }
    if (Outer.Pawn != None)
    {
        Weapon = SFXWeapon(Outer.Pawn.Weapon);
        if (Weapon != None && Weapon.CanReload())
        {
            Weapon.TryReload();
        }
    }
    if (bManualPortArms == TRUE)
    {
        TogglePortArms();
    }
}