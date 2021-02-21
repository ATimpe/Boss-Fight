/// @desc Movement

y = y_limit * sin(y_sin) + y_base;
y_sin += y_spd;

if (y_sin >= 2 * pi) {
	y_sin -= 2 * pi;
}

// Bullet Collision

if (place_meeting(x, y, obj_bullet)) {
	cur_hp -= 4;
	instance_destroy(instance_place(x, y, obj_bullet));
}

// Boss Defeat

if (cur_hp <= 0) {
	room_goto(rm_win);
}