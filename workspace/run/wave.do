onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/INRGB_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/RGBLP_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/RGBTR_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SHARP_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/BLURE_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/EMBOS_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/YCBCR_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/CGAIN_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/CCGAIN_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/HSV_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/HSL_FRAME
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/img_width
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/img_height
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/s_data_width
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/i_data_width
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/clk
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/rst_l
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/lumThreshold
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/iThreshold
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/txCord
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/iRgb
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/iKcoeff
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oEdgeValid
add wave -noupdate -radix unsigned -childformat {{/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.sobel -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.embos -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.blur -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.sharp -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.cgain -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.ycbcr -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.hsl -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.hsv -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.inrgb -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.tPattern -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.colorTrm -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.colorLmp -radix unsigned}} -expand -subitemconfig {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.sobel {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.embos {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.blur {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.sharp {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.cgain {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.ycbcr {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.hsl {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.hsv {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.inrgb {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.tPattern {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.colorTrm {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb.colorLmp {-radix unsigned}} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/oRgb
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/rgbSyncValid
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/rgbMac1
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/rgbMac2
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/rgbMac3
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/kCoProd
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/init_channel
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/osobelX
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/osobelY
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/sobel
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/kCoefXSobel
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/kCoefYSobel
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/mx
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/my
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/sxy
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/sqr
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/sbof
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/sobelThreshSet
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/sobelThreshold
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/tp0
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/tp1
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/tp2
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/tpValid
add wave -noupdate -radix unsigned /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/ovalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/squareRoot_inst/aclk
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/squareRoot_inst/s_axis_a_tvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/squareRoot_inst/s_axis_a_tdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/squareRoot_inst/m_axis_result_tvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/squareRoot_inst/m_axis_result_tdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/clk
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/ivalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/idata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/ovalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/odata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/mFXtFoRtvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/mFXtFoRtdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/sFOSqTvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/sFOSqTdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/mFOSqRtvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/mFOSqRtdata
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/sFOtFxTvalid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/frameProcessInst/FiltersInst/ImageKernelInst/SOBEL_FRAME_ENABLE/squareRootTopInst/sFOtFxTdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {26218790199 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {20095756223 fs} {39532635193 fs}
