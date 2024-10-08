`timescale 1ns / 1ps

module lcd_rgb_colorbar (
    input sys_clk_p,  // 系统差分输入时钟
    input sys_clk_n,  // 系统差分输入时钟
    input sys_rst_n,  // 系统复位

    // RGB LCD接口
    output        lcd_de,   // LCD 数据使能信号
    output        lcd_hs,   // LCD 行同步信号
    output        lcd_vs,   // LCD 场同步信号
    output        lcd_bl,   // LCD 背光控制信号
    output        lcd_clk,  // LCD 像素时钟
    output        lcd_rst,  // LCD 复位
    inout  [23:0] lcd_rgb   // LCD RGB888颜色数据
);

    // wire define
    wire [15:0] lcd_id;  // LCD屏ID
    wire        lcd_pclk;  // LCD像素时钟
    wire        lcd_clk_180;  // LCD像素时钟

    wire [10:0] pixel_xpos;  // 当前像素点横坐标
    wire [10:0] pixel_ypos;  // 当前像素点纵坐标
    wire [10:0] h_disp;  // LCD屏水平分辨率
    wire [10:0] v_disp;  // LCD屏垂直分辨率
    wire [23:0] pixel_data;  // 像素数据
    wire [23:0] lcd_rgb_o;  // 输出的像素数据
    wire [23:0] lcd_rgb_i;  // 输入的像素数据

    //*****************************************************
    //**                    main code
    //*****************************************************
    // 识别到ID为1018即10寸屏幕时，LCD 像素时钟取反
    assign lcd_clk = (lcd_id == 16'h1018) ? ~lcd_clk_180 : lcd_clk_180;

    // 转换差分信号
    IBUFDS diff_clock (
        .I (sys_clk_p),  // 系统差分输入时钟
        .IB(sys_clk_n),  // 系统差分输入时钟
        .O (sys_clk)     // 输出系统时钟
    );

    // 像素数据方向切换
    assign lcd_rgb   = lcd_de ? lcd_rgb_o : {24{1'bz}};
    assign lcd_rgb_i = lcd_rgb;

    // 读LCD ID模块
    rd_id u_rd_id (
        .clk    (sys_clk),
        .rst_n  (sys_rst_n),
        .lcd_rgb(lcd_rgb_i),
        .lcd_id (lcd_id)
    );

    // 时钟分频模块
    clk_div u_clk_div (
        .clk     (sys_clk),
        .rst_n   (sys_rst_n),
        .lcd_id  (lcd_id),
        .lcd_pclk(lcd_pclk)
    );

    // LCD显示模块
    lcd_display u_lcd_display (
        .lcd_pclk  (lcd_pclk),
        .rst_n     (sys_rst_n),
        .pixel_xpos(pixel_xpos),
        .pixel_ypos(pixel_ypos),
        .h_disp    (h_disp),
        .v_disp    (v_disp),
        .pixel_data(pixel_data)
    );

    // LCD驱动模块
    lcd_driver u_lcd_driver (
        .lcd_pclk  (lcd_pclk),
        .rst_n     (sys_rst_n),
        .lcd_id    (lcd_id),
        .pixel_data(pixel_data),
        .pixel_xpos(pixel_xpos),
        .pixel_ypos(pixel_ypos),
        .h_disp    (h_disp),
        .v_disp    (v_disp),

        .lcd_de (lcd_de),
        .lcd_hs (lcd_hs),
        .lcd_vs (lcd_vs),
        .lcd_bl (lcd_bl),
        .lcd_clk(lcd_clk_180),
        .lcd_rst(lcd_rst),
        .lcd_rgb(lcd_rgb_o)
    );

endmodule
