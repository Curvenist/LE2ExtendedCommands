public exec function StormOff()
{
    SetTimer(InputDelayStormExit, FALSE, 'TurnStormOff');
    if (bManualPortArms == TRUE)
    {
        TogglePortArms();
    }
}