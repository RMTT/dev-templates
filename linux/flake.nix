{
  description = "A development environment for building the Linux kernel";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "linux-kernel-dev";

          nativeBuildInputs = with pkgs; [
            # Core build tools
            gcc
            gnumake
            binutils
            pkg-config

            # Configuration tools (make menuconfig)
            ncurses

            # Build dependencies
            flex
            bison
            elfutils # libelf
            openssl
            bc
            cpio
            xz
            gzip
            bzip2
            lz4
            zstd

            # Scripting languages used in kernel build system
            perl
            python3

            # Useful development tools
            git
            ctags
            cscope
            pahole
          ];

          shellHook = ''
            echo "🐧 Linux Kernel Development Environment Loaded 🐧"
            echo "You can now run 'make menuconfig' and 'make' to build the kernel."

            # Common aliases
            alias m='make -j$(nproc)'
            alias mm='make menuconfig'
          '';

          # Optional: Environment variables typically needed for cross-compiling or specific builds
          # ARCH = "x86_64";
          # CROSS_COMPILE = "";
        };
      }
    );
}
