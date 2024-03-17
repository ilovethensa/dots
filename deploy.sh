nixos-rebuild --flake .#server \
    --target-host root@192.168.1.111 \
    --option 'extra-substituters' 'https://nyx.chaotic.cx/' \
    --option extra-trusted-public-keys "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8=" \
    --impure \
    switch