string(APPEND CMAKE_C_FLAGS_RELEASE " -O2")
string(APPEND CMAKE_Fortran_FLAGS_RELEASE " -O2")
string(APPEND CPPDEFS " -DLINUX")
string(APPEND CMAKE_Fortran_FLAGS_DEBUG " -C -traceback -Mchkfpstk -Mchkstk -Mdalign  -Mdepchk -Miomutex -Mrecursive  -Meh_frame -Ktrap=fp")
if (COMP_NAME STREQUAL eam)
  string(APPEND CMAKE_Fortran_FLAGS " -Mnovect")
endif()
if (COMP_NAME STREQUAL cice)
  string(APPEND CMAKE_Fortran_FLAGS " -Mnovect")
endif()
set(PIO_FILESYSTEM_HINTS "lustre")
string(APPEND CMAKE_EXE_LINKER_FLAGS " -lpmi")
if (MPILIB STREQUAL impi)
  set(MPICC "mpipgcc")
  set(MPICXX "mpipgcxx")
  set(MPIFC "mpipgf90")
endif()
if (compile_threaded)
  string(APPEND KOKKOS_OPTIONS " -DKokkos_ENABLE_OPENMP=Off") # work-around for pgi/19.10 as kokkos has bld error with it 
endif()