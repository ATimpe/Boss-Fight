/// @desc Shoot Platforms

instance_create_depth(x, y + 16, 0, obj_platform);
alarm_set(0, steps_per_shot);