class cell_unit extends uvm_object;
  `uvm_object_utils(cell_unit)
    cell_set selected_box;

    rand int red;
    rand int gre;
    rand int blu;
    bit[7:0] rgb_red_data;
    bit[7:0] rgb_gre_data;
    bit[7:0] rgb_blu_data;
    int red_test = 0;
    int gre_test = 0;
    int blu_test = 0;
    
    bit[7:0] set_cell_red;
    bit[7:0] set_cell_gre;
    bit[7:0] set_cell_blu;
    
    constraint c_red_stim {
    if (red_test==0) {
        red == 100;
    } else
        if (red_test==1) {
            red == 255;
        }else
            if (red_test==2) {
                red inside {[1:50]};
            }else
                if (red_test==3) {
                    red inside {[51:100]};
                }else
                    if (red_test==4) {
                        red inside {[101:150]};
                    }else
                        if (red_test==5) {
                            red inside {[151:200]};
                        }else
                            if (red_test==6) {
                                red inside {[201:255]};
                            }else
                                red == set_cell_red;
    }
    
    constraint c_gre_stim {
    if (gre_test==0) {
        gre == 100;
    } else
        if (gre_test==1) {
            gre == 255;
        }else
            if (gre_test==2) {
                gre inside {[1:50]};
            }else
                if (gre_test==3) {
                    gre inside {[51:100]};
                }else
                    if (gre_test==4) {
                        gre inside {[101:150]};
                    }else
                        if (gre_test==5) {
                            gre inside {[151:200]};
                        }else
                            if (gre_test==6) {
                                gre inside {[201:255]};
                            }else
                                gre == set_cell_gre;
    }
    
    constraint c_blu_stim {
    if (blu_test==0) {
        blu == 100;
    } else
        if (blu_test==1) {
            blu == 255;
        }else
            if (blu_test==2) {
                blu inside {[1:50]};
            }else
                if (blu_test==3) {
                    blu inside {[51:100]};
                }else
                    if (blu_test==4) {
                        blu inside {[101:150]};
                    }else
                        if (blu_test==5) {
                            blu inside {[151:200]};
                        }else
                            if (blu_test==6) {
                                blu inside {[201:255]};
                            }else
                                blu == set_cell_blu;
    }

    
    function new(string name = "cell_unit");
        super.new(name);
    endfunction: new
    
    
    function void pre_call(input cell_set selected_box,int incre,set_cell_r,set_cell_g,set_cell_b);

    set_cell_red = set_cell_r + incre + offset_r;
    set_cell_gre = set_cell_g + incre + offset_g;
    set_cell_blu = set_cell_b + incre + offset_b;
    
    if(selected_box == sun) begin
        red_test = 0;
        gre_test = $urandom_range(0,6);
        blu_test = 0;
    end else if (selected_box == mon) begin
        red_test = 0;
        gre_test = 7;
        blu_test = 0;
    end else if (selected_box == rgb_incrementer) begin
        red_test = 7;
        gre_test = 7;
        blu_test = 7;
    end else if (selected_box == thu) begin
        red_test = 0;
        gre_test = 0;
        blu_test = 0;
    end else if (selected_box == fri) begin
        red_test = 0;
        gre_test = 4;
        blu_test = 0;
    end else if (selected_box == red1) begin
        red_test = 0;
        gre_test = 3;
        blu_test = 0;
    end else if (selected_box == rgb_000_000_black) begin
        red_test = 1;
        gre_test = 3;
        blu_test = 0;
    end else if (selected_box == rgb_001_050_dark) begin
        red_test = 2;
        gre_test = 2;
        blu_test = 2;
    end else if (selected_box == rgb_051_100_med_dark) begin
        red_test = 3;
        gre_test = 3;
        blu_test = 3;
    end else if (selected_box == rgb_101_150_medium) begin
        red_test = 4;
        gre_test = 4;
        blu_test = 4;
    end else if (selected_box == rgb_151_200_med_light) begin
        red_test = 5;
        gre_test = 5;
        blu_test = 5;
    end else if (selected_box == rgb_201_255_light) begin
        red_test = 6;
        gre_test = 6;
        blu_test = 6;
    end else if (selected_box == rgb_255_255_white) begin
        red_test = 1;
        gre_test = 1;
        blu_test = 1;
    end else begin
        red_test = 0;
        gre_test = 1;
        blu_test = 0;
    end
    

    endfunction: pre_call
endclass: cell_unit

class set_cell_unit extends cell_unit;
    `uvm_object_utils(set_cell_unit)
    
    function new(string name = "set_cell_unit");
        super.new(name);
        selected_box = sun;
    endfunction: new
    
    function void pre_call_set(int set_increment,set_cell_red,set_cell_gre,set_cell_blu);
        pre_call(selected_box,set_increment,set_cell_red,set_cell_gre,set_cell_blu);
    endfunction: pre_call_set
    
endclass: set_cell_unit

class per_cell extends set_cell_unit;
    `uvm_object_utils(per_cell)
    
    function new(string name = "per_cell");
        super.new(name);
        selected_box = sun;
    endfunction: new
    
    function void pre_randomize_call(input cell_set choices,int set_increment,set_cell_red,set_cell_gre,set_cell_blu);
        selected_box = choices;
        pre_call_set(set_increment,set_cell_red,set_cell_gre,set_cell_blu);
    endfunction: pre_randomize_call
    
endclass: per_cell


class per_set_rows extends uvm_object;
    `uvm_object_utils(per_set_rows)
    string  obj_name;
    per_cell c_block[];
    
    int c_block_size;
    int set_cell_per_r_red;
    int set_cell_per_r_gre;
    int set_cell_per_r_blu;
    int set_r_red;
    int set_r_gre;
    int set_r_blu;
    
    function new(string name = "per_set_rows");
        super.new(name);
        obj_name = name;
        c_block    = new[1];
        c_block_size = c_block.size;

    endfunction: new
    virtual function create_c_block_arrays(int c_size = 5);
        c_block    = new[c_size];
        foreach(c_block[i])
        begin
            c_block[i] = per_cell::type_id::create($sformatf("c_block_%0d",i));
        end   
        c_block_size = c_block.size;
    endfunction: create_c_block_arrays
    
    function void per_rows_call(input cell_set choices,int set_increment,set_cell_per_r_red,set_cell_per_r_gre,set_cell_per_r_blu,ar_size);
    create_c_block_arrays(ar_size);

        for(int i = 0; i < c_block_size; i++) begin
            c_block[i].pre_randomize_call(choices,set_increment,set_cell_per_r_red,set_cell_per_r_gre,set_cell_per_r_blu);
            c_block[i].randomize();
            set_cell_per_r_red = c_block[i].set_cell_red;
            set_cell_per_r_gre = c_block[i].set_cell_red;
            set_cell_per_r_blu = c_block[i].set_cell_red;
        end
        
        set_r_red = set_cell_per_r_red;
        set_r_gre = set_cell_per_r_gre;
        set_r_blu = set_cell_per_r_blu;
    endfunction: per_rows_call


    virtual function string convert2string();
        string contents = "";
        $sformat(contents, "%s obj_name=%s\n", contents, obj_name);
        foreach(c_block[i]) begin
        $sformat(contents, "%s c_block[%0d].set_cell_red=%0d\n", contents, i, c_block[i].red);
        end
        return contents;
    endfunction: convert2string

    
endclass: per_set_rows


class per_set_cols extends uvm_object;
    `uvm_object_utils(per_set_cols)
    string  obj_name;
    per_set_rows c_rows[];
    int c_rows_size;
    int per_set_cols_r_red;
    
    function new(string name = "per_set_cols");
        super.new(name);
        obj_name = name;
        c_rows = new[1];
        c_rows_size = c_rows.size;
    endfunction: new

    virtual function create_arrays(int c_size = 5);
        c_rows    = new[c_size];
        foreach(c_rows[i])
        begin
            c_rows[i] = per_set_rows::type_id::create($sformatf("c_rows_%0d",i));
        end   
        c_rows_size = c_rows.size;
    endfunction: create_arrays

    function void per_cols_call(input cell_set choices,int set_increment,set_cell_per_r_red,set_cell_per_r_gre,set_cell_per_r_blu,ar_size);
        $display("set choices:%s\n ", choices);
        for(int i = 0; i < c_rows_size; i++) begin
            c_rows[i].per_rows_call(choices,set_increment,set_cell_per_r_red,set_cell_per_r_gre,set_cell_per_r_blu,ar_size);
            set_cell_per_r_red = c_rows[i].set_r_red;
            set_cell_per_r_gre = c_rows[i].set_r_gre;
            set_cell_per_r_blu = c_rows[i].set_r_blu;
        end
    endfunction: per_cols_call


    virtual function string convert2string();
        string contents = "";
        $sformat(contents, "%s obj_name=%s", contents, obj_name);
        foreach(c_rows[i]) begin
        `uvm_info("", c_rows[i].convert2string(), UVM_NONE)
        end
        return contents;
    endfunction: convert2string

    
endclass: per_set_cols


class cell_box extends uvm_object;
    `uvm_object_utils(cell_box)
    string  obj_name;
    int set_cell_red;
    //cell_set choices;
    rand per_set_cols c_blocker;
    rand cell_set my_choices;
    function new(string name = "cell_box");
        super.new(name);
        obj_name = name;
        c_blocker  = per_set_cols::type_id::create("c_blocker");
    endfunction: new

    
    function void pre_randomize();
    endfunction: pre_randomize


    function void re_gen_cell_box(input int outter_size,inner_size,set_cell_red,set_cell_gre,set_cell_blu,set_incr,cell_set choices);
        c_blocker.create_arrays(outter_size);

        c_blocker.per_cols_call(choices,set_incr,set_cell_red,set_cell_gre,set_cell_blu,inner_size);

        //`uvm_info("",c_blocker.convert2string(), UVM_NONE)
    endfunction: re_gen_cell_box



endclass