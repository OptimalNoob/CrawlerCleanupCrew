self.image_speed = 0;
self.image_index = 0;

self.xspeed = 0;
self.yspeed = 0;
self.walkspeed = 1;

self.health_max = global.player_health_max;
self.health = global.player_health;

instance_create_layer(x, y, "system", oCamera);