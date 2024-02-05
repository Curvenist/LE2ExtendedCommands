public final exec function SquadCommand_Attack()
{
    local bool bSuccess;
    
    bSuccess = Outer.QuickCommandAttackTarget();
    MassEffectGuiManager(Outer.GetScaleFormManager()).ForceSquadCommandFeedback(1, 0, bSuccess);
}