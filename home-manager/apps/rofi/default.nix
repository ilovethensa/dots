{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    theme = {
      "configuration" = {
        modi = "run,drun,window";
        icon-theme = "Oranchelo";
        show-icons = true;
        terminal = "alacritty";
        drun-display-format = "{icon} {name}";
        location = 0;
        disable-history = false;
        hide-scrollbar = true;
        display-drun = "   Apps ";
        display-run = "   Run ";
        display-window = " 﩯  Window";
        display-Network = " 󰤨  Network";
        sidebar-mode = true;
      };
      "*" = {
        bg-col = "#1e1e2e";
        bg-col-light = "#1e1e2e";
        border-col = "#1e1e2e";
        selected-col = "#1e1e2e";
        blue = "#89b4fa";
        #cdd6f4 = "#cdd6f4";
        #cdd6f42 = "#f38ba8";
        grey = "#6c7086";

        width = 600;
        font = "JetBrainsMono Nerd Font 14";
      };
      "element-text" = {
        background-color = "#1e1e2e";
        text-color = "#1e1e2e";
      };
      "element-icon" = {
        background-color = "#1e1e2e";
        text-color = "#1e1e2e";
      };
      "mode-switcher" = {
        background-color = "#1e1e2e";
        text-color = "#1e1e2e";

      };
      "window" = {
        height = "360px";
        border = "3px";
        border-color = "#1e1e2e";
        background-color = "#1e1e2e";
      };

      "mainbox" = {
        background-color = "#1e1e2e";
      };

      "inputbar" = {
        children = "[prompt,entry]";
        background-color = "#1e1e2e";
        border-radius = "5px";
        padding = "2px";
      };

      "prompt" = {
        background-color = "#89b4fa";
        padding = "6px";
        text-color = "#1e1e2e";
        border-radius = "3px";
        margin = "20px 0px 0px 20px";
      };

      "textbox-prompt-colon" = {
        expand = "false";
        str = ":";
      };

      "entry" = {
        padding = "6px";
        margin = "20px 0px 0px 10px";
        text-color = "#cdd6f4";
        background-color = "#1e1e2e";
      };

      "listview" = {
        border = "0px 0px 0px";
        padding = "6px 0px 0px";
        margin = "10px 0px 0px 20px";
        columns = 2;
        lines = 5;
        background-color = "#1e1e2e";
      };

      "element" = {
        padding = "5px";
        background-color = "#1e1e2e";
        text-color = "#cdd6f4";
      };

      "element-icon" = {
        size = "25px";
      };

      "selected" = {
        background-color = "selected-col";
        text-color = "#cdd6f42";
      };

      "mode-switcher" = {
        spacing = 0;
      };

      "button" = {
        padding = "10px";
        background-color = "#1e1e2e-light";
        text-color = "#6c7086";
        vertical-align = "0.5";
        horizontal-align = "0.5";
      };

      "message" = {
        background-color = "#1e1e2e-light";
        margin = "2px";
        padding = "2px";
        border-radius = "5px";
      };

      "textbox" = {
        padding = "6px";
        margin = "20px 0px 0px 20px";
        text-color = "#89b4fa";
        background-color = "#1e1e2e-light";
      };


    }
      };
  }
