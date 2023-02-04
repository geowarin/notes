Some commands that you might find helpful: 

- `pacman -Qo <file>` will tell you what if any package owns a given file.
Which you can use to tell if you have an orphaned file or not. 
- `pacman -Qdtq` will list any package that is installed as a
dep but no longer required. 
- And `pacman -Rsunc $(pacman -Qdtq)` will remove them and anything they depend on. 
- `pacman -Sc` will clear out older packages from the package caches.
