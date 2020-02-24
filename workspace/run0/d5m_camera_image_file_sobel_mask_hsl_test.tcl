vlib work
vlib msim

vlib msim/xbip_utils_v3_0_7
vlib msim/axi_utils_v2_0_3
vlib msim/xbip_pipe_v3_0_3
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_dsp48_addsub_v3_0_3
vlib msim/xbip_dsp48_multadd_v3_0_3
vlib msim/xbip_bram18k_v3_0_3
vlib msim/mult_gen_v12_0_12
vlib msim/floating_point_v7_1_4
vlib msim/xil_defaultlib

vmap xbip_utils_v3_0_7 msim/xbip_utils_v3_0_7
vmap axi_utils_v2_0_3 msim/axi_utils_v2_0_3
vmap xbip_pipe_v3_0_3 msim/xbip_pipe_v3_0_3
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_3 msim/xbip_dsp48_addsub_v3_0_3
vmap xbip_dsp48_multadd_v3_0_3 msim/xbip_dsp48_multadd_v3_0_3
vmap xbip_bram18k_v3_0_3 msim/xbip_bram18k_v3_0_3
vmap mult_gen_v12_0_12 msim/mult_gen_v12_0_12
vmap floating_point_v7_1_4 msim/floating_point_v7_1_4
vmap xil_defaultlib msim/xil_defaultlib 


vcom  -64 -93 -work xbip_utils_v3_0_7           -f C:/Images/REPOS/GitHub/compile_simlib/xbip_utils_v3_0_7/.cxl.vhdl.xbip_utils_v3_0_7.xbip_utils_v3_0_7.nt64.cmf
vcom  -64 -93 -work axi_utils_v2_0_3            -f C:/Images/REPOS/GitHub/compile_simlib/axi_utils_v2_0_3/.cxl.vhdl.axi_utils_v2_0_3.axi_utils_v2_0_3.nt64.cmf
vcom  -64 -93 -work xbip_pipe_v3_0_3            -f C:/Images/REPOS/GitHub/compile_simlib/xbip_pipe_v3_0_3/.cxl.vhdl.xbip_pipe_v3_0_3.xbip_pipe_v3_0_3.nt64.cmf
vcom  -64 -93 -work xbip_dsp48_wrapper_v3_0_4   -f C:/Images/REPOS/GitHub/compile_simlib/xbip_dsp48_wrapper_v3_0_4/.cxl.vhdl.xbip_dsp48_wrapper_v3_0_4.xbip_dsp48_wrapper_v3_0_4.nt64.cmf
vcom  -64 -93 -work xbip_dsp48_addsub_v3_0_3    -f C:/Images/REPOS/GitHub/compile_simlib/xbip_dsp48_addsub_v3_0_3/.cxl.vhdl.xbip_dsp48_addsub_v3_0_3.xbip_dsp48_addsub_v3_0_3.nt64.cmf
vcom  -64 -93 -work xbip_dsp48_multadd_v3_0_3   -f C:/Images/REPOS/GitHub/compile_simlib/xbip_dsp48_multadd_v3_0_3/.cxl.vhdl.xbip_dsp48_multadd_v3_0_3.xbip_dsp48_multadd_v3_0_3.nt64.cmf
vcom  -64 -93 -work xbip_bram18k_v3_0_3         -f C:/Images/REPOS/GitHub/compile_simlib/xbip_bram18k_v3_0_3/.cxl.vhdl.xbip_bram18k_v3_0_3.xbip_bram18k_v3_0_3.nt64.cmf
vcom  -64 -93 -work mult_gen_v12_0_12           -f C:/Images/REPOS/GitHub/compile_simlib/mult_gen_v12_0_12/.cxl.vhdl.mult_gen_v12_0_12.mult_gen_v12_0_12.nt64.cmf
vcom  -64 -93 -work floating_point_v7_1_4       -f C:/Images/REPOS/GitHub/compile_simlib/floating_point_v7_1_4/.cxl.vhdl.floating_point_v7_1_4.floating_point_v7_1_4.nt64.cmf

set INCLUDE_FILES_SRC_DIR "../../includes"
vcom -f ${INCLUDE_FILES_SRC_DIR}/dut_vhd.f
vlog -f ${INCLUDE_FILES_SRC_DIR}/dut_vlg.f
vlog -f ${INCLUDE_FILES_SRC_DIR}/tb_d5m_camera_test.f

vopt top -o top_optimized  +acc +cover=sbfec+top(rtl).
vsim top_optimized -coverage +UVM_TESTNAME=d5m_camera_image_file_sobel_mask_hsl_test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value d5m_camera_image_file_sobel_mask_hsl_test
coverage save d5m_camera_image_file_sobel_mask_hsl_test.ucdb
vcover report d5m_camera_image_file_sobel_mask_hsl_test.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/d5m_camera_image_file_sobel_mask_hsl_test -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/d5m_camera_image_file_sobel_mask_hsl_test.txt -byfile -totals -assert -directive -cvg -codeAll
quit





