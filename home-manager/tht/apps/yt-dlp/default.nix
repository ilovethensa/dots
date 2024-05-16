{pkgs, ...}: {
  programs.yt-dlp = {
    enable = true;
    package = pkgs.yt-dlp;
    settings = {
      audio-format = "best";
      audio-quality = 0;
      embed-chapters = true;
      embed-metadata = true;
      embed-subs = true;
      embed-thumbnail = true;
      remux-video = "aac>m4a/mov>mp4/mkv";
      sponsorblock-remove = "all";
      sub-langs = "all";
    };
  };
}
