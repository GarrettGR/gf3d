{
  description = "A collection of utlitity functions designed to facilitate creating 3D games with Vulkan and SDL.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
             gcc
             vulkan-loader
             vulkan-headers
             vulkan-tools
             SDL2
             SDL2_ttf
             SDL2_image
             SDL2_mixer
             libpng
             libjpeg
             zlib
          ];
        };
      }
    );
}
