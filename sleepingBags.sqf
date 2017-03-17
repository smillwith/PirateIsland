dingus_fnc_enableSleepingBags = {
  params ["_bags"];
  {
    _x addAction ["Rest for 1 hour.", {
      //Skip 1 hour
      _date = date; _date set [3, (_date select 3) + 1]; setDate _date;
    }, [], 0, false, true, "", ""];;

    _x addAction ["Sleep for 8 hours and fully heal.", {
      //Heal the requestor
      
      //ONLY works in vanilla arma
      //_this select 0 action ["HealSoldier", _this select 1];

      //Works for ACE? - no error but also no heal
      [[_this select 0, _this select 0]] call ace_fnc_treatmentAdvanced_fullHealLocal;
      
      //Skip 8 hours
      _date = date; _date set [3, (_date select 3) + 8]; setDate _date;
    }, [], 0, false, true, "", ""];;
  } forEach _bags;
  true;
};
