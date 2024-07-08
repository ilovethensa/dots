{...}: {
  programs.nixvim = {
    plugins.lightline.enable = true;
    colorschemes.gruvbox.enable = true;
  };
}
