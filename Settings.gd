extends Node

const CONFIG_PATH = "user://settings.json"

var _config_data = {}

var minimum_width: int = 800
var minimum_height: int = 600

var override_size_enabled: bool = false;
var override_size_height: int = 1080
var override_size_width: int = 1920

var burrito_link_auto_launch_enabled: bool = false
var burrito_link_wine_path: String = ""
var burrito_link_env_args: String = ""

var init_window_position_x: int = 0
var init_window_position_y: int = 0


func _ready():
	var file = File.new()
	file.open(CONFIG_PATH, file.READ)
	var text = file.get_as_text()
	var datum = JSON.parse(text)
	self._config_data = JSON.parse(text).result

	if self._config_data == null:
		self._config_data = {}

	if "minimum_width" in self._config_data:
		self.minimum_width = self._config_data["minimum_width"]
	if "minimum_height" in self._config_data:
		self.minimum_height = self._config_data["minimum_height"]
	if "override_size_enabled" in self._config_data:
		self.override_size_enabled = self._config_data["override_size_enabled"]
	if "override_size_height" in self._config_data:
		self.override_size_height = self._config_data["override_size_height"]
	if "override_size_width" in self._config_data:
		self.override_size_width = self._config_data["override_size_width"]
	if "burrito_link_auto_launch_enabled" in self._config_data:
		self.burrito_link_auto_launch_enabled = self._config_data["burrito_link_auto_launch_enabled"]
	if "burrito_link_wine_path" in self._config_data:
		self.burrito_link_wine_path = self._config_data["burrito_link_wine_path"]
	if "burrito_link_env_args" in self._config_data:
		self.burrito_link_env_args = self._config_data["burrito_link_env_args"]
	if "init_window_position_x" in self._config_data:
		self.init_window_position_x = self._config_data["init_window_position_x"]
	if "init_window_position_y" in self._config_data:
		self.init_window_position_y = self._config_data["init_window_position_y"]


func save():
	_config_data = {
		"minimum_width": minimum_width,
		"minimum_height": minimum_height,
		"override_size_enabled": override_size_enabled,
		"override_size_height": override_size_height,
		"override_size_width": override_size_width,
		"burrito_link_auto_launch_enabled": burrito_link_auto_launch_enabled,
		"burrito_link_wine_path": burrito_link_wine_path,
		"burrito_link_env_args": burrito_link_env_args,
		"init_window_position_x": init_window_position_x,
		"init_window_position_y": init_window_position_y,
	}

	var file = File.new()
	file.open(CONFIG_PATH, File.WRITE)
	file.store_string(JSON.print(self._config_data))
