public exec function SwitchToBackup()
{
    if ((Outer.Pawn == None || Outer.Pawn.Weapon == None) || SFXWeapon(Outer.Pawn.Weapon) == None)
    {
        return;
    }
    if (SFXWeapon(Outer.Pawn.Weapon).OutOfAmmo() == FALSE)
    {
        return;
    }
    if (SFXGame(Outer.WorldInfo.Game).gameconfig.bOutOfAmmoWeaponSwap == FALSE)
    {
        return;
    }
    SFXPawn_Player(Outer.Pawn).SwitchToBackupWeapon();
    if (bManualPortArms == TRUE)
    {
        TogglePortArms();
    }
}