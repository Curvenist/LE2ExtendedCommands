public exec function TogglePortArms()
{
    local BioPawn ChkPawn;
    
    ChkPawn = BioPawn(Outer.Pawn);
    ClearTimer('TriggerPortArms');
    TriggerPortArms();
}
