public final exec function SquadCommand_Follow()
{
    local bool bSuccess;
    
    bSuccess = Outer.QuickCommandFollowPlayer();
    MassEffectGuiManager(Outer.GetScaleFormManager()).ForceSquadCommandFeedback(3, 0, bSuccess);
}