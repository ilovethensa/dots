{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      usernamehw.errorlens
      eamodio.gitlens
      esbenp.prettier-vscode
      kamikillerto.vscode-colorize
      jdinhlife.gruvbox
      continue.continue
      christian-kohler.path-intellisense
    ];
    userSettings = {
      "workbench.preferredDarkColorTheme" = "Gruvbox Dark Medium";
      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "files.autoSave" = "afterDelay";
      "editor.bracketPairColorization.independentColorPoolPerBracketType" =
        true;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "notebook.formatOnSave.enabled" = true;
      "notebook.formatOnCellExecution" = true;
    };
  };

}
