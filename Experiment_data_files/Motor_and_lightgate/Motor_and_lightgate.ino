#include <stdio.h>
#include <stdlib.h>

const int stepPin = 3;
const int dirPin = 4; 

int customDelay,customDelayMapped; // Defines variables
int Speed = 600;
int value;
int current_time;
int starttime;
int starttime2;
bool Direction;
int pulseWidthMicros = 50;
//int currentmicro;
int newCustom = 1000;
int duration = 5000;


void setup() {
  Serial.begin(9600);
  starttime = millis();
  pinMode(stepPin,OUTPUT);
  pinMode(dirPin,OUTPUT);
  digitalWrite(dirPin,LOW); // high is up LOW is down
  Direction = true;
  //currentmicro = micros();
}

void loop() {
  while(millis()<(starttime+duration)) {

    value = analogRead(A0);
    current_time = millis();
    customDelayMapped = newCustom;
    Serial.println(String(millis()) + ", " + String(value) + ", " + String(customDelayMapped) + ", " + LOW);  
    //while(millis() < current_time + 50){
        customDelayMapped = newCustom;
          digitalWrite(stepPin, HIGH);
          delayMicroseconds(customDelayMapped);
          digitalWrite(stepPin, LOW);
          delayMicroseconds(customDelayMapped);
    //}
  }
  digitalWrite(dirPin,HIGH); // high is up LOW is down
  Direction = true;
    while(millis()<(starttime+duration*2)) {

    value = analogRead(A0);
    current_time = millis();
    customDelayMapped = newCustom;
    Serial.println(String(millis()) + ", " + String(value) + ", " + String(customDelayMapped) + ", " + HIGH);  
    //while(millis() < current_time + 50){
        customDelayMapped = newCustom;
          digitalWrite(stepPin, HIGH);
          delayMicroseconds(customDelayMapped);
          digitalWrite(stepPin, LOW);
          delayMicroseconds(customDelayMapped);
   // }
  }
}
