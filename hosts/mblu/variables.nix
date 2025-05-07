{ config, lib, pkgs, modulesPath, ... }: 

{
  _module.args = {
    variables = {
      hostname = "mblu";
    };
  };
}
