// MODULE : ADDER [TEMPLATE]
module adder(tp_if.templateSlave tp_vif);
    template dut (
   .clk         (tp_vif.sig_clock),
   .en_i        (tp_vif.sig_en_i),
   .ina         (tp_vif.sig_ina),
   .inb         (tp_vif.sig_inb),
   .en_o        (tp_vif.sig_en_o),
   .out_c       (tp_vif.sig_out));
endmodule: adder