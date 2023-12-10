inpLeft = keyboard_check(ord("A")) || keyboard_check(vk_left);
inpRight = keyboard_check(ord("D")) || keyboard_check(vk_right);
inpUp = keyboard_check(ord("W")) || keyboard_check(vk_up);
inpDown = keyboard_check(ord("S")) || keyboard_check(vk_down);

move_x = inpRight - inpLeft;
move_y = inpDown - inpUp;

xspeed = move_x * walkspeed;
yspeed = move_y * walkspeed;

x += xspeed;
y += yspeed;