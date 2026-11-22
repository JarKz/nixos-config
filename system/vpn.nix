{ ... }:
{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.enable = true;
  # networking.wg-quick.interfaces = {
  #   wg0 = {
  #     address = [ "10.0.0.X/24" ]; # Set the address of current machine among VPN.
  #     dns = [ "X.X.X.X" ]; # Set DNS to mask a provider's one
  #     privateKey = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX="; # The private key of current machine
  #
  #     # Setup properly using https://www.digitalocean.com/community/tutorials/how-to-set-up-wireguard-on-ubuntu-22-04#optional-configuring-a-peer-to-route-all-traffic-over-the-tunnel
  #     postUp = ''
  #       ip rule add table 200 from X.X.X.X;
  #       ip route add table 200 default via X.X.X.X
  #     '';
  #
  #     preDown = ''
  #       ip rule delete table 200 from X.X.X.X;
  #       ip route delete table 200 default via X.X.X.X
  #     '';
  #
  #     peers = [
  #       {
  #         publicKey = "XXXXXXXXXXXXXX//XXXXXXXXXXX/XXXXX/XXXXXXXXX="; # Set the public key of server's VPN
  #         endpoint = "X.X.X.X:51820"; # Set the server's endpoint
  #         allowedIPs = [
  #           "0.0.0.0/0"
  #           "::/0"
  #         ];
  #       }
  #     ];
  #   };
  # };
}
