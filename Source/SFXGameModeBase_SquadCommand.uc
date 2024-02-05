public final exec function SquadCommand_Move2()
{
    local bool bSuccess;
    
    bSuccess = Outer.QuickCommandMoveTo(2);
    MassEffectGuiManager(Outer.GetScaleFormManager()).ForceSquadCommandFeedback(2, 2, bSuccess);
}