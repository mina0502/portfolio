#define high 2500
#define lower 1000
#define DELAY 3000

/********************************************************************************************************/
/*                          high: high Idle                                                             */
/*                          lower: low Idle                                                             */
/*                          DELAY: fix delay time            1sec = 1000                                */
/********************************************************************************************************/
#include <mcp_can.h>
#include <SPI.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <EEPROM.h>
LiquidCrystal_I2C lcd(0x27,16,2); //0x27,0x3F
long unsigned int rxId;
unsigned char len = 0;
unsigned char rxBuf[20];
char msgString[128];                        // Array to store serial string
boolean Received,Setting=true;
const int Led_Green=3;
const int Led_Yellow=4;
const int Led_RED =5;
const int potentioMeterPin = 0;
const int SWpin=9;
const int swPin=8;
const int okPin=7;
int low;
int i=1,j=0;
int cnt=0,cn=0;
boolean OK=false,OK1=false,del=true;
unsigned long Current_Time, pre_Time, Sec=EEPROM.read(2),Min=EEPROM.read(1),Hour=EEPROM.read(0);
float Voltage;
#define CAN0_INT 2                              // Set INT to pin 2
MCP_CAN CAN0(10);                               // Set CS to pin 10


void setup()
{
  SPI.setClockDivider(SPI_CLOCK_DIV2);
  SPI.setDataMode(SPI_MODE0);
  SPI.setBitOrder(MSBFIRST);
  SPI.begin();
  
  pinMode(Led_Green,OUTPUT);
  pinMode(Led_Yellow,OUTPUT);
  pinMode(Led_RED,OUTPUT);
  pinMode(SWpin,INPUT_PULLUP);
  pinMode(swPin,INPUT_PULLUP);
  pinMode(okPin,INPUT_PULLUP);
     LED_Check();
     delay(500);
    LED_Green();
  
  Serial.begin(115200);
  lcd.init();
  lcd.clear();
  lcd.backlight();
  lcd.setCursor(0,0);
  lcd.print("Booting complete");
  lcd.setCursor(0,1);
  lcd.print("Setting complete");
  delay(1200);
  lcd.clear();
  lcd.setCursor(0,0);
  pre_Time=millis();
  // Initialize MCP2515 running at 16MHz with a baudrate of 500kb/s and the masks and filters disabled.
  if(CAN0.begin(MCP_ANY, CAN_500KBPS, MCP_16MHZ) == CAN_OK)
  {
    CAN0.setMode(MCP_NORMAL);                     // Set operation mode to normal so the MCP2515 sends acks to received data.
    Success();
  }

  else
  {
    Fail();
  }
    lcd.clear();
}


boolean Trans =false,sec;
int Timmer=0;
/*
  unsigned char data[8] = {0x01,0x40,40,0x00,0x00,0x00,0x00};
 CAN0.sendMsgBuf(	, 1, 8, data);	
  delay(10);   // send data per 100ms
  */
void loop()
{ 
  Voltage=analogRead(A1);
  Voltage=(Voltage*5/1023)/0.2;
  lcd.setCursor(0,0);
  lcd.print(Voltage,1);
   if(Trans == true)
{
  lcd.setCursor(9,1);
  lcd.print("        ");
  lcd.setCursor(9,0);
  lcd.print("        ");
  lcd.setCursor(9,0);
  int Value= analogRead(potentioMeterPin);
  int Select=map(Value,0,1023,lower,high+100);
  if(Select>high)
    {
      Select=high;
    }
    Select=(int)(Select/100)*100; // choice
  lcd.print(Select);
  unsigned char data[8] = {0x01,0x00,0x00,0x00,0x00,0x00,0x00};
  int ct =25;
  if((Select/100)%8==7)
  {
    int a =21;
    data[1]=0xE0;
    if(Select==700)
    data[2]=a;
    if(Select==1500)
    data[2]=a+ct;
    if(Select==2300)
    data[2]=a+2*ct;
  }
  if((Select/100)%8==0)
  {
    data[1]=0x00;
    if(Select==800)
    data[2]=ct;
    if(Select==1600)
    data[2]=2*ct;
    if(Select==2400)
    data[2]=3*ct;
    
  }
  if((Select/100)%8==1)
  {
    int a=28;
    data[1]=0x20;
    if(Select==900)
    data[2]=a;
    if(Select==1700)
    data[2]=a+ct;
    if(Select==2500)
    data[2]=a+2*ct;
  }

    if((Select/100)%8==2)
  {
    int a=31;
    data[1]=0x40;
    if(Select==1000)
    data[2]=a;
    if(Select==1800)
    data[2]=a+ct;
    if(Select==2600)
    data[2]=a+2*ct;
  }

    if((Select/100)%8==3)
  {
    int a=34;
    data[1]=0x60;
    if(Select==1100)
    data[2]=a;
    if(Select==1900)
    data[2]=a+ct;
    if(Select==2700)
    data[2]=a+2*ct;
  }
  
    if((Select/100)%8==4)
  {
    int a=37;
    data[1]=0x80;
    if(Select==1200)
    data[2]=a;
    if(Select==2000)
    data[2]=a+ct;
    if(Select==2800)
    data[2]=a+2*ct;
  }

      if((Select/100)%8==5)
  {
    int a=40;
    data[1]=0xA0;
    if(Select==1300)
    data[2]=a;
    if(Select==2100)
    data[2]=a+ct;
    if(Select==2900)
    data[2]=a+2*ct;
  }
  
     if((Select/100)%8==6)
  {
    int a=43;
    data[1]=0xC0;
    if(Select==1400)
    data[2]=a;
    if(Select==2200)
    data[2]=a+ct;
    if(Select==3000)
    data[2]=a+2*ct;
  }

       if((Select/100)%8==7)
  {
    int a=46;
    data[1]=0xE0;
    if(Select==1500)
    data[2]=a;
    if(Select==2300)
    data[2]=a+ct;
  }
  
  CAN0.sendMsgBuf(	, 1, 8, data);	
}


// =============================================================================
   OKay();
  
    int swIn=digitalRead(swPin);
    if(swIn == LOW)
    {
      if(OK1==false)
      {
      OK=true;
      cnt=1;
      }
    }
    if(OK==true&&OK1==false)
    {

  if(cnt==1)
  {
    if(lower<700)
    {
       unsigned char data[8]={0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
       CAN0.sendMsgBuf(	,1,8,data);
    }
   if(lower==700)
    {
      unsigned char data[8]={0x01,0xE0,21,0x00,0x00,0x00,0x00,0x00};
      CAN0.sendMsgBuf(	,1,8,data);
    }

       if(lower==1000)
    {
      unsigned char data[8]={0x01,0xE0,21,0x00,0x00,0x00,0x00,0x00};
      CAN0.sendMsgBuf(	,1,8,data);
    }

    
   if(lower==1500)
    {
      unsigned char data[8]={0x01,0x40,31,0x00,0x00,0x00,0x00,0x00};
      CAN0.sendMsgBuf(	,1,8,data);   
      }

    if(del==true)
    {
    lcd.setCursor(9,0);
    lcd.print("Wait...");
    lcd.setCursor(9,1);
    lcd.print("3 sec");
      delay(DELAY);
      del=false;
    }
    lcd.setCursor(9,0);
    lcd.print("OK Btn ");
    lcd.setCursor(9,1);
    lcd.print("default");
    unsigned char data[8] = {0x01,0x40,56,0x00,0x00,0x00,0x00,0x00}; //1800
   //   unsigned char data[8] = {0x01,0x20,53,0x00,0x00,0x00,0x00,0x00}; // 1700
    CAN0.sendMsgBuf(	,1,8,data);

    }
  if(cnt==2)
  {
    unsigned char data[8] = {0x00,0x00,0x00,0x00,0x00,0x00,0x00};
    CAN0.sendMsgBuf(	,1,8,data);
    lcd.setCursor(9,0);
    lcd.print("       ");
    lcd.setCursor(9,1);
    lcd.print("       ");
    cnt=0;
    OK=false;
    del=true;
  }
    }
// =====================================================================================================
int SW_IN=digitalRead(SWpin);
if(SW_IN==LOW)
{
  if(OK==false)
  {
  OK1=true;
  cnt=1;
  }
}
if(OK1 == true&&OK==false)
{
  if(cnt==1)
  {
    Trans=true;
  }
  if(cnt==2)
  {
    cnt=0;
    OK1=false;
    Trans=false;
    unsigned char data[8] = {0x00,0x00,0x00,0x00,0x00,0x00,0x00}; 
    lcd.setCursor(9,0);
    lcd.print("       ");
    lcd.setCursor(9,1);
    lcd.print("       ");
  }
}
  
  if(Received==true)// 수신 받을 경우
{
  if(!digitalRead(CAN0_INT))                         // If CAN0_INT pin is low, read receive buffer
  {
    LED_Green();
    
    CAN0.readMsgBuf(&rxId, &len, rxBuf);      // Read data: len = data length, buf = data byte(s)
        /*
//        ID value Check 
        Serial.println("-----------------------------");
        Serial.print("Data from ID: 0x");
        Serial.println(rxId, HEX);
        
        */
          if(rxId==	)
          {
            if((rxBuf[4]<<5)|(rxBuf[3]>>3)>200)
            {
              Cal_Time();
            }
            else
            {
              EEPROM.write(0,Hour);
              EEPROM.write(1,Min);
              EEPROM.write(2,Sec);
            }
            lcd.setCursor(0,1);
            lcd.print(Hour);
            lcd.print("H");
            lcd.print(Min);
            lcd.print("M");
            lcd.print(Sec);
            lcd.print("S");
            
          }
        
        if(rxId>0) //rxId 값이 있는지 확인
        {  
          switch(rxId)
          {  
            
            case 	:
             if(Trans==false&&cnt==4&&cnt==5)
             {
              lcd.setCursor(4,0);
              lcd.print("   ");
              lcd.setCursor(0,0);
             }
             else
             {
            lcd.setCursor(4,0);
            lcd.print("   ");
            lcd.setCursor(0,0);

             }
            lcd.print((rxBuf[4]<<5)|(rxBuf[3]>>3));
            lcd.print(" RPM   ");
            break;
           
            
          }
          
          if(rxId==	) 
        {
          lcd.setCursor(0,0);
          lcd.print(rxBuf[0]-40);
          lcd.print(" ");
          lcd.write(B11011111);
          lcd.print("C");
          Serial.println(rxBuf[0]-40);
          delay(100);
        }
        /* 
        if (rxId==	)
        {
         
          lcd.setCursor(0,1);
          lcd.print((rxBuf[4]<<5)|(rxBuf[3]>>3));
          lcd.setCursor(4,1);
          lcd.print("RPM");
          delay(60);
          /*
          lcd.print((rxBuf[4])<<5);
          lcd.setCursor(0,1);
          lcd.print((rxBuf[3])>>3);
          */                    
       
        }
  } 
}


else if(Received =false)// 수신 받지 않을 경우
{
    LED_RED(); // Error
    
    lcd.clear();
    lcd.setCursor(0,0);
    
  if(CAN0.begin(MCP_ANY, CAN_500KBPS, MCP_16MHZ) == CAN_OK)
    Success(); 
  else
  lcd.print("Check the Lines");
}    
  }
  // --------------------------------- END ------------------------------------- //
  void Cal_Time()
  {
    Current_Time=millis();
    if(Current_Time - pre_Time>=1000)
    {
    pre_Time=Current_Time;
    Sec++;
    }
    if(Sec>59)
    {
    Min++;
    Sec=0;
    }
    if(Min>59)
    {
    Hour++;
    Min=0;
   }
   if(Sec>10)
   {
    lcd.setCursor(6,1);
    lcd.print(" ");
   }
   if(Min<10&&Sec>10)
   {
    lcd.setCursor(7,1);
    lcd.print(" ");
   }
   if(Min<10&&Sec<10)
   {
    lcd.setCursor(6,1);
    lcd.print("  ");
   }


  };


 void OKay()
 {
  int swInput=digitalRead(okPin);
  if(swInput==LOW)
  {
   if(j>=i)
    {
    if(j==i)
    cnt++;
    j=i+1;
    }
  else
  j++;
}
else
j=i;
 };
 /*
 
 void Switch()
  {
  int swInput=digitalRead(SWpin);
  if(swInput==LOW)
  {
    if(j>=i)
    {
    if(j==i)
    cnt++;
    j=i+1;
    }
  else
  j++;
}
else
j=i;
  };

  
  
   void Switc()
  {
  int swInput=digitalRead(swPin);
  if(swInput==LOW)
  {
    if(L>=k)
    {
    if(L==k)
    cn++;
    L=k+1;
    }
  else
  L++;
}
else
L=k;
  };
*/
  

  
  void Fail()
  {
 //   Serial.println("Error Initializing MCP2515...");
    lcd.print("Error Init");
    Received=false;
  };
  
  void Success()
  {
 //   Serial.println("MCP2515 Initialized Successfully!");
    lcd.print("Initialized OK");
    Received=true;

   pinMode(CAN0_INT, INPUT);                            // Configuring pin for /INT input
   lcd.setCursor(0,1);
 //  Serial.println("MCP2515 Library Receive Example...");
   lcd.print("Ready to Receive");
  };
  
 void LED_Green()
  {
    digitalWrite(Led_Green,HIGH);
    digitalWrite(Led_Yellow,LOW);
    digitalWrite(Led_RED,LOW);
  };

  void LED_Yellow()
  {
    digitalWrite(Led_Green,LOW);
    digitalWrite(Led_Yellow,HIGH);
    digitalWrite(Led_RED,LOW);
  };

  void LED_RED()
  {
    digitalWrite(Led_Green,LOW);
    digitalWrite(Led_Yellow,LOW);
    digitalWrite(Led_RED,HIGH);
  };

 void LED_Check()
  {
    digitalWrite(Led_Green,HIGH);
    digitalWrite(Led_Yellow,HIGH);
    digitalWrite(Led_RED,HIGH);
  };
  
