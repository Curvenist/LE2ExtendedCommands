public function TurnOffTightAim()
{
    BioPlayerInput(Outer.PlayerInput).bWantsToZoom = 0;
    if (bManualPortArms == TRUE)
    {
        TogglePortArms();
    }
}