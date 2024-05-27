{...}: {
  services.kasmweb = {
    enable = true;
    datastorePath = "/mnt/data/kasm";
    listenPort = 5412;
  };
}
