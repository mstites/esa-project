# Notes Document
## Calibration
1. Place robot flat on ground
2. Load code
3. Monitor serial monitor
4. Hold robot upright in the air as if it were balancing
5. Record the value on the screen - this value corresponds to a constant offset of the angle measurement (this value will be subtracted out of angle measurement in actual code by replacing the 0.25)

Angle Measurement = -0.27

## Natural frequency
1. Remove wheels
2. Place robot on ground
3. Load code
4. Hold robot by axles
5. Swing robot freely from left to right
6. Copy and paste the angle measurements into matlab
7. Compute the effective length

Period:
1. 1356.5 ms
2. 1385 ms
3. 1355 ms
Avg: 1365.5 ms -> 1.366 seconds
.732 Hz
4.6 rad/s
Length = .463m
