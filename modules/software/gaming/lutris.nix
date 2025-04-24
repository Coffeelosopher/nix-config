{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [

    lutris
    wine

    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
      ];
    })

    (lutris.override {
       extraPkgs = pkgs: [
         # List package dependencies here
       ];
    })

  ];
}
