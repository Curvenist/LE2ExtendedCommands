public exec function TryUsePower(int Power)
{
    local BioPlayerInput Input;
    local Name PowerName;
    local SFXPawn_Player PlayerPawn;
    local SFXWeapon Weapon;
    local SFXPower oPower;
    
    Input = BioPlayerInput(Outer.PlayerInput);
    if (Input == None)
    {
        return;
    }
    PlayerPawn = SFXPawn_Player(Outer.Pawn);
    if (PlayerPawn != None && PlayerPawn.IsPerformingBlockingAction())
    {
        if (bManualPortArms == TRUE)
        {
            TogglePortArms();
        }
        return;
    }
    Weapon = SFXWeapon(PlayerPawn.Weapon);
    Weapon.CancelReload();
    switch (Power)
    {
        case 0:
            PowerName = Input.m_nmMappedPower;
            break;
        case 1:
            PowerName = Input.m_nmMappedPower2;
            break;
        case 2:
            PowerName = Input.m_nmMappedPower3;
            break;
        default:
    }
    oPower = PlayerPawn.FindPower(PowerName);
    if (oPower != None)
    {
        Outer.SquadOrderUsePower(oPower.PowerName, Outer.Pawn, 0, FALSE);
        Outer.ApplyTacticalOrders();
        Outer.HintSystem.HintEvent('UseMappedPower', oPower.Class.Name);
        Outer.GenerateTutorialEvent(3);
    }
}