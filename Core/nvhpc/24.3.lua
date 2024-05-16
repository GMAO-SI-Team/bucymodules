--[[

  This modulefile is based on the ones that comes from the NVIDIA install itself. To install, 
  I did:
 
    wget https://developer.download.nvidia.com/hpc-sdk/24.3/nvhpc_2024_243_Linux_x86_64_cuda_12.3.tar.gz
    tar -xf nvhpc_2024_243_Linux_x86_64_cuda_12.3.tar.gz
    cd nvhpc_2024_243_Linux_x86_64_cuda_12.3/
    ./install
 
  I selected a "single system install" and then installed to:
 
    /ford1/share/gmao_SIteam/nvidia/hpc_sdk
  
  NVHPC then creates modulesfiles. This one is the nvhpc-nompi/24.3 and was installed via
 
    cp /ford1/share/gmao_SIteam/nvidia/hpc_sdk/modulefiles/nvhpc-nompi/24.3 .

  and then converted to lua
    
--]]

family("Compiler")

-- Setup Modulepath for packages built by this compiler
local mroot = "/ford1/share/gmao_SIteam/lmodulefiles"
local mdir  = pathJoin(mroot,"Compiler/nvhpc-24.3")
prepend_path("MODULEPATH", mdir)

local nvhome = "/ford1/share/gmao_SIteam/nvidia/hpc_sdk"
local target = "Linux_x86_64"
local version = "24.3"

local nvcudadir = pathJoin(nvhome,target,version,"cuda")
local nvcompdir = pathJoin(nvhome,target,version,"compilers")
local nvmathdir = pathJoin(nvhome,target,version,"math_libs")
local nvcommdir = pathJoin(nvhome,target,version,"comm_libs")

setenv("NVHPC",nvhome)
setenv("NVHPC_ROOT",pathJoin(nvhome,target,version))
setenv("CC",pathJoin(nvcompdir,"bin","nvc"))
setenv("CXX",pathJoin(nvcompdir,"bin","nvc++"))
setenv("FC",pathJoin(nvcompdir,"bin","nvfortran"))
setenv("F90",pathJoin(nvcompdir,"bin","nvfortran"))
setenv("F77",pathJoin(nvcompdir,"bin","nvfortran"))
setenv("CPP",cpp)

prepend_path("PATH",pathJoin(nvcudadir,"bin"))
prepend_path("PATH",pathJoin(nvcompdir,"bin"))
prepend_path("PATH",pathJoin(nvcompdir,"extras/qd/bin"))

prepend_path("LD_LIBRARY_PATH",pathJoin(nvcudadir,"lib64"))
prepend_path("LD_LIBRARY_PATH",pathJoin(nvcudadir,"extras/CUPTI/lib64"))
prepend_path("LD_LIBRARY_PATH",pathJoin(nvcompdir,"extras/qd/lib"))
prepend_path("LD_LIBRARY_PATH",pathJoin(nvcompdir,"lib"))
prepend_path("LD_LIBRARY_PATH",pathJoin(nvmathdir,"lib64"))
prepend_path("LD_LIBRARY_PATH",pathJoin(nvcommdir,"nccl/lib"))
prepend_path("LD_LIBRARY_PATH",pathJoin(nvcommdir,"nvshmem/lib"))

prepend_path("CPATH",pathJoin(nvmathdir,"include"))
prepend_path("CPATH",pathJoin(nvcommdir,"nccl/include"))
prepend_path("CPATH",pathJoin(nvcommdir,"nvshmem/include"))
prepend_path("CPATH",pathJoin(nvcompdir,"extras/qd/include/qd"))
prepend_path("MANPATH",pathJoin(nvcompdir,"man"))
