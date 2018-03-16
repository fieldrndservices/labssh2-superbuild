# LabSSH2-SuperBuild - A CMake Super Build for the labssh2-c project

LabSSH2-SuperBuild is a [Cmake Super Build](https://blog.kitware.com/cmake-superbuilds-git-submodules/) for the [LabSSH2-C](https://github.com/fieldrndservices/labssh2-c) project. The LabSSH2-C project is dependent on the [OpenSSL](https://www.openssl.org/) project and requires numerous flags and options to be set to specific values to build correctly. This project provides an automated build process using [CMake](https://cmake.org) and the [ExternalProject](https://cmake.org/cmake/help/v3.10/module/ExternalProject.html) module.

[Build](#build) | [License](#license)

## Build

Building the LabSSH2 shared library (labssh2) will automatically download, configure, and build the correct version of the [OpenSSL](https://www.openssl.org/) project and [LabSSH2-C](https://github.com/fieldrndservices/labssh2-c). It will take some time to complete as the OpenSSL project is fairly large. When the entire build is completed, the `labssh2` shared library, either `labssh2.dll`, `labssh2.dylib`, or `labssh2.so`, will be available in the `bin` folder of the root build folder.

Ensure all of the following dependencies are installed before proceeding:

- [CMake 3.10.x](https://cmake.org/), or newer
- [Microsoft Visual C++ Build Tools 2017](https://www.visualstudio.com/downloads/#build-tools-for-visual-studio-2017), Windows Only
- [XCode Command Line Tools](https://developer.apple.com/xcode/features/), macOS Only
- [Git](https://git-scm.com/)
- [ActivePerl](https://www.activestate.com/activeperl), Windows only

### macOS

```bash
$ git clone https://github.com/fieldrndservices/labssh2-superbuild.git LabSSH2-SuperBuild
$ cd LabSSH2-SuperBuild
$ mkdir build
$ cd build
$ cmake ..
$ cmake --build . --config Release
```

## License

The LabSSH2-SuperBuild project is licensed under the [revised BSD 3-Clause](https://opensource.org/licenses/BSD-3-Clause) license. See the [LICENSE](https://github.com/fieldrndservices/labssh2-superbuild/blob/master/LICENSE).

