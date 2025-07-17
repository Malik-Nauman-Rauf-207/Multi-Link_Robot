#include <Servo.h>

// Constants
const int numJoints = 3;  // 4 servo motors (including head)
const int servoPins[numJoints] = {9,10,11};  // PWM-capable pins
Servo servos[numJoints];

const float amplitudeDeg = 00.0;     // peak angle deviation in degrees (±30°)
const float frequencyHz = 1;       // wave frequency
const float phaseLag = PI / 2;       // phase lag between joints (radians)
const int centerDeg = 90;            // neutral servo position (degrees)

unsigned long lastUpdate = 0;
const unsigned long updateInterval = 20;  // update every 20 ms (~50 Hz)

// Convert radians to degrees
float radToDeg(float radians) {
  return radians * (180.0 / PI);
}

void setup() {
  // Attach each servo to its pin
  for (int i = 0; i < numJoints; i++) {
    servos[i].attach(servoPins[i]);
    servos[i].write(centerDeg);  // start from center
  }
}

void loop() {
  unsigned long now = millis();
  if (now - lastUpdate >= updateInterval) {
    lastUpdate = now;

    // Time in seconds
    float t = now / 1000.0;

    // Update each joint with a traveling sine wave
    for (int i = 0; i < numJoints; i++) {
      float angleOffset = amplitudeDeg * sin(2 * PI * frequencyHz * t + i * phaseLag);
      int servoAngle = constrain(centerDeg + angleOffset, 0, 180);
      servos[i].write(servoAngle);
    }
  }
}
