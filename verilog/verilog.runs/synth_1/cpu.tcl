# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tfgg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.cache/wt} [current_project]
set_property parent.project_path {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.xpr} [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths {{f:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/SEU_CSE_507_user_uart_bmpg_1.3}} [current_project]
set_property ip_output_repo {f:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/mips/test1/prgmip32.coe}}
add_files {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/mips/test1/dmem32.coe}}
add_files {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/mips/test1/prgmip32_scene1.coe}}
add_files {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/mips/test1/dmem32_scene1.coe}}
add_files {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/mips/Minisys1Assemblerv2.2/output/prgmip32.coe}}
add_files {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/mips/Minisys1Assemblerv2.2/output/dmem32.coe}}
read_verilog -library xil_defaultlib {
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/Ifetc32_Uart.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/ProgramROM_UART.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/beep.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/clkout_cpu.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/control32.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/decode32.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/dmem32_uart.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/executs32.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/leds.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/memOrIO.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/show.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/switchs.v}
  {F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/new/cpu.v}
}
read_ip -quiet {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/RAM/RAM.xci}}
set_property used_in_implementation false [get_files -all {{f:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/RAM/RAM_ooc.xdc}}]

read_ip -quiet {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/prgrom/prgrom.xci}}
set_property used_in_implementation false [get_files -all {{f:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/prgrom/prgrom_ooc.xdc}}]

read_ip -quiet {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/uart_bmpg_0_1/uart_bmpg_0.xci}}

read_ip -quiet {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg.xci}}
set_property used_in_implementation false [get_files -all {{f:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_board.xdc}}]
set_property used_in_implementation false [get_files -all {{f:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg.xdc}}]
set_property used_in_implementation false [get_files -all {{f:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/constrs_1/new/cpu.xdc}}
set_property used_in_implementation false [get_files {{F:/Computer Organization/Project/CS214-Computer-Organization-Project/verilog/verilog.srcs/constrs_1/new/cpu.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top cpu -part xc7a100tfgg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef cpu.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file cpu_utilization_synth.rpt -pb cpu_utilization_synth.pb"