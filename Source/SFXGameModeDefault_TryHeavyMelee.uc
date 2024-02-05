public exec function TryHeavyMelee()
{
    local SFXWeapon Weapon;
    local BioPlayerInput Input;
    
    if (((Outer.Pawn != None && Outer.Pawn.Weapon != None) && Outer.IsZoomed() == FALSE) && Outer.IsInCoverState() == FALSE)
    {
        Input = BioPlayerInput(Outer.PlayerInput);
        if (Input != None)
        {
            Weapon = SFXWeapon(Outer.Pawn.Weapon);
            if (Weapon != None)
            {
                Weapon.CancelReload();
                if ((Weapon.MeleePowerName != 'None' && Weapon.IsInState('WeaponEquipping', ) == FALSE) && Weapon.IsInState('WeaponPuttingDown', ) == FALSE)
                {
                    Input.ActivatePower('HeavyPunch');
                    Outer.HintSystem.HintEvent('Melee', Weapon.MeleePowerName);
                }
            }
        }
    }
    if (bManualPortArms == TRUE)
    {
        TogglePortArms();
    }
}