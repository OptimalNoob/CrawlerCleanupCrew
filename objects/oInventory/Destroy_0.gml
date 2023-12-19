instance_destroy(oInventoryItem);
window_set_cursor(cr_default);
global.pause = false;
oPlayer.set_state(PlayerState.IDLE);
oPlayer.can_attack = false;
oPlayer.alarm[0] = 1;