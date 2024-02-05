public function CheckEnterCombat()
{
    local BioPlayerController PC;
    local BioPlayerInput Input;
    
    PC = BioPlayerController(Controller);
    if (PC != None)
    {
        Input = BioPlayerInput(PC.PlayerInput);
        if ((Input != None && ActionState != EActionState.ActionState_Combat))
        {
            SetCombatState(TRUE);
        }
    }
}