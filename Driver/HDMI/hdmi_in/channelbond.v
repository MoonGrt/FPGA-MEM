`timescale 1ns / 1ps

module channelbond (
    input            clk,
    input      [9:0] rawdata,
    input            iamvld,
    input            other_ch0_vld,
    input            other_ch1_vld,
    input            other_ch0_rdy,
    input            other_ch1_rdy,
    output reg       iamrdy,
    output reg [9:0] sdata
);

    // parameter define
    parameter CTRLTOKEN0 = 10'b1101010100;
    parameter CTRLTOKEN1 = 10'b0010101011;
    parameter CTRLTOKEN2 = 10'b0101010100;
    parameter CTRLTOKEN3 = 10'b1010101011;

    // reg define
    reg  [3:0] wa;  // 写ram地址
    reg  [3:0] ra;  // 读ram地址
    reg        we;  // 写ram使能
    reg        rcvd_ctkn;  // 控制字符使能
    reg        rcvd_ctkn_d0;
    reg        rcvd_ctkn_pos;  // 控制字符上升沿
    reg        skip_line;  // 跳过当前行使能
    reg        rawdata_vld_d0;
    reg        rawdata_vld_pos;  // 数据全部校准完成使能上升沿
    reg        ra_en;  // 读使能

    // wire define
    wire       rawdata_vld;  // 数据全部校准完成使能
    wire [9:0] dpfo_dout;  // ram输出数据
    wire       next_rcvd_ctkn_pos;  // 同步信号准备好信号

    // *****************************************************
    // **                    main code
    // *****************************************************

    assign rawdata_vld = other_ch0_vld & other_ch1_vld & iamvld;
    assign next_rcvd_ctkn_pos = skip_line & rcvd_ctkn_pos;


    //  FIFO Write Control Logic
    always @(posedge clk) begin
        we <= #1 rawdata_vld;
    end

    always @(posedge clk) begin
        if (rawdata_vld) wa <= #1 wa + 1'b1;
        else wa <= #1 4'h0;
    end

    DRAM16XN #(
        .data_width(10)
    ) cbfifo_i (
        .DATA_IN      (rawdata),
        .ADDRESS      (wa),
        .ADDRESS_DP   (ra),
        .WRITE_EN     (we),
        .CLK          (clk),
        .O_DATA_OUT   (),
        .O_DATA_OUT_DP(dpfo_dout)
    );

    always @(posedge clk) begin
        sdata <= #1 dpfo_dout;
    end

    ////////////////////////////////////////////////////////
    // FIFO read Control Logic
    ////////////////////////////////////////////////////////

    ////////////////////////////////
    // Use blank period beginning
    // as a speical marker to
    // align all channel together
    ////////////////////////////////

    always @(posedge clk) begin
        rcvd_ctkn <=#1 ((sdata == CTRLTOKEN0) || (sdata == CTRLTOKEN1) || (sdata == CTRLTOKEN2) || (sdata == CTRLTOKEN3));
        rcvd_ctkn_d0 <= #1 rcvd_ctkn;
        rcvd_ctkn_pos <= #1 !rcvd_ctkn_d0 & rcvd_ctkn;
    end

    /////////////////////////////
    //skip the current line
    /////////////////////////////

    always @(posedge clk) begin
        if (!rawdata_vld) skip_line <= #1 1'b0;
        else if (rcvd_ctkn_pos) skip_line <= #1 1'b1;
    end

    //////////////////////////////
    //Declare my own readiness
    //////////////////////////////
    always @(posedge clk) begin
        if (!rawdata_vld) iamrdy <= #1 1'b0;
        else if (next_rcvd_ctkn_pos) iamrdy <= #1 1'b1;
    end

    always @(posedge clk) begin
        rawdata_vld_d0  <= #1 rawdata_vld;
        rawdata_vld_pos <= #1 rawdata_vld & !rawdata_vld_d0;
    end

    //////////////////////////////////////////////////////////////////////////////////////////
    // 1. FIFO flow through first when all channels are found valid(phase aligned)
    // 2. When the speical marker on my channel is found, the fifo read is hold
    // 3. Until the same markers are found across all three channels, the fifo read resumes
    //////////////////////////////////////////////////////////////////////////////////////////

    always @(posedge clk) begin
        if (rawdata_vld_pos || (other_ch0_rdy & other_ch1_rdy & iamrdy)) ra_en <= #1 1'b1;
        else if (next_rcvd_ctkn_pos && !(other_ch0_rdy & other_ch1_rdy & iamrdy)) ra_en <= #1 1'b0;
    end

    /////////////////////////////////////////
    //FIFO Read Address Counter
    /////////////////////////////////////////
    always @(posedge clk) begin
        if (!rawdata_vld) ra <= #1 4'h0;
        else if (ra_en) ra <= #1 ra + 1'b1;
    end

endmodule
