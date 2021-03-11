set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; #IO_L6N_T0_D08_VREF_14 Sch=sw[2]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; #IO_L13N_T2_MRCC_14 Sch=sw[3]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { sw[4] }]; #IO_L12N_T1_MRCC_14 Sch=sw[4]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { sw[5] }]; #IO_L7N_T1_D10_14 Sch=sw[5]



set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { out[0] }]; #IO_L11N_T1_SRCC_14 Sch=led17_r
set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { out[1] }]; #IO_0_14 Sch=led17_g
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { out[2] }]; #IO_L15N_T2_DQS_ADV_B_15 Sch=led17_b
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { out[3] }]; #IO_L11P_T1_SRCC_14 Sch=led16_r
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { out[4] }]; #IO_L10P_T1_D14_14 Sch=led16_g
set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { out[5] }]; #IO_L5P_T0_D06_14 Sch=led16_b
