include(${CMAKE_CURRENT_LIST_DIR}/../controllers/BaseLineWalkingController.cmake)

if(ROS_IS_ROS2)
  AddProject(HumanRetargetingController
    GITHUB Alhuuin/HumanRetargetingController
    GIT_TAG origin/dev
    DEPENDS BaseLineWalkingController
  )
else()
  AddProject(HumanRetargetingController
    GITHUB Alhuuin/HumanRetargetingController
    GIT_TAG origin/dev
    DEPENDS BaseLineWalkingController
  )
endif()
