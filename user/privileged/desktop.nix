{ config, pkgs, variables, ... }: 

{
  imports = [ 
    ./default.nix
  ];

  users.users.${variables.username} = {
    packages = with pkgs; [ ];
  };
}
