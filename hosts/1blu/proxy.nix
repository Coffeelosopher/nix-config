{ config, pkgs, ... }: {
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
      2022 # Gitea / ForgeJO SSH
      25565 # Minecraft
      25575 # Minecraft RCON
    ];
    allowedUDPPorts = [
      #3478 # Headscale Stun
    ];
  };

  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "nico.nicklis@icloud.com";
      dnsProvider = "1.1.1.1";
      dnsResolver = "8.8.8.8";
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedTlsSettings = true;

    streamConfig = ''
    # (BetterMC) Minecraft Stream
      server {
        listen 25565;
        proxy_timeout 20s;
        proxy_pass 100.95.117.61:25565;
      }
      server {
        listen 25575;
        proxy_timeout 20s;
        proxy_pass 100.95.117.61:25575;
      }
     '';

    virtualHosts."vault.nicklis.cloud" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:888";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

    virtualHosts."vw.nicklis.cloud" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:888";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

/*
    virtualHosts."vault.hostedbymyself.de" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://172.17.0.1:3010";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };
    virtualHosts."nextcloud.hostedbymyself.de" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://100.64.0.22:8970";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;" + "client_max_body_size 32G;";
      };
    };
    virtualHosts."hostedbymyself.de" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://172.17.0.1:82";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
      locations."/_matrix" = {
        proxyPass = "http://172.17.0.1:3100";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
      locations."/_synapse/client" = {
        proxyPass = "http://172.17.0.1:3100";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };
*/
};
}
