{ config
, pkgs
, ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      # Replace some more things with better alternatives
      ls = "eza -al --color=always --group-directories-first --icons"; # preferred listing
      la = "eza -a --color=always --group-directories-first --icons"; # all files and dirs
      ll = "eza -l --color=always --group-directories-first --icons"; # long format
      lt = "eza -aT --color=always --group-directories-first --icons"; # tree listing
      ip = "ip -color";
      cat = "bat --style header  --style snip --style changes --style header";
      grep = "rg";
      man = "batman";
      ncdu = "gdu";
      # Common use
      grubup = "sudo update-grub";
      fixpacman = "sudo rm /var/lib/pacman/db.lck";
      tarnow = "tar -acf ";
      untar = "tar -xvf ";
      wget = "wget -c ";
      psmem = "ps auxf | sort -nr -k 4";
      psmem10 = "ps auxf | sort -nr -k 4 | head -10";
      ".." = "z ..";
      "..." = "z ../..";
      "...." = "z ../../..";
      "....." = "z ../../../..";
      "......" = "z ../../../../..";
      dir = "dir --color=auto";
      vdir = "vdir --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      hw = "hwinfo --short"; # Hardware Info
      tp = "trash-put";
      systui = "systemctl-tui";
      lg = "lazygit";
      

      # Funny aliases
      ping = "pingu";
      tree = "erd";

      #micro = "nvim";
    };
    shellInit = ''
      	 #Starship
      	 starship init fish | source

         #zoxide
         zoxide init fish | source

         #navi
         navi widget fish | source

         #bathelp

         function bathelp
             bat --plain --language=help $argv
         end

         function help
             "$argv" --help ^&1 | bathelp
         end

         #fzf plugin
         set fzf_preview_dir_cmd eza --all --color=always
         set fzf_fd_opts --hidden --exclude=~/.local/
         set fzf_diff_highlighter delta --paging=never --width=20

         #Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
         function __history_previous_command
           switch (commandline -t)
           case "!"
             commandline -t $history[1]; commandline -f repaint
           case "*"
             commandline -i !
           end
         end

         function __history_previous_command_arguments
           switch (commandline -t)
           case "!"
             commandline -t ""
             commandline -f history-token-search-backward
           case "*"
             commandline -i '$'
           end
         end

         if [ "$fish_key_bindings" = fish_vi_key_bindings ];
           bind -Minsert ! __history_previous_command
           bind -Minsert '$' __history_previous_command_arguments
         else
           bind ! __history_previous_command
           bind '$' __history_previous_command_arguments
         end

      #yazi
         function ya
             set tmp (mktemp -t "yazi-cwd.XXXXX")
             yazi $argv --cwd-file="$tmp"
             if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
             	cd -- "$cwd"
             end
             rm -f -- "$tmp"
         end

         #Flatpak fix
         set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
         set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

         for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
             if test -d $flatpakdir
                     contains $flatpakdir $PATH; or set -a PATH $flatpakdir
             end
         end

    '';
    interactiveShellInit = ''
            set fish_greeting

            # Theme
#                # TokyoNight Color Palette
#                set -l foreground c0caf5
#                set -l selection 283457
#                set -l comment 565f89
#                set -l red f7768e
#                set -l orange ff9e64
#                set -l yellow e0af68
#                set -l green 9ece6a
#                set -l purple 9d7cd8
#                set -l cyan 7dcfff
#                set -l pink bb9af7
# 
#                # Syntax Highlighting Colors
#                set -g fish_color_normal $foreground
#                set -g fish_color_command $cyan
#                set -g fish_color_keyword $pink
#                set -g fish_color_quote $yellow
#                set -g fish_color_redirection $foreground
#                set -g fish_color_end $orange
#                set -g fish_color_error $red
#                set -g fish_color_param $purple
#                set -g fish_color_comment $comment
#                set -g fish_color_selection --background=$selection
#                set -g fish_color_search_match --background=$selection
#                set -g fish_color_operator $green
#                set -g fish_color_escape $pink
#                set -g fish_color_autosuggestion $comment
# 
#                # Completion Pager Colors
#                set -g fish_pager_color_progress $comment
#                set -g fish_pager_color_prefix $cyan
#                set -g fish_pager_color_completion $foreground
#                set -g fish_pager_color_description $comment
#                set -g fish_pager_color_selected_background --background=$selection

               #fzf
      	  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color 16"
               #run fetch
               nitch
    '';
  };
  environment.systemPackages = with pkgs; [
    fishPlugins.fzf-fish
    fishPlugins.done
    fishPlugins.colored-man-pages
    fishPlugins.autopair
    fishPlugins.sponge
    fishPlugins.colored-man-pages
  ];
}
