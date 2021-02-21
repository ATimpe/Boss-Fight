/// @desc Starting Vars

steps_per_shot = 60;
steps_per_laser = 90;
y_spd = (pi / 2) / steps_per_shot;
y_sin = 0;
y_limit = 32;
y_base = y;

cur_hp = 100;

alarm_set(0, steps_per_shot);
alarm_set(1, steps_per_laser);