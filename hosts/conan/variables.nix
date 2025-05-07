{ config, lib, pkgs, modulesPath, ... }: 
let
  JSON = builtins.fromJSON (builtins.readFile ./test.json);
in 

{
  _module.args = {
    variables = {
      # Hostname
      hostname = "conan";
      # User
      username = "nico";
      
      horstname = JSON.horstname;
      ursaname = JSON.username;
      data1 = JSON.data[0];
    };
  };
}
