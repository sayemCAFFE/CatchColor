extends WindowDialog

var buy_buttons = []
#var buy_buttons : Node

func _ready():
	GlobalSignals.connect("coin_update", self, "_coin_update")
	GlobalVars.load_data()
	$coins_label.text = GlobalVars.get_coins_as_text()
	connect_signals()
	update_buttons()
	

func connect_signals():
	buy_buttons = get_tree().get_nodes_in_group("buy_button")
	for child in buy_buttons:
		
		child.connect("pressed", self, "_on_button_pressed", [child, buy_buttons.find(child)])

func _on_button_pressed(button : Button, button_index : int):
	if button.text.countn("$"):
		var item_price : int = int(button.text.replace("$", ""))
		if GlobalVars.data["coins"] >= item_price:
			GlobalVars.data["items"][GlobalVars.data["items"].keys()[button_index]] = true
			GlobalVars.data["coins"] -= item_price
			$coins_label.text = GlobalVars.get_coins_as_text()
			GlobalVars.data["selected_player_index"] = button_index
		else:
			$not_enough_coins.show()
			
		
	elif button.text == "Own":
		GlobalVars.data["selected_player_index"] = button_index
	
	update_buttons()
	GlobalVars.save_data()

func update_buttons():
	set_bought_buttons()
	set_selected_player_button()

func set_bought_buttons():
	for i in range(GlobalVars.data["items"].size()):
		if GlobalVars.data["items"].values()[i] == true:
			buy_buttons[i].text = "Own"

func set_selected_player_button():
	buy_buttons[GlobalVars.data["selected_player_index"]].text = "Selected"
	GlobalSignals.emit_signal("update_player_sprite")

func _on_shop_wondow_popup_hide():
	hide()

func _coin_update():
	$coins_label.text = GlobalVars.get_coins_as_text()

#func _on_incrase_coin_button_pressed():
#	GlobalVars.data["coins"] += 100
#	GlobalVars.coins += 100
#	$coins_label.text = GlobalVars.get_coins_as_text()
#	GlobalVars.save_data()


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/main_menu.tscn")
