public exec function UseAbility(int Ability)
{
    MassEffectGuiManager(Outer.GetScaleFormManager()).m_oSFPowerWheelHandler.doHotKey(Ability);
}