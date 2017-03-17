dingus_fnc_FillBanditLoot = {
  params ["_units"];

  //For each Unit
  {
    //Remove key items from them
    if (side _x isEqualTo independent) then {
      removeAllAssignedItems _x;

      //Add the flashlight
      _x addPrimaryWeaponItem "acc_Flashlight";
    }
  } forEach allUnits;

  //if (!isServer) exitwith {};

  true;
};