//This class provides an analysis export for receiving transactions 
//from a connected analysis export.  Making such a connection this 
//component to any transactions emitted by the connected analysis port
class d5m_camera_fc_subscriber extends uvm_subscriber#(d5m_camera_transaction);
    `uvm_component_utils(d5m_camera_fc_subscriber)
    
    d5m_camera_transaction d5m_txn;
    covergroup axi4_cg;
    
        WDATA_cp : coverpoint d5m_txn.axi4.WDATA[15:0] {
          option.at_least   = 1;
          bins rgb_sharp          = {10};
          bins edge_type          = {11};
          bins en_ycbcr_or_rgb    = {en_rgb};
          bins c_channel          = {15};
          bins bus_select         = {0};
          bins video_channel      = {selected_video_channel};
          bins kls_config         = {0};
          bins als_config         = {0};
        }
     vch_cp : coverpoint d5m_txn.axi4.WDATA[15:0] {
         option.at_least   = 1;
         bins v_ch_cga      = {select_cgain}            iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_sha      = {select_sharp}            iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_blu      = {select_blur}             iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_hsl      = {select_hsl}              iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_hsv      = {select_hsv}              iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_rgb      = {select_rgb}              iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_sob      = {select_sobel}            iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_emb      = {select_emboss}           iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_ycb      = {select_y_cb_cr}          iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_cga_cga  = {select_cgainToCgain}     iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_cga_sha  = {select_cgainToSharp}     iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_cga_hsl  = {select_cgainToHsl}       iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_cga_hsv  = {select_sharp}            iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_sob_cga  = {select_sobel_mask_cga}   iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_sob_sha  = {select_sobel_mask_shp}   iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_sob_blu  = {select_sobel_mask_blu}   iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_sob_hsl  = {select_sobel_mask_hsl}   iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_sob_hsv  = {select_sobel_mask_hsv}   iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_sob_rgb  = {select_sobel_mask_rgb}   iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_cga_ycb  = {select_cgainToYcbcr}     iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_rgb_cor  = {select_rgbCorrect}       iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_rgb_rem  = {select_rgbRemix}         iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_rgb_det  = {select_rgbDetect}        iff(d5m_txn.axi4.AWADDR == videoChannel);
         bins v_ch_rgb_poi  = {select_rgbPoi}           iff(d5m_txn.axi4.AWADDR == videoChannel);
     }
        AWADDR_cp : coverpoint d5m_txn.axi4.AWADDR[7:0] {
          option.at_least     = 1;
          bins reg00_rgb_sharp          = {oRgbOsharp};
          bins reg04_edge_type          = {oEdgeType};
          bins reg08_write_unused       = {8};
          bins reg12_bus_select         = {aBusSelect};
          bins reg16_threshold          = {threshold};
          bins reg20_video_channel      = {videoChannel};
          bins reg24_d_channel          = {dChannel};
          bins reg28_c_channel          = {cChannel};
          bins reg32_kls_k1             = {kls_k1};
          bins reg36_kls_k2             = {kls_k2};
          bins reg40_kls_k3             = {kls_k3};
          bins reg44_kls_k4             = {kls_k4};
          bins reg48_kls_k5             = {kls_k5};
          bins reg52_kls_k6             = {kls_k6};
          bins reg56_kls_k7             = {kls_k7};
          bins reg60_kls_k8             = {kls_k8};
          bins reg64_kls_k9             = {kls_k9};
          bins reg68_kls_config         = {kls_config};
          bins reg72_als_k1             = {als_k1};
          bins reg76_als_k2             = {als_k2};
          bins reg80_als_k3             = {als_k3};
          bins reg84_als_k4             = {als_k4};
          bins reg88_als_k5             = {als_k5};
          bins reg92_als_k6             = {als_k6};
          bins reg96_als_k7             = {als_k7};
          bins reg100_als_k8            = {als_k8};
          bins reg104_als_k9            = {als_k9};
          bins reg108_als_config        = {als_config};
          bins reg112_point_interest    = {pReg_pointInterest};
          bins reg116_delta_config      = {pReg_deltaConfig};
          bins reg120_cpu_ack_again     = {pReg_cpuAckGoAgain};
          bins reg124_cpu_wgrid_lock    = {pReg_cpuWgridLock};
          bins reg128_cpu_ack_off_frame = {pReg_cpuAckoffFrame};
          bins reg132_fifo_read_en_addr = {pReg_fifoReadAddress};
          bins reg136_clear_fifo_data   = {pReg_clearFifoData};
          bins reg200_rgb_coord_rl      = {rgbCoord_rl};
          bins reg204_rgb_coord_rh      = {rgbCoord_rh};
          bins reg208_rgb_coord_gl      = {rgbCoord_gl};
          bins reg212_rgb_coord_gh      = {rgbCoord_gh};
          bins reg216_rgb_coord_bl      = {rgbCoord_bl};
          bins reg220_rgb_coord_bh      = {rgbCoord_bh};
          bins reg224_lum_th            = {oLumTh};
          bins reg228_hsv_per_ch        = {oHsvPerCh};
          bins reg232_ycc_per_ch        = {oYccPerCh};
        }  

    endgroup: axi4_cg
    
    
   // vch_cp : coverpoint d5m_txn.axi4.WDATA[15:0] {
   //     option.at_least   = 1;
   //     bins v_ch_cga      = {select_cgain};
   //     bins v_ch_sha      = {select_sharp};
   //     bins v_ch_blu      = {select_blur};
   //     bins v_ch_hsl      = {select_hsl};
   //     bins v_ch_hsv      = {select_hsv};
   //     bins v_ch_rgb      = {select_rgb};
   //     bins v_ch_sob      = {select_sobel};
   //     bins v_ch_emb      = {select_emboss};
   // }
   // 
   // endgroup: vch_cp
    
    covergroup rgb_cg;
        red_cp : coverpoint d5m_txn.d5m.rgb[7:0] {
            bins red_000_000_black      = {0}       iff(d5m_txn.d5m.lvalid == 1'b1);
            bins red_001_025_darker     = {1,25}    iff(d5m_txn.d5m.lvalid == 1'b1);
            bins red_026_050_dark       = {26,50}   iff(d5m_txn.d5m.lvalid == 1'b1);
            bins red_051_100_med_dark   = {51,100}  iff(d5m_txn.d5m.lvalid == 1'b1);
            bins red_101_150_medium     = {101,150} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins red_151_200_med_light  = {151,200} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins red_201_255_light      = {201,254} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins red_255_255_white      = {255}     iff(d5m_txn.d5m.lvalid == 1'b1);
        }
        green_cp : coverpoint d5m_txn.d5m.rgb[15:8] {
            bins grn_000_000_black      = {0}       iff(d5m_txn.d5m.lvalid == 1'b1);
            bins grn_001_025_darker     = {1,25}    iff(d5m_txn.d5m.lvalid == 1'b1);
            bins grn_026_050_dark       = {26,50}   iff(d5m_txn.d5m.lvalid == 1'b1);
            bins grn_051_100_med_dark   = {51,100}  iff(d5m_txn.d5m.lvalid == 1'b1);
            bins grn_101_150_medium     = {101,150} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins grn_151_200_med_light  = {151,200} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins grn_201_255_light      = {201,254} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins grn_255_255_white      = {255}     iff(d5m_txn.d5m.lvalid == 1'b1);
        }
        blue_cp : coverpoint d5m_txn.d5m.rgb[23:16] {
            bins blu_000_000_black      = {0}       iff(d5m_txn.d5m.lvalid == 1'b1);
            bins blu_001_025_darker     = {1,25}    iff(d5m_txn.d5m.lvalid == 1'b1);
            bins blu_026_050_dark       = {26,50}   iff(d5m_txn.d5m.lvalid == 1'b1);
            bins blu_051_100_med_dark   = {51,100}  iff(d5m_txn.d5m.lvalid == 1'b1);
            bins blu_101_150_medium     = {101,150} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins blu_151_200_med_light  = {151,200} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins blu_201_255_light      = {201,254} iff(d5m_txn.d5m.lvalid == 1'b1);
            bins blu_255_255_white      = {255}     iff(d5m_txn.d5m.lvalid == 1'b1);
        }
        xCord_cp : coverpoint d5m_txn.d5m.x{
            bins left1_000_025          = {0,25};
            bins left2_026_050          = {26,50};
            bins middle_051_075         = {51,75};
            bins right1_076_100         = {76,100};
            bins right2_101_150         = {101,150};
            bins right3_151_200         = {151,200};
        }
        yCord_cp : coverpoint d5m_txn.d5m.y {
            bins top1_000_025           = {0,25};
            bins top2_026_050           = {26,50};
            bins middle_051_075         = {51,75};
            bins bottom1_076_100        = {76,100};
            bins bottom2_101_150        = {101,150};
            bins bottom3_151_200        = {151,200};
        }
        xCord_iff_cp : coverpoint d5m_txn.d5m.x[7:0] iff (d5m_txn.d5m.red > 100){
            option.at_least     = 1;
            option.auto_bin_max = 4;
        }
        yCord_iff_cp : coverpoint d5m_txn.d5m.y[7:0] iff (d5m_txn.d5m.red > 100){
            option.at_least     = 1;
            option.auto_bin_max = 4;
        }

        red_max_cp     : coverpoint d5m_txn.d5m.red   {option.at_least = 1;option.auto_bin_max = 5;}
        green_max_cp   : coverpoint d5m_txn.d5m.green {option.at_least = 1;option.auto_bin_max = 5;}
        blue_max_cp    : coverpoint d5m_txn.d5m.blue  {option.at_least = 1;option.auto_bin_max = 5;}
        
        cross_rgb      : cross      red_cp,     green_cp,     blue_cp;
        cross_rgb_auto : cross      red_max_cp, green_max_cp, blue_max_cp;
        cross_max_rgb  : cross      red_max_cp, green_max_cp, blue_max_cp, xCord_iff_cp, yCord_iff_cp;
        cross_iff_rgb  : cross      red_cp,     green_cp,     blue_cp,     xCord_iff_cp, yCord_iff_cp;
        
    endgroup: rgb_cg
    
    covergroup rgb_slave_cg;
        red_cp : coverpoint d5m_txn.d5m.red {
            bins red_000_000_black      = {0}       iff(d5m_txn.d5m.valid == 1'b1);
            bins red_001_025_darker     = {1,25}    iff(d5m_txn.d5m.valid == 1'b1);
            bins red_026_050_dark       = {26,50}   iff(d5m_txn.d5m.valid == 1'b1);
            bins red_051_100_med_dark   = {51,100}  iff(d5m_txn.d5m.valid == 1'b1);
            bins red_101_150_medium     = {101,150} iff(d5m_txn.d5m.valid == 1'b1);
            bins red_151_200_med_light  = {151,200} iff(d5m_txn.d5m.valid == 1'b1);
            bins red_201_255_light      = {201,254} iff(d5m_txn.d5m.valid == 1'b1);
            bins red_255_255_white      = {255}     iff(d5m_txn.d5m.valid == 1'b1);
        }
        green_cp : coverpoint d5m_txn.d5m.green {
            bins grn_000_000_black      = {0}       iff(d5m_txn.d5m.valid == 1'b1);
            bins grn_001_025_darker     = {1,25}    iff(d5m_txn.d5m.valid == 1'b1);
            bins grn_026_050_dark       = {26,50}   iff(d5m_txn.d5m.valid == 1'b1);
            bins grn_051_100_med_dark   = {51,100}  iff(d5m_txn.d5m.valid == 1'b1);
            bins grn_101_150_medium     = {101,150} iff(d5m_txn.d5m.valid == 1'b1);
            bins grn_151_200_med_light  = {151,200} iff(d5m_txn.d5m.valid == 1'b1);
            bins grn_201_255_light      = {201,254} iff(d5m_txn.d5m.valid == 1'b1);
            bins grn_255_255_white      = {255}     iff(d5m_txn.d5m.valid == 1'b1);
        }
        blue_cp : coverpoint d5m_txn.d5m.blue {
            bins blu_000_000_black      = {0}       iff(d5m_txn.d5m.valid == 1'b1);
            bins blu_001_025_darker     = {1,25}    iff(d5m_txn.d5m.valid == 1'b1);
            bins blu_026_050_dark       = {26,50}   iff(d5m_txn.d5m.valid == 1'b1);
            bins blu_051_100_med_dark   = {51,100}  iff(d5m_txn.d5m.valid == 1'b1);
            bins blu_101_150_medium     = {101,150} iff(d5m_txn.d5m.valid == 1'b1);
            bins blu_151_200_med_light  = {151,200} iff(d5m_txn.d5m.valid == 1'b1);
            bins blu_201_255_light      = {201,254} iff(d5m_txn.d5m.valid == 1'b1);
            bins blu_255_255_white      = {255}     iff(d5m_txn.d5m.valid == 1'b1);
        }
        
        rgb_black_white_cr: cross red_cp, green_cp, blue_cp{
            bins black = binsof(red_cp.red_000_000_black) && binsof(green_cp.grn_000_000_black) && binsof(blue_cp.blu_000_000_black);
            bins white = binsof(red_cp.red_255_255_white) && binsof(green_cp.grn_255_255_white) && binsof(blue_cp.blu_255_255_white);}

        
    endgroup: rgb_slave_cg
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        rgb_cg       = new; // Instantiate covergroup
        rgb_slave_cg = new; // Instantiate covergroup
        axi4_cg      = new; // Instantiate covergroup
    endfunction: new
    
    // The d5m_camera_transaction from the monitor is sampled by write function.
    function void write(d5m_camera_transaction t);
        //sample directive
        d5m_txn = t;
        rgb_cg.sample();
        rgb_slave_cg.sample();
        axi4_cg.sample();
    endfunction: write
    
endclass: d5m_camera_fc_subscriber