# Robophysics Bootcamp – Snake Robot Simulation

This project simulates and controls a 4-link snake-like robot using MATLAB and Arduino. Developed during the Robophysics Bootcamp, the robot uses a traveling wave gait to achieve snake-like motion under Coulomb friction.

![Snake Robot Setup](Picture1.png)

## 🧠 Features

- MATLAB simulation of multi-link swimmer with joint kinematics
- Coulomb friction modeling for realistic ground interaction
- Arduino control of servo motors to implement traveling wave gait
- Exportable simulation videos

## 🛠️ Technologies

- MATLAB (kinematics, friction modeling)
- Arduino Uno R3
- Servo motors (SG90 or similar)
- Video export and trajectory visualization

## 📂 Structure

- `matlab/`: All MATLAB simulation scripts
- `arduino/`: Arduino gait controller code
- `media/`: Output video and plots

## 🧪 Getting Started

1. Run `main_simulation_coulomb.m` to simulate robot motion
2. Upload `snake_gait.ino` to Arduino with 4 servos connected
3. Observe snake-like traveling wave movement

## 🧾 License

MIT License
