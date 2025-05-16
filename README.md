### ka-placeableitems
Uses items to place props anywhere

### Dependencies:
* [qb-core](https://github.com/qbcore-framework/qb-core)
* [ox_inventory](https://github.com/overextended/ox_inventory)
* [ps-objectspawner](https://github.com/Khazadream/ps-objectspawner)

### Add item image to ox_inventory/web/images.lua:

### Config item in ox_inventory/data/items.lua:

```
['testplaceable'] = {
		label = 'Placeable Test',
		weight = 220,
		close = true,
		client = {
			image = 'box_small.png',
			export = 'ka-placeableitems.testplaceable',
		},
		buttons = {
			{
				label = 'Placer',
				action = function(slot)
					TriggerServerEvent('ka-placeableitems:server:PlacePlaceItem', slot)
					exports.ox_inventory:closeInventory()
				end
			},
		},
	},
```

