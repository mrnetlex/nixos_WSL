{ config
, pkgs
, ...
}: {
  programs.mpv = {
    enable = true;
    config = {
		fullscreen = true;
      	fs-screen = 0;
        screen = 0;
      	window-maximized = "yes";
      	keep-open = "no";
        alang = "eng,en,enUS,en-US";
        slang = "eng,en,enUS,en-US";
        subs-fallback = "no";
        
        profile = "gpu-hq";
        vo = "gpu-next";
        hwdec = "auto-safe";
        target-colorspace-hint = true;
        gpu-api = "vulkan";
        gpu-context = "waylandvk";
        
        scale = "ewa_lanczossharp";
        dscale= "mitchell";
        cscale = "ewa_lanczossharp";
        tscale = "oversample";
        video-sync = "display-resample";
        interpolation = true;
        deband = true;
        dither-depth = "auto";
        
        audio-channels = "stereo";
    };
    profiles = {
      SDR = {
		video-output-levels = "full";
      };
      
      HDR = {
        video-output-levels = "limited";
        gamma = 8;
        brightness = 2;
      };
        
      clean = {
      	
      };
    };
    defaultProfiles = [ "HDR" ];
    bindings = {
      "Ctrl+1" = "apply-profile SDR";
      "Ctrl+2" = "apply-profile HDR";
      "Ctrl+3" = "apply-profile clean";
    };
  };
}
