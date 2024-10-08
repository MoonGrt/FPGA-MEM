onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/u_axi_ram/clk
add wave -noupdate /tb_top/u_axi_ram/rst
add wave -noupdate /tb_top/u_axi_ram/s_axi_awid
add wave -noupdate /tb_top/u_axi_ram/s_axi_awaddr
add wave -noupdate /tb_top/u_axi_ram/s_axi_awlen
add wave -noupdate /tb_top/u_axi_ram/s_axi_awsize
add wave -noupdate /tb_top/u_axi_ram/s_axi_awburst
add wave -noupdate /tb_top/u_axi_ram/s_axi_awlock
add wave -noupdate /tb_top/u_axi_ram/s_axi_awcache
add wave -noupdate /tb_top/u_axi_ram/s_axi_awprot
add wave -noupdate /tb_top/u_axi_ram/s_axi_awvalid
add wave -noupdate /tb_top/u_axi_ram/s_axi_awready
add wave -noupdate /tb_top/u_axi_ram/s_axi_wdata
add wave -noupdate /tb_top/u_axi_ram/s_axi_wstrb
add wave -noupdate /tb_top/u_axi_ram/s_axi_wlast
add wave -noupdate /tb_top/u_axi_ram/s_axi_wvalid
add wave -noupdate /tb_top/u_axi_ram/s_axi_wready
add wave -noupdate /tb_top/u_axi_ram/s_axi_bid
add wave -noupdate /tb_top/u_axi_ram/s_axi_bresp
add wave -noupdate /tb_top/u_axi_ram/s_axi_bvalid
add wave -noupdate /tb_top/u_axi_ram/s_axi_bready
add wave -noupdate /tb_top/u_axi_ram/s_axi_arid
add wave -noupdate /tb_top/u_axi_ram/s_axi_araddr
add wave -noupdate /tb_top/u_axi_ram/s_axi_arlen
add wave -noupdate /tb_top/u_axi_ram/s_axi_arsize
add wave -noupdate /tb_top/u_axi_ram/s_axi_arburst
add wave -noupdate /tb_top/u_axi_ram/s_axi_arlock
add wave -noupdate /tb_top/u_axi_ram/s_axi_arcache
add wave -noupdate /tb_top/u_axi_ram/s_axi_arprot
add wave -noupdate /tb_top/u_axi_ram/s_axi_arvalid
add wave -noupdate /tb_top/u_axi_ram/s_axi_arready
add wave -noupdate /tb_top/u_axi_ram/s_axi_rid
add wave -noupdate /tb_top/u_axi_ram/s_axi_rdata
add wave -noupdate /tb_top/u_axi_ram/s_axi_rresp
add wave -noupdate /tb_top/u_axi_ram/s_axi_rlast
add wave -noupdate /tb_top/u_axi_ram/s_axi_rvalid
add wave -noupdate /tb_top/u_axi_ram/s_axi_rready
add wave -noupdate /tb_top/u_axi_ram/read_state_reg
add wave -noupdate /tb_top/u_axi_ram/read_state_next
add wave -noupdate /tb_top/u_axi_ram/write_state_reg
add wave -noupdate /tb_top/u_axi_ram/write_state_next
add wave -noupdate /tb_top/u_axi_ram/mem_wr_en
add wave -noupdate /tb_top/u_axi_ram/mem_rd_en
add wave -noupdate /tb_top/u_axi_ram/read_id_reg
add wave -noupdate /tb_top/u_axi_ram/read_id_next
add wave -noupdate /tb_top/u_axi_ram/read_addr_reg
add wave -noupdate /tb_top/u_axi_ram/read_addr_next
add wave -noupdate /tb_top/u_axi_ram/read_count_reg
add wave -noupdate /tb_top/u_axi_ram/read_count_next
add wave -noupdate /tb_top/u_axi_ram/read_size_reg
add wave -noupdate /tb_top/u_axi_ram/read_size_next
add wave -noupdate /tb_top/u_axi_ram/read_burst_reg
add wave -noupdate /tb_top/u_axi_ram/read_burst_next
add wave -noupdate /tb_top/u_axi_ram/write_id_reg
add wave -noupdate /tb_top/u_axi_ram/write_id_next
add wave -noupdate /tb_top/u_axi_ram/write_addr_reg
add wave -noupdate /tb_top/u_axi_ram/write_addr_next
add wave -noupdate /tb_top/u_axi_ram/write_count_reg
add wave -noupdate /tb_top/u_axi_ram/write_count_next
add wave -noupdate /tb_top/u_axi_ram/write_size_reg
add wave -noupdate /tb_top/u_axi_ram/write_size_next
add wave -noupdate /tb_top/u_axi_ram/write_burst_reg
add wave -noupdate /tb_top/u_axi_ram/write_burst_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_awready_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_awready_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_wready_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_wready_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_bid_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_bid_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_bvalid_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_bvalid_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_arready_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_arready_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_rid_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_rid_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_rdata_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_rlast_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_rlast_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_rvalid_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_rvalid_next
add wave -noupdate /tb_top/u_axi_ram/s_axi_rid_pipe_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_rdata_pipe_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_rlast_pipe_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_rvalid_pipe_reg
add wave -noupdate /tb_top/u_axi_ram/s_axi_awaddr_valid
add wave -noupdate /tb_top/u_axi_ram/s_axi_araddr_valid
add wave -noupdate /tb_top/u_axi_ram/read_addr_valid
add wave -noupdate /tb_top/u_axi_ram/write_addr_valid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 4} {1097141 ps} 0} {{Cursor 2} {699551623 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 180
configure wave -valuecolwidth 40
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
configure wave -timelineunits ps
update
WaveRestoreZoom {123996 ps} {2115946 ps}
