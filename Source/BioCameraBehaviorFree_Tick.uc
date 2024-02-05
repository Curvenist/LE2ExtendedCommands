public function Tick(float TimeDelta)
{
    local Rotator rCamRot;
    local Vector vCamDir;
    local int CameraSpeed;
    local float LockAxis;
    
    if (!m_bCameraLocked)
    {
        LockAxis = m_pov.Location.Z;
        if (Owner.PlayerInput.PressedKeys.Find('PageUp') != -1)
        {
            m_fMovementScalar += m_fSIncrement;
            m_fRotationScalar += m_fSIncrement;
        }
        if (Owner.PlayerInput.PressedKeys.Find('PageDown') != -1)
        {
            m_fMovementScalar -= m_fSIncrement;
            m_fRotationScalar -= m_fSIncrement;
        }
        if (Owner.PlayerInput.PressedKeys.Find('Home') != -1)
        {
            m_fMovementScalar += m_fLIncrement;
            m_fRotationScalar += m_fLIncrement;
        }
        if (Owner.PlayerInput.PressedKeys.Find('End') != -1)
        {
            m_fMovementScalar -= m_fLIncrement;
            m_fRotationScalar -= m_fLIncrement;
        }
        if (m_fMovementScalar < 0.0)
        {
            m_fMovementScalar = 0.0;
        }
        if (m_fRotationScalar < 0.0)
        {
            m_fRotationScalar = 0.0;
        }
        if (Owner.PlayerInput.PressedKeys.Find('Delete') != -1)
        {
            m_fMovementScalar = 100.0;
            m_fRotationScalar = 100.0;
            Owner.Rotation.Roll = 0;
        }
        rCamRot = m_pov.Rotation;
        vCamDir = Vector(rCamRot);
        m_pov.Location += ((Owner.PlayerInput.RawJoyUp * vCamDir) * m_fMovementScalar) * TimeDelta;
        rCamRot.Yaw += int(90.0 * 182.044449);
        rCamRot.Pitch += 0;
        vCamDir = Vector(rCamRot);
        m_pov.Location += ((Owner.PlayerInput.RawJoyRight * vCamDir) * m_fMovementScalar) * TimeDelta;
        if (Owner.PlayerInput.PressedKeys.Find('NumPadFour') != -1)
        {
            m_pov.Location.Z = LockAxis;
        }
        if (Owner.PlayerInput.PressedKeys.Find('NumPadSix') != -1)
        {
            m_pov.Location.Z = LockAxis;
        }
        if (Owner.PlayerInput.PressedKeys.Find('NumPadOne') != -1 || Owner.PlayerInput.PressedKeys.Find('Down') != -1)
        {
            m_pov.Location += (vect(0.0, 0.0, -0.699999988) * m_fMovementScalar) * TimeDelta;
        }
        if (Owner.PlayerInput.PressedKeys.Find('NumPadSeven') != -1 || Owner.PlayerInput.PressedKeys.Find('Up') != -1)
        {
            m_pov.Location += (vect(0.0, 0.0, 0.699999988) * m_fMovementScalar) * TimeDelta;
        }
        if (Owner.PlayerInput.PressedKeys.Find('Right') != -1)
        {
            Owner.Rotation.Roll += int((m_fRotationScalar * TimeDelta) * 55.0);
        }
        if (Owner.PlayerInput.PressedKeys.Find('Left') != -1)
        {
            Owner.Rotation.Roll -= int((m_fRotationScalar * TimeDelta) * 55.0);
        }
        m_pov.Rotation = Owner.Rotation;
    }
}