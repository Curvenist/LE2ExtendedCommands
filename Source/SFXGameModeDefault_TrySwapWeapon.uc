public exec function TrySwapWeapon()
{
    local SFXPawn_Player ChkPawn;
    
    ChkPawn = SFXPawn_Player(Outer.Pawn);
    if (ChkPawn != None)
    {
        if (ChkPawn.SwitchToBackupWeapon(SFXWeapon(ChkPawn.WeaponOnDeck)))
        {
            Outer.GenerateTutorialEvent(4);
        }
    }
    if (bManualPortArms == TRUE)
    {
        TogglePortArms();
    }
}