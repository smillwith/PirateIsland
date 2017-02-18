//Initialize the Dialogue
execVM "dialogue.sqf";
execVM "loot.sqf";
execVM "lootBandits.sqf";
execVM "sleepingBags.sqf";

//Action: Medic!!
medic1 addAction ["<t color='#F00000'>I'm hurt. Patch me up, doc.</t>", {
  _this select 0 action ["HealSoldier", _this select 1];
}, [], 1.5, true, true, "", "damage _this > 0.0"];

medic1 addAction ["<t color='#FFFFFF'>Who are you?</t>", {
  call dingus_fnc_MedicIntro;
}, [], 1.5, true, true, "", ""];

