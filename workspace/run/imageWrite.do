onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/enImageText
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/enImageIndex
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/i_data_width
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/img_width_bmp
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/img_height_bmp
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/input_file
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/output_file
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/pixclk
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/enableWrite
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/doneWrite
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/iRgb
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/rgbData
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/Xcont
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/Ycont
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/wrImageFile
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/frameEnable
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/rgb
add wave -noupdate /top/imageRead_dut/imageReadInterfaceInst/imageWriteInst/imageCompleted
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6951234335 fs} 0}
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
WaveRestoreZoom {0 fs} {37842 ns}
