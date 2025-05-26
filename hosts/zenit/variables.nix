{ config, lib, pkgs, modulesPath, ... }: 

let
  JSON = builtins.fromJSON (builtins.readFile ./test.json);
in 

{
  _module.args = {
    variables = {
      hostname = "Zenit";
      username = "nico";
      
      var1 = JSON.hostname;
      var2 = JSON.username;
      data1 = builtins.elemAt JSON.data.more 2;
    };
  };
}
