{ config, pkgs, ... }:

{
  #Packages
  environment.systemPackages = with pkgs; [
	git
    killall
    unzip
	micro
    neovim
    wget
    curl
    helix
    btop
	yazi
    lazygit
    systemctl-tui
    ffmpegthumbnailer
    unar
    file
    jq
    poppler
	zoxide
    starship
    navi
    fzf
    bat
    bat-extras.batman
    bat-extras.batgrep
    bat-extras.batdiff
    eza
    grc
    gdu
    delta
	gping
    speedtest-rs
    cfspeedtest
    bandwhich
    tealdeer
    erdtree
	unimatrix
    cowsay
    lolcat
    peaclock
    tomato-c
    sl
    trash-cli
    ripgrep
    fd
    du-dust
    duf
    progress
	zathura
    spotify-player
    termusic
    ani-cli
    nitch
    neofetch
    ramfetch
    pipes-rs
    pokemon-colorscripts-mac
    cbonsai
    ocrmypdf
  ];
  # SERVICES for my  programs
  #plocate
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    localuser = null;
  };
}
