onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/clk
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/rst_l
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/videoChannel
add wave -noupdate -childformat {{/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/txCord.x -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/txCord.y -radix unsigned}} -expand -subitemconfig {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/txCord.x {-radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/txCord.y {-radix unsigned}} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/txCord
add wave -noupdate -expand /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/location
add wave -noupdate -expand /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/iRgb
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/oRgb
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/grid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/pixOn
add wave -noupdate -divider PixelOnDisplay
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/clk
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/rst_l
add wave -noupdate -childformat {{/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/location.x -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/location.y -radix unsigned}} -expand -subitemconfig {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/location.x {-height 15 -radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/location.y {-height 15 -radix unsigned}} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/location
add wave -noupdate -childformat {{/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/grid.x -radix unsigned} {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/grid.y -radix unsigned}} -expand -subitemconfig {/top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/grid.x {-height 15 -radix unsigned} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/grid.y {-height 15 -radix unsigned}} /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/grid
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/videoChannel
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/pixel
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/displayText
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/vChannelSelect
add wave -noupdate -radix decimal /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/fontAddress
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/charBitInRow
add wave -noupdate -radix decimal /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/charCode
add wave -noupdate -radix decimal /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/charPosition
add wave -noupdate -radix decimal /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/bitPosition
add wave -noupdate /top/vfp_dut/dutVFP_v1Inst/VideoStreamInst/videoSelectInst/TextGenYcbcrInst/textElement2/NU_MRGB_TYPES
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25110000000 fs} 0}
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
WaveRestoreZoom {21763035967 fs} {26018119382 fs}
