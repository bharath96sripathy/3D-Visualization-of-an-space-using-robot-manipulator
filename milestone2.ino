#include <Servo.h> 
 
Servo myservo;//  servo object to control a first servo 
Servo myservo1;//  servo object to control a  second servo 
                // twelve servo objects can be created on most boards
 
int pos = 0;    // variable to store the servo position of first servo
int pos1 = 0;
float distance;
unsigned long duration;// variable to store the servo position of second servo
void setup() 
{ 
  myservo.attach(9);
  myservo1.attach(8);
  pinMode(7,OUTPUT);
  pinMode(6,INPUT);
  Serial.begin(9600);// attaches the servo on pin 9 to the servo object 
} 
void ultrasonic()
{
   digitalWrite(7,LOW);
  delayMicroseconds(2);
  digitalWrite(7,HIGH);
  delayMicroseconds(5);
  digitalWrite(7,LOW);
  duration=pulseIn(6,HIGH);
  distance=duration*0.034/2;
}
 
void loop() 
{ 
 for(pos1 = 0; pos1<=180; pos1 += 2)
 {
  myservo1.write(pos1);
  delay(20);
  
  for(pos = 0; pos <= 180; pos += 1) // goes from 0 degrees to 180 degrees 
  {                                  // in steps of 1 degree 
    myservo.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(15);
    ultrasonic();
    Serial.print(pos);
    Serial.print(",");
    Serial.print(pos1);
    Serial.print(",");
    Serial.println(distance);// waits 15ms for the servo to reach the position 
  } 
  for(pos = 180; pos>=0; pos-=1)     // goes from 180 degrees to 0 degrees 
  {                                
    myservo.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(15); 
    Serial.print(pos);
    Serial.print(",");
    Serial.print(pos1);
    Serial.print(",");
    Serial.println(distance);// waits 15ms for the servo to reach the position 
  } 
}
} 

