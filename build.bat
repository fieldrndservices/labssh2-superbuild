if not exist "build32\" mkdir build32 
pushd build32
cmake -G"Visual Studio 15 2017" ..
popd
if not exist "build64\" mkdir build64 
pushd build64
cmake -G"Visual Studio 15 2017 Win64" .. 
popd
cmake --build build32 --config Release
cmake --build build64 --config Release

