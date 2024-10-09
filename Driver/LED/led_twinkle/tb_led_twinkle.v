`timescale 1ns / 1ps

module tb_led_twinkle ();

    // ����
    reg sys_clk_p;
    reg sys_clk_n;
    reg sys_rst_n;

    // ���
    wire [1:0] led;

    // �źų�ʼ��
    initial begin
        sys_clk_p = 1'b0;
        sys_clk_n = 1'b1;
        sys_rst_n = 1'b0;
        #200 sys_rst_n = 1'b1;
    end

    // ����ʱ��
    always #5 sys_clk_p = ~sys_clk_p;
    always #5 sys_clk_n = ~sys_clk_n;

    // �����������
    led_twinkle u_led_twinkle (
        .sys_clk_p(sys_clk_p),
        .sys_clk_n(sys_clk_n),
        .sys_rst_n(sys_rst_n),
        .led      (led)
    );

endmodule