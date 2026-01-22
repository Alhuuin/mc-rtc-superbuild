include(${CMAKE_CURRENT_LIST_DIR}/../controllers/rl_controller.cmake)

AddProject(HumanRetargetingRLController
  GITHUB_PRIVATE Alhuuin/HumanRetargetingRLController
  GIT_TAG origin/dev
  DEPENDS mc_rtc
)

