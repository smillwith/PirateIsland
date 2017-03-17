dingus_fnc_MedicIntro = {
  medic1 globalChat "Hi, I am the local doctor. I can patch you up if you get hurt.";
};

dingus_fnc_survivorCompanion = {
  survivor1 globalChat "Sure thing. I'm right behind you.";
  //add him to the group
  [survivor1] join group player0;
  missionNamespace setVariable ["survivorCompanion", '1'];
};

survivor1 addAction ["<t color='#FFFFFF'>Do you want to come with me?</t>", "[] call dingus_fnc_survivorCompanion", [], 1.5, true, true, "", "missionNamespace getVariable ['survivorCompanion', '0'] == '0';"];
