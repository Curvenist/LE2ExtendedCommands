public exec function StopTightAim()
{
    SetTimer(InputDelayTightAimExit, FALSE, 'TurnOffTightAim');
    if (bManualPortArms == TRUE)
    {
        TogglePortArms();
    }
}