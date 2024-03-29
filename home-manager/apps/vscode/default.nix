{ inputs, outputs, lib, config, pkgs, ... }: {
  # Configure Visual Studio Code
  programs.vscode = {
    enable = true;

    # Define extensions to be installed
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      jnoortheen.nix-ide
      usernamehw.errorlens
      eamodio.gitlens
      esbenp.prettier-vscode
      kamikillerto.vscode-colorize
      jdinhlife.gruvbox
      continue.continue
      christian-kohler.path-intellisense
    ];

    # Define user settings for Visual Studio Code
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "files.autoSave" = "afterDelay";
      "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "notebook.formatOnSave.enabled" = true;
      "notebook.formatOnCellExecution" = true;
    };
  };
}
