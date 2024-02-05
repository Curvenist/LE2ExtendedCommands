public function bool SwitchToBackupWeapon(optional SFXWeapon PreferredWeapon = None)
{
    local SFXInventoryManager InventoryManager;
    local SFXWeapon BestWeapon;
    local SFXWeapon Weap;
    local BioPlayerController PC;
    local BioPlayerInput BPInput;
    
    if ((Weapon == None || Weapon.IsInState('WeaponEquipping', )) || Weapon.IsInState('WeaponPuttingDown', ))
    {
        return FALSE;
    }
    PC = BioPlayerController(Controller);
    if (PC != None)
    {
        BPInput = BioPlayerInput(PC.PlayerInput);
        if (BPInput == None)
        {
            return FALSE;
        }
    }
    if (IsPerformingBlockingAction())
    {
        return FALSE;
    }
    if (IsInCoverLeaning())
    {
        return FALSE;
    }
    if (ActionState != EActionState.ActionState_Combat)
    {
        SetCombatState_Active();
    }
    InventoryManager = SFXInventoryManager(InvManager);
    foreach InventoryManager.InventoryActors(Class'SFXWeapon', Weap)
    {
        if (Weap == Weapon)
        {
            continue;
        }
        if (PreferredWeapon != None && Weap == PreferredWeapon)
        {
            BestWeapon = Weap;
            break;
        }
        if (Weap.OutOfAmmo() || Weap.SwitchPriority <= 0)
        {
            continue;
        }
        if (BestWeapon == None)
        {
            BestWeapon = Weap;
        }
        else if (BestWeapon.SwitchPriority < Weap.SwitchPriority)
        {
            BestWeapon = Weap;
        }
    }
    if (BestWeapon != None)
    {
        BioPlayerController(Controller).SetZoomed(FALSE);
        BioPlayerController(Controller).OrderWeaponSwitch(Self, BestWeapon);
        return TRUE;
    }
    return FALSE;
}