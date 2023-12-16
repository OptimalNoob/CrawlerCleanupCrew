var ui_anchx = oLootMenu.x - oLootMenu.sprite_width;
var ui_anchy = oLootMenu.y - oLootMenu.sprite_height / 2;
self.sprite_index = item_data.item_sprite;
self.image_index = item_data.item_sprite_frame;
var pad = 2;
if(self.selected) {
	draw_set_color(c_green);
	draw_rectangle(x + pad, y + pad, x + (sprite_width - 1) - pad, y + (sprite_height - 1) - pad, true);
	draw_set_color(c_white);
}

switch(item_data.item_rarity) {
	case ItemRarity.COMMON:
		image_blend = make_color_hsv(0, 0, 255);
		break;
	case ItemRarity.UNCOMMON:
		image_blend = make_color_hsv(76, 255, 255);
		break;
	case ItemRarity.MAGIC:
		image_blend = make_color_hsv(136, 255, 255);
		break;
	case ItemRarity.RARE:
		image_blend = make_color_hsv(192, 255, 255);
		break;
	case ItemRarity.LEGENDARY:
		image_blend = make_color_hsv(32, 255, 255)
		break;
	default:
		image_blend = make_color_hsv(0, 0, 255);
		break;
}

draw_self();
if(self.hovered) {
	draw_set_color(c_orange);
	draw_rectangle(x + pad, y + pad, x + (sprite_width - 1) - pad, y + (sprite_height - 1) - pad, true);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(ui_anchx + 38, ui_anchy + 38, item_data.item_name);
}