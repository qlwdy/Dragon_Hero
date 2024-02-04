// obj_SpawnPointX Create Event

// Choose a random index from the array
var chosenIndex = irandom(4); // Assuming 0 to 4 for the array indices

// Determine the chosen object based on the global variables

var chosenObject = choose(obj_chest, obj_crown, obj_goblet, obj_gold_bars, obj_sword);
// Get the index of the chosen object
var objIndex = asset_get_index(chosenObject);

// Spawn the chosen object at the spawn point using instance_create_layer
// if (objIndex != -1) {
    instance_create_layer(x, y, "Instances", chosenObject);
//}

// Destroy the spawn point object since it's done its job
instance_destroy();

