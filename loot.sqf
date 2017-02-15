dingus_fnc_FillLoot = {

  //Old: "NVGoggles_indep", "optic_TWS", "optic_Nightstalker", "Rangefinder", "ItemGPS", 
  _clothingItems = ["U_B_GEN_Commander_F", "V_PlateCarrier2_tna_F", "H_HelmetB_Enh_tna_F", "G_Lowprofile", "V_PlateCarrierSpec_blk", "H_Watchcap_blk", "G_Bandanna_blk", "V_TacVest_gen_F", "H_Cap_police", "V_BandollierB_blk", "H_MilCap_blue", "G_Aviator", "V_TacVest_blk", "U_B_T_Sniper_F", "U_B_T_FullGhillie_tna_F", "U_B_CTRG_Soldier_F"];
  _backpacks = ["B_AssaultPack_blk", "B_FieldPack_blk"];
  _commonItems = ["muzzle_snds_B", "acc_flashlight", "optic_Hamr", "muzzle_snds_L", "optic_ACO_grn_smg", "muzzle_snds_M", "optic_Holosight", "SMG_01_F", "muzzle_snds_acp", "optic_Holosight_smg_blk_F", "Chemlight_Blue", "Chemlight_Green", "Chemlight_Red", "Chemlight_Yellow", "ACE_fieldDressing", "Chemlight_Blue", "Chemlight_Green", "Chemlight_Red", "Chemlight_Yellow", "ACE_fieldDressing"];
  _eliteItems = ["arifle_MXC_Black_F", "hgun_PDW2000_F", "arifle_Mk20C_plain_F", "SMG_01_F"];
  _magazines = ["10Rnd_9x21_Mag", "10Rnd_9x21_Mag", "30Rnd_9x21_Mag", "30Rnd_65x39_caseless_mag", "30Rnd_556x45_Stanag", "30Rnd_45ACP_Mag_SMG_01"];

  //Items that are dropped on NPCs
  //_rareItems = ["ACE_Flashlight_MX991", "ACE_Flashlight_XL50", "ACE_microDAGR", "ACE_morphine", "ACE_packingBandage", "ACE_salineIV_500", "ACE_salineIV", "ToolKit"];
  //_commonItems = ["ACE_fieldDressing","ACE_fieldDressing","ACE_morphine","10Rnd_9x21_Mag","10Rnd_9x21_Mag","acc_flashlight", "acc_flashlight", "acc_flashlight", "Chemlight_Blue", "Chemlight_Green", "Chemlight_Red", "Chemlight_Yellow", "Chemlight_Blue", "Chemlight_Green", "Chemlight_Red", "Chemlight_Yellow"];
  
  //Get boxes
  params ["_boxes"];

  //player0 globalChat (formatText ["Boxes: %1", (count _boxes)]);

  //For each Box
  {
    //Delete everytyhing in the box
    //clearItemCargo _x; clearWeaponCargo _x; clearMagazineCargo _x; clearBackpackCargo _x;
  } forEach _boxes;

  //if (!isServer) exitwith {};

  //For each Box
  {
    //Pick a number to determine which type of loot we are going to get
    _seed = floor random 100;

    //player0 globalChat (formatText ["Seed: %1", _seed]);

    //Always get 1 Magazine
    _x addMagazineCargo [(_magazines select floor random count _magazines), 1];

    //Sometimes you get one more Magazine
    if (_seed mod 3 == 0) then {
      _x addItemCargo [(_magazines select floor random count _magazines), 1];  
    };


    //Always get at least 1 Common item
    _x addItemCargo [(_commonItems select floor random count _commonItems), 1];

    //Sometimes you get one more Common
    if (_seed mod 3 == 0) then {
      _x addItemCargo [(_commonItems select floor random count _commonItems), 1];  
    };

    //Sometimes you get a backpack
    if (_seed mod 7 == 0) then {
      _x addBackpackCargo [(_backpacks select floor random count _backpacks), 1];
    };

    //Sometimes you get a backpack
    if (_seed mod 2 == 0) then {
      _x addItemCargo [(_clothingItems select floor random count _clothingItems), 1];
    };

    //Temp for now
    //_x addItemCargo [(_clothingItems select floor random count _clothingItems), 1];
    //_x addBackpackCargo [(_backpacks select floor random count _backpacks), 1];
    //_x addItemCargo [(_eliteItems select floor random count _eliteItems), 1];
    //_x addItemCargo [(_rareItems select floor random count _rareItems), 1];
    //_x addItemCargo [(_commonItems select floor random count _commonItems), 1];
    //_x addMagazineCargo [(_magazines select floor random count _magazines), 1];

  } forEach _boxes;

  //Distribute the elite items
  {
    //pick a box
    _box = _boxes select floor random count _boxes;

    //put it in
    _box addItemCargo [_x, 1];

  } forEach _eliteItems;

  true;
};