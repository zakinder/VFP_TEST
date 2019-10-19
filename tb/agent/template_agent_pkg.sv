package template_agent_pkg;
  `include "../defin_lib.svh"
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "transaction/tp_transaction.svh"
  `include "sequence/template_sequence.svh"
  `include "configuration/template_config.svh"
  `include "driver/template_driver.svh"
  `include "monitor/template_monitor_fdut.svh"
  `include "monitor/template_monitor_predict.svh"
  `include "template_agent.svh"
  `include "coverage/template_scoreboard.svh"
endpackage:template_agent_pkg