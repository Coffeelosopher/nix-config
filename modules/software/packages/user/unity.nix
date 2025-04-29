{ config, pkgs, username, ... } : {

  imports = [ ];

  users.users.${username}= {
   packages = with pkgs; [
        unityhub
        jetbrains.rider
   ];
  };
}
