{ ... }:
{
  imports = [
    ./plex.nix
    ./wireguard.nix
    ./duckdns.nix
    ./radarr.nix
    ./sonarr.nix
    ./prowlarr.nix
    ./requestrr.nix
    ./qbittorrentvpn.nix
    ./nzbget.nix
    ./filebot.nix
  ];
}
