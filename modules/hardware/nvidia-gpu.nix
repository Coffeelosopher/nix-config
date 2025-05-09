{ config, lib, pkgs, modulesPath, ... }:

{
  #imports = [  ];

  ## Enable OpenGL
  #hardware.graphics = {
  #  enable = true;
  #};

  ## Load nvidia driver for Xorg and Wayland
  #services.xserver.videoDrivers = ["nvidia"];


  #hardware.nvidia = {
  #  # Modesetting is required.
  #  modesetting.enable = true;

  #  # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
  #  # Enable this if you have graphical corruption issues or application crashes after waking
  #  # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
  #  # of just the bare essentials.
  #  powerManagement.enable = false;

  #  # Fine-grained power management. Turns off GPU when not in use.
  #  # Experimental and only works on modern Nvidia GPUs (Turing or newer).
  #  powerManagement.finegrained = false;

  #  # Use the NVidia open source kernel module (not to be confused with the
  #  # independent third-party "nouveau" open source driver).
  #  # Support is limited to the Turing and later architectures. Full list of 
  #  # supported GPUs is at: 
  #  # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
  #  # Only available from driver 515.43.04+
  #  open = false;

  #  # Enable the Nvidia settings menu,
	#  # accessible via `nvidia-settings`.
  #  nvidiaSettings = true;

  #  # Optionally, you may need to select the appropriate driver version for your specific GPU.
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  #};

  ########## experimental - Sleep/hibernation is working! ##########

  imports = [  ];

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];


    # Enable NVIDIA drivers and configure power management
  hardware.nvidia = {
    modesetting.enable = true;          # Use NVIDIA DRM KMS for proper Wayland/TTY support
    open = false;                       # Use proprietary driver (set to false explicitly for clarity)
    powerManagement.enable = true;      # Enable NVIDIA suspend/hibernate hooks (nvidia-suspend.service, etc.)
    powerManagement.finegrained = false; # Fine-grained power management (recommended for Turing+ GPUs, Optimus setups)
    nvidiaSettings = true;              # Include nvidia-settings tool (unrelated to suspend, but handy)
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Kernel boot parameters
  boot.kernelParams = [
    # Prefer suspend-to-RAM (S3 "deep") over s2idle, for lower power usage and stability
    "mem_sleep_default=deep"
    # Preserve NVIDIA GPU memory allocations across suspend/hibernate (added by powerManagement.enable, but we include for completeness)
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    # (Optional) Set a path for NVIDIA to save state if needed (particularly for hibernate)
    #"nvidia.NVreg_TemporaryFilePath=/var/tmp"
    # (Optional) Prevent spurious wake-ups from EC (uncomment if you have immediate wake issues)
    #"acpi.ec_no_wakeup=1"
  ];

  # If hibernation is desired, make sure swap is set and resume device is specified:
  swapDevices = [ { device = "/dev/disk/by-uuid/5b23acb8-756e-4f38-9af1-26f7feb03f29"; } ];
  boot.resumeDevice = "/dev/disk/by-uuid/5b23acb8-756e-4f38-9af1-26f7feb03f29";



5b23acb8-756e-4f38-9af1-26f7feb03f29 

  # (Optional) Workaround for systemd user session freeze hang:
  systemd.services."systemd-suspend".environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";

  # ...other configuration...
  ########## experimental ##########
}

