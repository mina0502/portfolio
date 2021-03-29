#include <mcp_can.h>
long unsigned int rxId;
unsigned char len = 0;
unsigned char rxBuf[20];
char msgString[128];                        // Array to store serial string
const int driveSW=3;
const int startSW=4;
const int shutdwnSW=5;

#define CAN0_INT 2                              // Set INT to pin 2
MCP_CAN CAN0(10);                               // Set CS to pin 10

void setup() {
  SPI.setClockDivider(SPI_CLOCK_DIV2);
  SPI.setDataMode(SPI_MODE0);
  SPI.setBitOrder(MSBFIRST);
  SPI.begin();
  // put your setup code here, to run once:
  pinMode(driveSW,INPUT_PULLUP);
  pinMode(startSW,INPUT_PULLUP);
  pinMode(shutdwnSW,INPUT_PULLUP);

}
	
void loop() {
  unsigned char data[8] = {0x01,0x00,0x00,0x00,0x00,0x00,0x00};
   CAN0.sendMsgBuf(	, 1, 8, data);	
/*  if(digitalRead(driveSW)==LOW)
  {
 data[1]=1;
 CAN0.sendMsgBuf(	, 1, 8, data);
  delay(10);
  }
  
  if(digitalRead(startSW)==LOW)
  {
    if(digitalRead(shutdwnSW)==HIGH)
    {
  data[1]=11;
  CAN0.sendMsgBuf(	, 1, 8, data);
  delay(10);
    }
  }
  
    if(digitalRead(shutdwnSW)==LOW)// shutdown 확인 --> start 되어있는 상태에서 값 설정 후 종료되는지 확인한다.
  {
   data[3]=1;
   CAN0.sendMsgBuf(	, 1, 8, data);
   delay(10);
   }
   */
   }
