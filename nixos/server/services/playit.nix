{ pkgs, lib, config, ... }:
{
  services.playit = {
    enable = true;
    secretPath = config.age.secrets.playit-secret.path;
    runOverride = {
      "890e3610-26cd-4e2b-b161-7cf0e4f69148".port = 8080;
      "f8060d9aef58ec61cd329a820ef39313e57ceab8f80ef9fd12f267eef6b06abe" = { ip = 192.168 .1 .1; port = 9000; };
    };
  };

}
