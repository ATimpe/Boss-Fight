/// @desc Movement & Collision

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(ord("Z"));
key_shoot = keyboard_check(ord("X"));

var move = key_right - key_left;

hsp = move * walksp;

vsp += grv;

if (place_meeting(x, y + 1, obj_platform) && (key_jump)) {
	vsp = -jump_height;
}

// Direction Change

if (keyboard_check_pressed(vk_left)) {
	cur_dir = -1;
}

if (keyboard_check_pressed(vk_right)) {
	cur_dir = 1;
}

// Shooting Gun

if (key_shoot && can_shoot) {
	instance_create_depth(x, y, 0, obj_bullet);
	alarm_set(0, gun_cooldown);
	can_shoot = false;
}

// Horizontal collision
if (place_meeting(x + hsp, y, obj_platform)) {
	while (!place_meeting(x + sign(hsp), y, obj_platform)) {
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

//Vetrical Collision
if (place_meeting(x, y + vsp, obj_platform)) {
	while (!place_meeting(x, y + sign(vsp), obj_platform)) {
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

//Scrolling With Platform

if (place_meeting(x, y + 1, obj_platform)) {
	x -= 1.3;
}

if (place_meeting(x + 1, y, obj_platform)) {
	x -= 1.3;
}







// Death Through enemy laser
if (place_meeting(x, y, obj_laser)) {
	room_goto(rm_gameover);
}

// Death through fall
if (y > 256) {
	room_goto(rm_gameover);
}