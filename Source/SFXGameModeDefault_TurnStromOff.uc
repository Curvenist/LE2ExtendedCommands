public function TurnStormOff()
{
    Outer.bWantsToStorm = 0;
    if (bManualPortArms == TRUE)
    {
        TogglePortArms();
    }
}