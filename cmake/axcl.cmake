# AXERA is pleased to support the open source community by making ax-samples available.
#
# Copyright (c) 2024, Axera Semiconductor Co., Ltd. All rights reserved.
#
# Licensed under the BSD 3-Clause License (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# https://opensource.org/licenses/BSD-3-Clause
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# Author: ls.wang
#

function(axera_example example_name)
    add_executable(${example_name})

    foreach (file IN LISTS ARGN)
        target_sources(${example_name} PRIVATE ${file})
    endforeach ()

    target_sources(${example_name} PRIVATE ${CMAKE_SOURCE_DIR}/examples/axcl/ax_model_runner/ax_model_runner_axcl.cpp)

    target_include_directories(${example_name} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR} ${BSP_MSP_DIR}/include)

    # opencv
    target_link_libraries(${example_name} PRIVATE ${OpenCV_LIBS})

    target_link_libraries(${example_name} PRIVATE spdlog axcl_pcie_dma axcl_pcie_msg axcl_token axcl_comm axcl_pkg axcl_rt)

    target_compile_options (${example_name} PUBLIC $<$<COMPILE_LANGUAGE:C,CXX>: -O3>)

    install(TARGETS ${example_name} DESTINATION bin)
endfunction()
