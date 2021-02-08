#define cbi(sfr, bit)(_SFR_BYTE(sfr) &= ~_BV(bit))
#define sbi(sfr, bit)(_SFR_BYTE(sfr) |= _BV(bit))

#include <Servo.h>
Servo myservo;

//............................[SYSTEM VARIABLES].................................

float td1; // TIMING FLOATS
float td2;
float tm1;
float tm2;

const int Led = 11;
const int Button = 2;
const int samples = 200;

int incomingByte = 0;
int t[3];
int ar[3];
int B_state = 0;
int pos1;
int pos2;

unsigned int ss1[samples];
unsigned int ss2[samples];
unsigned int ss3[samples];

char buf[11];
String inString = "";
long numVal;

//.................................[SYSTEM SETUP]...................................
void setup() {
  cbi(ADCSRA, ADPS2); // ADJUSTMENTS FOR ADC SPEED
  sbi(ADCSRA, ADPS1);
  sbi(ADCSRA, ADPS0);

  Serial.begin(115200); // BAUDRATE
  pinMode(Led, OUTPUT);
  pinMode(Button, INPUT);
  myservo.attach(9);
}


//..............................[DATA COLLECTION SECTION]...........................
void loop() {
  B_state = digitalRead(Button);

  if (B_state == HIGH) {
    //td1 = micros() ;  //SIGNAL CAPTURE TIMING
    digitalWrite(Led, HIGH);

    for (int k = 0; k < 20; k++) {
      for (int i = 0; i < 200; i++) {
        ss1[i] = analogRead(0);
        ss2[i]  = analogRead(1);
        ss3[i]  = analogRead(2);
      }

      for (int j = 0; j < samples; j++) {
        Serial.print(int(ss1[j]));
        Serial.print("\t");
        Serial.print(int(ss2[j]));
        Serial.print("\t");
        Serial.print(int(ss3[j]));
        Serial.println();
      }
    }
    td2 = micros() - td1;   //SIGNAL CAPTURE TIMING
    //Serial.print(td2);
  }

  else {
    digitalWrite(Led, LOW);
  }

  //................................[ORIGINAL DOA MOTOR SECTION]...........................
  if (Serial.available() > 0) {
    tm1 = micros() ;  // START MOTOR TIMER
    for (int i = 0; i < 3; i++) {
      ar[i] = Serial.read();

      if (ar[i] == 10) {
        break;
      }

      Serial.print("charVal:");
      Serial.print(ar[i]);
      Serial.println();
      t[i] = ar[i] - 48;   //CHAR TO INT CONVERSION
    }
    snprintf(buf, sizeof(buf), "%d%d%d", t[0], t[1], t[2]);

    numVal = atol(buf);  // SYSTEM DOA

 //................................[ALTERED DOA MOTOR SECTION]...........................
 // NOTE: THE [ORIGINAL DOA MOTOR CODE] IS STILL INCLUDED IN [ALTERED DOA MOTOR SECTION]
    pos1 = numVal - 10;  // MINIMUM DOA FOR SWIVEL
    pos2 = numVal + 10;  // MAXIMUM DOA FOR SWIVEL

    for (int f = 0; f < 5; f++) {  //SWIVEL FROM DOA_MIN TO DOA_MAX
      for (pos1; pos1 < pos2; pos1 += 1)
      {
        myservo.write(pos1);
        delay(15);
      }
      pos1 = numVal - 10;
    }
    tm2 = micros() - tm1; // END MOTOR TIMER
    Serial.print("Motor Time:");
    Serial.print(tm2);
    Serial.println();

    Serial.print("DoA:");
    Serial.print(numVal);
    Serial.println();

    Serial.print("DoA_min:");
    Serial.print(pos1);
    Serial.println();

    Serial.print("DoA_max:");
    Serial.print(pos2);
    Serial.println();
  }
}
