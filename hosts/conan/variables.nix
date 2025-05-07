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
      
      var1 = JSON.hostname;
      var2 = JSON.username;
      #data1 = JSON.data[0];
      data1 = builtins.elemAt JSON.data 2;
    };
  };
}
