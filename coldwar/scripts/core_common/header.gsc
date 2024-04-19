#include scripts\core_common\struct;
#include scripts\core_common\array_shared;
#include scripts\core_common\callbacks_shared;
#include scripts\core_common\clientfield_shared;
#include scripts\core_common\system_shared;
#include scripts\core_common\flag_shared;
#include scripts\core_common\values_shared;
#include scripts\core_common\util_shared;
#include scripts\core_common\player\player_stats;
#include scripts\core_common\spawner_shared;

#namespace atianmenu;

function autoexec __init__system__() {
    level.script = util::get_map_name();
    load_cfg();

    switch (hash(level.script)) {
    case #"mp_nuketown6":
        init_mp_nuketown6();
        break;
    }
    system::register(#"atianmenu", &__pre_init__, undefined, undefined, undefined);
    system::ignore(#"cheat");
}

function event_handler[gametype_init] gametype_init(*eventstruct) {
    if (is_zombies()) {
        thread init_gametype_zm();
    }
}

function __pre_init__() {
    callback::on_connect(&on_player_connect);

    __pre_init_zm__();
}

function load_cfg() {
    level.atian = spawnstruct();
    level.atianconfig = spawnstruct();
#ifdef CI
    level.atianconfig AtianMenuConfigContinuousIntegration();
#else
    level.atianconfig AtianMenuConfig();
#ifdef ATIAN_MENU_DEV
    level.atianconfig AtianMenuConfigDev();
#endif
#endif
}

/*
0x7ff761de0000
141bfec05

opcode = *(unsigned __int16 *)opcodebase;

7FFA8518567C
B3ABBFCD

*/

function get_look_trace() {
    tag_origin = self geteye();
    look = AnglesToForward(self GetPlayerAngles());
    return bullettrace(tag_origin, tag_origin + vectorscale(look, 10000), 1, self);
}
function get_look_position() {
    return get_look_trace()[#"position"];
}


function on_player_connect() {
    self.atian = spawnStruct();
    self endon("disconnect", #"bled_out");
    level endon(#"end_game", #"game_ended");

    if (!self ishost()) {
        return;
    }

    // init menu system
    if (!self init_menu("Atian Menu CW")) {
        return;
    }
    
    self.atianconfig = level.atianconfig;

    // init the configuration
    self key_mgr_init();
    self init_menus();


    if (!(isdefined(self.atianconfig_menu_preloaded) && self.atianconfig_menu_preloaded)
        && isdefined(self.atianconfig.preloaded_menus)) {
        for (i = 0; i < self.atianconfig.preloaded_menus.size; i++) {
            preload_menu = strtok(self.atianconfig.preloaded_menus[i], "::");
            if (preload_menu.size == 2) {
                self ClickMenuButton(preload_menu[0], preload_menu[1]);
            }
        }
        self.atianconfig_menu_preloaded = true;
    }

    self thread menu_think();

    // wait some frames to avoid init things
    waitframe(20);

    self childthread fly_mode();
	self childthread infinite_ammo();
    self childthread god_mode();
    self childthread set_camo();
}

function god_mode() {
    while (true) {
        if (self is_mod_activated("maxpoints")) {
            self.score = 99999;

            oldcommon = self.var_595a11bc;
            oldrare = self.var_72d64cfd;
            self.var_595a11bc = 9999; // common savages
            self.var_72d64cfd = 9999; // rare savages

            // update the UI
            if (oldcommon != self.var_595a11bc) {
                self clientfield::set_player_uimodel("hudItems.scrap", self.var_595a11bc);
            }
            if (oldrare != self.var_72d64cfd) {
                self clientfield::set_player_uimodel("hudItems.rareScrap", self.var_72d64cfd);
            }
        }

        if (isdefined(self.tool_invulnerability) && self.tool_invulnerability) {
            self freezeControls(false);
            self enableInvulnerability();
            self.var_f22c83f5 = true;
            self val::set(#"atianmod", "disable_oob", true);
        }
        if (isdefined(self.tool_zmignoreme) && self.tool_zmignoreme) {
            self val::set(#"atianmod", "ignoreme", true);
        }

        waitframe(1);
    }
}

function infinite_ammo() {
    while(true) {
        if (self is_mod_activated("maxammo")) {
            weapon  = self GetCurrentWeapon();
            offhand = self GetCurrentOffhand();
            if(!(!isdefined(weapon) || weapon === level.weaponNone || !isdefined(weapon.clipSize) || weapon.clipSize < 1))
            {
                self SetWeaponAmmoClip(weapon, 1337);
                self givemaxammo(weapon);
                self givemaxammo(offhand);
                self gadgetpowerset(2, 100);
                self gadgetpowerset(1, 100);
                self gadgetpowerset(0, 100);
            }
            if(isdefined(offhand) && offhand !== level.weaponNone) self givemaxammo(offhand);
        }
        self waittill(#"weapon_fired", #"grenade_fire", #"missile_fire", #"weapon_change", #"melee");
        waitframe(1);
    }
}

function fly_mode() {
    self notify(#"stop_player_out_of_playable_area_monitor");
	self unlink();
    if(isdefined(self.originObj)) self.originObj delete();
    ts = 0;
	while(true) {
		if(self is_mod_activated("fly")) {
			
			self.originObj = spawn("script_origin", self.origin, 1);
    		self.originObj.angles = self.angles;
			self PlayerLinkTo(self.originObj, undefined);
			if (!isdefined(self.atian.no_force_enable_weapon) || !self.atian.no_force_enable_weapon) {
				self enableweapons();
			}
			while(true) {
				if(!self is_mod_activated("fly")) {
					if (!isdefined(self.atian.fly_mode_no_hint) || !self.atian.fly_mode_no_hint) {
						self menu_drawing_secondary("^6Fly mode ^1disabled");
					}
					break;
				}
				if (isdefined(self.originObj.future_tp)) {
					self.originObj.origin = self.originObj.future_tp;
					self.originObj.future_tp = undefined;
					waitframe(1);
					continue;
				}
				
				if (!isdefined(self.atian.fly_mode_no_hint) || !self.atian.fly_mode_no_hint) {
					nts = GetTime();
					if (nts > ts) {
						ts = nts + 5000; // add 2s
						self menu_drawing_secondary("^1Fly mode ^2enabled");
						self menu_drawing_secondary("^5" + (self key_mgr_get_key_str(#"fly_fast_key")) + "^1: fly, ^5" + (self key_mgr_get_key_str(#"fly_up_key")) + "^1: up, ^5" + (self key_mgr_get_key_str(#"fly_down_key")) + "^1: down");
					}
				}

				if(self key_mgr_has_key_pressed(#"fly_fast_key", false)) {
					fly_speed = self.atianconfig.fly_speed_fast;
				} else {
					fly_speed = self.atianconfig.fly_speed_normal;
				}

				player_angles = self getPlayerAngles();

				// I'm too tired to remember my vector courses
				front_vector = AnglesToForward(player_angles);
				left_vector = AnglesToForward(player_angles - (0, 90, 0));
				top_vector = AnglesToForward(player_angles - (90, 0, 0));

				v_movement = self getNormalizedMovement();

				if (self key_mgr_has_key_pressed(#"fly_up_key", false)) {
					z_movement = 1;
				} else if (self key_mgr_has_key_pressed(#"fly_down_key", false)) {
					z_movement = -1;
				} else {
					z_movement = 0;
				}

				move_vector = 
					// add z angle
						z_movement * top_vector 
					// add front movement
					+ front_vector * v_movement[0] 
					// remove left/right z vector part because it was weird
					+ (left_vector[0], left_vector[1], 0) * v_movement[1];
				move_vector_scaled = vectorScale(move_vector, fly_speed);
				originpos = self.origin + move_vector_scaled;
				self.originObj.origin = originpos;
				waitframe(1);
			}
			self unlink();
			if(isdefined(self.originObj)) self.originObj delete();
			waitframe(1);
		}
		waitframe(1);
	}
}

function set_camo() {
    while(true) {
        if (!isdefined(level.atianconfig.force_camo)) {
            waitframe(1);
            continue;
        }
        weapon = self GetCurrentWeapon();
        offhand = self GetCurrentOffhand();

        if (isdefined(weapon)) {
            self setcamo(weapon, level.atianconfig.force_camo);
        }
        if (isdefined(offhand)) {
            self setcamo(offhand, level.atianconfig.force_camo);
        }
        self waittill(#"weapon_change");
    }
}