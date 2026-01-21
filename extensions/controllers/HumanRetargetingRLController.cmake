include(${CMAKE_CURRENT_LIST_DIR}/../controllers/BaseLineWalkingController.cmake)

AddProject(HumanRetargetingRLController
  GITHUB_PRIVATE Alhuuin/HumanRetargetingRLController
  GIT_TAG origin/master
  DEPENDS mc_rtc
)

