`timescale 1ns / 1ps

module Ifetc32(Instruction,branch_base_addr,Addr_result,Read_data_1,Branch,nBranch,Jmp,Jal,Jr,Zero,clock,reset,link_addr);
    output[31:0] Instruction;			// ????PC???????????prgrom??????????
    output[31:0] branch_base_addr;      // ???????????????????????????(pc+4)????ALU
    output reg [31:0] link_addr;             // JAL???????PC+4,????regiser?��?$ra
    
    input        clock,reset;           //?????��,??��????????PC??????????��????????��
    //from ALU
    input [31:0]  Addr_result;          // ????ALU,?ALU?????????????
    input        Zero;                  //????ALU??Zero?1???????????????????????
    //from decoder
    input [31:0]  Read_data_1;           // ????Decoder??jr????????
    //from controller
    input        Branch;                // while Branch is 1, it means current instruction is beg
    input        nBranch;               // while nBranch is 1, it means current instruction is bnq
    input        Jmp;                   // while Jmp is 1, it means current instruction is jump
    input        Jal;                   // while Jal is 1, it means current instruction is jal
    input        Jr;                   // while Jr is 1, it means current instruction is jr
    reg [31:0] PC, Next_PC;
    assign branch_base_addr = PC + 32'h4;
    
     //???????????????????????????????????????????????????????????????????PC???
     prgrom instmem(
         .clka(clock),
         .addra(PC[15:2]),
         .douta(Instruction)
     );
    
    always @* begin
        if(((Branch == 1)&&(Zero == 1)) || ((nBranch == 1) && (Zero == 0)))
            Next_PC = Addr_result;
        else if(Jr == 1)
            Next_PC = Read_data_1;
        else
            Next_PC = PC + 32'h4;
    end
    
    //?????????????PC
    always @(negedge clock) begin
        if(reset == 1)
            PC <= 32'h0;
        //??????????????????????????JUMP??JAL??jump and link??
        else if(Jmp == 1) begin  //jump?????????????��????????????????????26��????????????
            PC <= {PC[31:28], Instruction[25:0],2'b00};
        end
        else if(Jal == 1) begin
            PC <= {PC[31:28], Instruction[25:0],2'b00};
            link_addr <= PC + 32'h4;
        end
        else PC <= Next_PC;
    end
  
endmodule