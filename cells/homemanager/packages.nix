{ inputs, cell, }:
let inherit (inputs) nixpkgs;
in {
  nixTools = with nixpkgs; [
    ansible
    awscli2
    cachix
    direnv
    delve
    gh
    git-open
    gnupg
    go
    gopls
    go-tools
    helmfile
    inetutils
    kubectl
    kubectx
    kubernetes-helm
    lorri
    nixfmt
    nodejs-18_x
    rustup
    terraform
    tmux
    tree
    htop
    yarn
    zsh-autosuggestions
    zsh-syntax-highlighting

    # from inputs
    inputs.agenix.packages.agenix
    inputs.std.std.cli.std
  ];
}
