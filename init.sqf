//Initialize the Dialogue
execVM "dialogue.sqf";
execVM "loot.sqf";
execVM "lootBandits.sqf";
execVM "sleepingBags.sqf";

//Initialize variables
missionNamespace setVariable ["survivorCompanion", '0'];


/*
//Action: Medic!!
medic1 addAction ["<t color='#F00000'>I'm hurt. Patch me up, doc.</t>", {
  _this select 0 action ["HealSoldier", _this select 1];
}, [], 1.5, true, true, "", "damage _this > 0.0"];

medic1 addAction ["<t color='#FFFFFF'>Who are you?</t>", {
  call dingus_fnc_MedicIntro;
}, [], 1.5, true, true, "", ""];
*/

//Place the fuel truck
truckSpots = ["mFuelLocation1", "mFuelLocation2", "mFuelLocation3"];
fuel1 setPos (getMarkerPos (truckSpots select floor random count truckSpots));

//Add some stuff to player0
//player0 addItemToVest "ACE_personalAidKit";


//Create a fuel container
[fuelcan1, 18] call ace_refuel_fnc_makeJerryCan;
[fuelcan1, true, [0.5, 1, 2], 10] call ace_dragging_fnc_setCarryable;
