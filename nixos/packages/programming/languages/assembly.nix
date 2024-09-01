{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nasm            # assembler
    gcc             # compiler
    gdb             # debugger
    binutils        # linker and assembler
    clang           # compiler
    llvm
    radare2         # reverse engineering
  ];
}
