{ inputs, outputs, lib, config, pkgs, ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      userServices = true;
      domain = true;
      addresses = true;
    };
    extraServiceFiles = [
      dash = ''
      <?xml version="1.0" standalone='no'?>
      <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
      <service-group>
      <name replace-wildcards="yes">dash HTTP Server on Port 8082</name>
      <service>
      <type>_http._tcp</type>
      <port>8082</port>
      </service>
      </service-group>
    ''
    ];
  };
}
