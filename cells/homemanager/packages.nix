{ inputs, cell, }:
let inherit (inputs) nixpkgs;
in {
  nixTools = user:
    let
      system = builtins.currentSystem;
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
          allowUnsupportedSystem = true;
        };
      };
      userPackages =
        if builtins.hasAttr "packages" user then user.packages pkgs else [ ];
    in with pkgs;
    [
      ansible
      awscli2
      cachix
      delve
      direnv
      gh
      git-open
      gnupg
      go
      go-tools
      gopls
      helmfile
      htop
      inetutils
      kubectl
      kubectx
      kubernetes-helm
      kustomize
      lorri
      nixfmt
      nodejs-18_x
      rustup
      starship
      terraform
      tmux
      tree
      yarn
      zsh-autosuggestions
      zsh-syntax-highlighting

      # from inputs
      inputs.agenix.packages.agenix
      inputs.std.std.cli.std
    ] ++ userPackages;
}
