module config_cam(p_clock, vsync, href, enable, p_data,
                  pixel_data, pixel_valid, clk, addr, rw,
                  en, cen, data_in, data_out, frame_done,
                  rst, reset, SIOC, SIOD);

output p_clock;  //Pulso  // Variables capture_cam
output vsync;   //Posición
output href;	//Posiciòn
output enable;	
output [7:0] p_data; 	//Información byte
input [7:0] pixel_data; //Byte de salida
input pixel_valid;
input frame_done;
input SIOC;
input SIOD;
output rst;
//output power;

 output clk;                      // Variables genram
 output [16: 0] addr;      //-- Direcciones
 output rw;                  //-- Modo lectura (0) o escritura (1)
 output [7: 0] data_in;   //-- Dato de entrada
 output en;                    // -- Control 
 output cen;                   // -- Contador enable
 input [23: 0] data_out;

 input reset;          // Variable auxiliar divisor

  reg contador;
  reg [7:0] y;      // RGB
  reg [7:0] cb;
  reg [7:0] cr;




  capture_cam  cc(.p_clock(p_clock),
  				.vsync(vsync), 
  				.href(href), 
  				.enable(enable), 
  				.p_data(p_data),
  				.pixel_valid(pixel_valid), 
  				.pixel_data(pixel_data), 
  				.frame_done(frame_done),
          .SIOD(SIOD),
          .SIOC(SIOC),
          .rst(rst)
  		);

  genram rom1 (.clk(p_clock),
  		   .addr(addr),
  		   .rw(rw),
  		   .data_in(data_in),
  		   .en(en),
  		   .cen(cen),
  		   .data_out(data_out)
  		   );

  clockDivider cd(.p_clock(p_clock),
                .clk(clk), 
                .reset(reset)
        );



endmodule