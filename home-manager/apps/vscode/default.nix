{ inputs, outputs, lib, config, pkgs, ... }: {
  # Configure Visual Studio Code
  programs.vscode = {
    enable = true;

    # Define extensions to be installed
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      usernamehw.errorlens
      eamodio.gitlens
      esbenp.prettier-vscode
      kamikillerto.vscode-colorize
      jdinhlife.gruvbox
      continue.continue
      christian-kohler.path-intellisense
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];

    # Define user settings for Visual Studio Code
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
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
