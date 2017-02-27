
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

set p_device "xc7z010clg225-1"
adi_project_create m2k

adi_project_files m2k [list \
  "../common/m2k_spi.v" \
  "system_top.v" \
  "system_constr.xdc" \
  "$ad_hdl_dir/library/xilinx/common/ad_iobuf.v"]

set_property is_enabled false [get_files  *system_sys_ps7_0.xdc]

set_msg_config -suppress -id {Common 17-55} -string {{CRITICAL WARNING: [Common 17-55] 'set_property' expects at least one object. [c:/workspace/hdl/projects/m2k/standalone/system_constr.xdc:74]
Resolution: If [get_<value>] was used to populate the object, check to make sure this command returns at least one valid object.} }
set_msg_config -suppress -id {Common 17-55} -string {{CRITICAL WARNING: [Common 17-55] 'set_property' expects at least one object. [c:/workspace/hdl/projects/m2k/standalone/system_constr.xdc:75]
Resolution: If [get_<value>] was used to populate the object, check to make sure this command returns at least one valid object.} }

adi_project_run m2k
