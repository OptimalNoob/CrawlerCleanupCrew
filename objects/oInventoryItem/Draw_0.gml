self.sprite_index = item_data.item_sprite;
self.image_index = item_data.item_sprite_frame;
var pad = 2;
if(self.selected) {
	draw_set_color(c_green);
	draw_rectangle(x + pad, y + pad, x + (sprite_width - 1) - pad, y + sprite_height - pad - 1, true);
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
	if(self.selected) draw_set_color(c_green);
	else draw_set_color(c_orange);
	draw_rectangle(x + pad, y + pad, x + (sprite_width - 1) - pad, y + sprite_height - pad - 1, true);
	draw_set_color(c_white);
}