#  Real World Firmware Examples

**Note:** The `binary` folder contains the binary firmware build by P<sup>2</sup>sup>IM contributors.

## Compiling Firmware 
1. To install all the dependencies needed, run:
```
./setup.sh
```

2. Export the following paths to `$PATH`:
```
export PATH=$PATH:$(realpath gcc-arm-none-eabi)/bin
export PATH=$PATH:$(realpath .)
```

3. To build all the projects at once run:  
```
make
```

**Note:**Each project has a corresponding Makefile that builds the binary firmware (i.e *project_name.elf*). Make use of it to individually build each firmware.


## Patching firmware with `aflCall`

All firmware invoke `aflCall`, as explained [here](https://github.com/RiS3-Lab/p2im/blob/master/docs/prep_fw_for_fuzzing.md). In QEMU, `aflCall` is intercepted and does not change firmware state. However, it may crash the firmware on real device. To disable `aflCall`, simply set `noHyperCall` variable to 1 on source code, or replace all `svc $0x3f` instructions by `NOP` on binary.

## References

This is the repo for all real-world firmware fuzz-tested in [P<sup>2</sup>IM paper](https://www.usenix.org/conference/usenixsecurity20/presentation/feng).


## TODO
1. Build and write `Makefile` for project `Drone`.

2. Build and write `Makefile` for project `Robot`. 
