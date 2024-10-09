`timescale 1ns / 1ps

module lcd_rgb_colorbar (
    input sys_clk_p,  // ϵͳ�������ʱ��
    input sys_clk_n,  // ϵͳ�������ʱ��
    input sys_rst_n,  // ϵͳ��λ

    // RGB LCD�ӿ�
    output        lcd_de,   // LCD ����ʹ���ź�
    output        lcd_hs,   // LCD ��ͬ���ź�
    output        lcd_vs,   // LCD ��ͬ���ź�
    output        lcd_bl,   // LCD ��������ź�
    output        lcd_clk,  // LCD ����ʱ��
    output        lcd_rst,  // LCD ��λ
    inout  [23:0] lcd_rgb   // LCD RGB888��ɫ����
);

    // wire define
    wire [15:0] lcd_id;  // LCD��ID
    wire        lcd_pclk;  // LCD����ʱ��
    wire        lcd_clk_180;  // LCD����ʱ��

    wire [10:0] pixel_xpos;  // ��ǰ���ص������
    wire [10:0] pixel_ypos;  // ��ǰ���ص�������
    wire [10:0] h_disp;  // LCD��ˮƽ�ֱ���
    wire [10:0] v_disp;  // LCD����ֱ�ֱ���
    wire [23:0] pixel_data;  // ��������
    wire [23:0] lcd_rgb_o;  // �������������
    wire [23:0] lcd_rgb_i;  // �������������

    //*****************************************************
    //**                    main code
    //*****************************************************
    // ʶ��IDΪ1018��10����Ļʱ��LCD ����ʱ��ȡ��
    assign lcd_clk = (lcd_id == 16'h1018) ? ~lcd_clk_180 : lcd_clk_180;

    // ת������ź�
    IBUFDS diff_clock (
        .I (sys_clk_p),  // ϵͳ�������ʱ��
        .IB(sys_clk_n),  // ϵͳ�������ʱ��
        .O (sys_clk)     // ���ϵͳʱ��
    );

    // �������ݷ����л�
    assign lcd_rgb   = lcd_de ? lcd_rgb_o : {24{1'bz}};
    assign lcd_rgb_i = lcd_rgb;

    // ��LCD IDģ��
    rd_id u_rd_id (
        .clk    (sys_clk),
        .rst_n  (sys_rst_n),
        .lcd_rgb(lcd_rgb_i),
        .lcd_id (lcd_id)
    );

    // ʱ�ӷ�Ƶģ��
    clk_div u_clk_div (
        .clk     (sys_clk),
        .rst_n   (sys_rst_n),
        .lcd_id  (lcd_id),
        .lcd_pclk(lcd_pclk)
    );

    // LCD��ʾģ��
    lcd_display u_lcd_display (
        .lcd_pclk  (lcd_pclk),
        .rst_n     (sys_rst_n),
        .pixel_xpos(pixel_xpos),
        .pixel_ypos(pixel_ypos),
        .h_disp    (h_disp),
        .v_disp    (v_disp),
        .pixel_data(pixel_data)
    );

    // LCD����ģ��
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