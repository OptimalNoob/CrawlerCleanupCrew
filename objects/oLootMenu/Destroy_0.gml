instance_destroy(oLootMenuObject);
var r = 0;
repeat(array_length(self.buttons)) {
	instance_destroy(buttons[r]);
	r++;
}
window_set_cursor(cr_default);
global.pause = false;
oPlayer.set_state(PlayerState.IDLE);
oPlayer.can_attack = false;
oPlayer.alarm[0] = 1;