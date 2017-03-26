/*
  Analog2Serial - ENTIC
  Example of bidirectional serial communication
  Version 1.0 - January 2016
*/


// declarations section
int outValue = 0;

// setup routine runs once when you press reset
void setup() {
  Serial.begin(9600);
  while (Serial.available() <= 0 || Serial.read() != 'S') {
    Serial.println("Send 'S' to start");
    delay(200);
  }
  Serial.println("Starting measurement");
}
// loop routine runs over and over again forever
void loop() {
  Serial.setTimeout(2000);
  if (Serial.read() != "E") {
    outValue = analogRead(A0);
    fmOutValue = outValue ;
    Serial.println(OutValue);
  } else {
    Serial.end();
  }
  delay(200);

}
