public final exec function SquadCommand_Move1()
{
    local bool bSuccess;
    
    bSuccess = Outer.QuickCommandMoveTo(1);
    MassEffectGuiManager(Outer.GetScaleFormManager()).ForceSquadCommandFeedback(2, 1, bSuccess);
}