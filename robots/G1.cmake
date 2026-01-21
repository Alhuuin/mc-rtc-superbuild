option(WITH_G1 "Build with Unitree's G1 robot support" OFF)

if(NOT WITH_G1)
  return()
endif()

AddCatkinProject(
  g1_description
  GITHUB_PRIVATE Alhuuin/g1_description
  GIT_TAG origin/main
  WORKSPACE data_ws
)

#find_package(mc_mujoco QUIET)

if(mc_mujoco_FOUND)
  AddProject(
    g1_mj_description
    GITHUB_PRIVATE Alhuuin/g1_mj_description
    GIT_TAG origin/main
    DEPENDS mc_rtc
  )
endif()

AddProject(
  mc_g1
  GITHUB_PRIVATE isri-aist/mc_g1
  GIT_TAG origin/main
  DEPENDS mc_rtc
)

AddProject(
  unitree_sdk2
  GITHUB isri-aist/unitree_sdk2
  GIT_TAG aist/devel-mc_unitree2
)

ExternalProject_Get_Property(unitree_sdk2 SOURCE_DIR)

AddProject(
  mc_unitree2
  GITHUB_PRIVATE bastien-muraccioli/mc_unitree2
  GIT_TAG origin/safe-rl-qp
  CMAKE_ARGS -DGENERATE_H1_CONTROLLER=ON -DGENERATE_GO2_CONTROLLER=ON -DUNITREE_SDK2_SRC_DIR=${SOURCE_DIR}
                                         -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  DEPENDS mc_rtc unitree_sdk2
)
