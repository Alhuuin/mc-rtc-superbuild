include(${CMAKE_CURRENT_LIST_DIR}/apt-dependencies.cmake)

AddProject(blasfeo
  GITHUB giaf/blasfeo
  GIT_TAG origin/master
  CMAKE_ARGS -DBUILD_SHARED_LIBS=ON -DTARGET=X64_AUTOMATIC -DBLASFEO_EXAMPLES=OFF -DMF:STRING=COLMAJ -DLA:STRING=REFERENCE -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  PATCH_COMMAND sed -i -e "s/set(BLASFEO_HP_API OFF)/set(BLASFEO_HP_API ON)/" -e "s/\\t\\tendif()\\n\\n\\tendif()/\\t\\telse()\\n\\n\\t\\t\\tif(\$\{DP_ROUTINES\})\\n\\t\\t\\t\\tlist(APPEND BLASFEO_SRC \$\{REF_BLAS_DP_SRC\})\\n\\t\\t\\tendif()\\n\\t\\t\\tif(\$\{SP_ROUTINES\})\\n\\t\\t\\t\\tlist(APPEND BLASFEO_SRC \$\{REF_BLAS_SP_SRC\})\\n\\t\\t\\tendif()\\n\\n\\t\\tendif()\\n\\n\\tendif()/" <SOURCE_DIR>/CMakeLists.txt
)
