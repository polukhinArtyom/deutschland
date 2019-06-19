/// @description Insert description here
// You can write your code in this editor
global.pause = true;
global.view_width = camera_get_view_width(view_camera[0]);
global.view_heihgt = camera_get_view_height(view_camera[0]);

global.key_revert = ord("X");
global.key_enter = vk_enter;
global.key_enter = vk_left;
global.key_enter = vk_right;
global.key_enter = vk_up;
global.key_enter = vk_down;

display_set_gui_size(global.view_width, global.view_heihgt);

enum menu_page {
	main,
	settings,
	audio,
	difficulty,
	graphics,
	controls,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

// Create menu pages

ds_menu_main = create_menu_page(
	["RESUME", menu_element_type.script_runner, resume_game],
	["SETTINGS", menu_element_type.page_transfer, menu_page.settings],
	["EXIT", menu_element_type.script_runner, exit_game]
);

ds_settings = create_menu_page(
	["AUDIO", menu_element_type.script_runner, menu_page.audio],
	["DIFFICULTY", menu_element_type.page_transfer, menu_page.difficulty],
	["GRAPHICS", menu_element_type.page_transfer, menu_page.graphics],
	["CONTROLS", menu_element_type.page_transfer, menu_page.controls],
	["BACK", menu_element_type.page_transfer, menu_page.main]
);

ds_menu_main = create_menu_page(
	["MASTER", menu_element_type.slider, change_volume, 1, [0,1]],
	["SOUNDS", menu_element_type.slider, change_volume, 1, [0,1]],
	["MUSIC", menu_element_type.slider, change_volume, 1, [0,1]],
	["BACK", menu_element_type.page_transfer, menu_page.settings]
);

ds_menu_main = create_menu_page(
	["RESUME", menu_element_type.script_runner, resume_game],
	["SETTINGS", menu_element_type.page_transfer, menu_page.settings],
	["EXIT", menu_element_type.script_runner, exit_game]
);