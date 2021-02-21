/// @desc Shoot Laser

instance_create_depth(x - 32, y - 16, 0, obj_laser);
alarm_set(1, steps_per_laser);