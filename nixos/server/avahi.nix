{ inputs, outputs, lib, config, pkgs, ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    hostName = "server";
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
    extraServiceFiles = {
      dash = ''
        <?xml version="1.0" standalone='no'?>
        <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
        <service-group>
        <name replace-wildcards="yes">dash</name>
        <service>
        <type>_http._tcp</type>
        <port>8082</port>
        </service>
        </service-group>
      '';
    };
  };
}
