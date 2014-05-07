/**
 * HTTP Client. 
 * 
 * Starts a network client that connects to a server on port 80,
 * sends an HTTP 1.0 GET request, and prints the results. 
 *
 * Note that this code is not necessary for simple HTTP GET request:
 * Simply calling loadStrings("http://www.processing.org") would do
 * the same thing as (and more efficiently than) this example.
 * This example is for people who might want to do something more 
 * complicated later.
 */
 

import processing.net.*;
import controlP5.*;

ControlP5 cp5;
int myColor = color(0,0,0);
int val = 0;
int val1 = 0;
int val2 = 0;
int prev = 0;
int prev1 = 0;
int prev2 = 0;
int len;
int len1;
int len2;

int sliderValue = 100;
int sliderValue1 = 100;
int sliderValue2 = 100;

Slider abc;

Client c;
String data;

String apiKey = "newdeveloper";
String light = "1";

void setup() {
  size(700, 400);
  background(50);
  noStroke();
  
    
  cp5 = new ControlP5(this);
  
  cp5.addSlider("sliderValue")
     .setPosition(100,50)
     .setRange(0,255)
     ;
     
   cp5.addSlider("sliderValue1")
   .setPosition(100,150)
   .setRange(0,255)
   ;
  
  cp5.addSlider("sliderValue2")
     .setPosition(100,250)
     .setRange(0,6000)
     ;
  
}

void draw() {
  
    fill(sliderValue);
    rect(0,0,width,100);
    
    fill(sliderValue1);
    rect(0,100,width,100);
  
    fill(sliderValue2);
    rect(0,200,width,100);

    val = sliderValue;
    val1 = sliderValue1;
    val2 = sliderValue2;
    String stringOne =  str(val);  //convert to string
    String stringTwo =  str(val1);
    String stringThree =  str(val2);
    int len = stringOne.length(); //get length
    int len1 = stringTwo.length(); //get length
    int len2 = stringThree.length(); //get length
      
    
      if (val != prev ){ // if new reading is different than the old one
      
          print("sliderValue");
          println(sliderValue);
          print("val");
          println(val);
          print("len");
          println(len);
          
          c = new Client(this, "192.168.2.100", 80); // Connect to server on port 80
          c.write("PUT /api/" + apiKey +"/lights/" + light + "/state HTTP/1.1\r\n"); // Use the HTTP "GET" command to ask for a Web page
          c.write("Content-Length: " + 18 +len + "\r\n\r\n");
          c.write("{\"bri\":" + val +"}\r\n");
          c.write("\r\n");
          c.stop();
          sendHTTPData();
          
          println("sent");  // command executed
          delay(1); // slight delay
          prev = val; //set prev
      }
      
      if (val1 != prev1 ){ // if new reading is different than the old one
      
          print("sliderValue");
          println(sliderValue);
          print("val");
          println(val);
          print("len");
          println(len);
          
          c = new Client(this, "192.168.2.100", 80); // Connect to server on port 80
          c.write("PUT /api/" + apiKey +"/lights/" + light + "/state HTTP/1.1\r\n"); // Use the HTTP "GET" command to ask for a Web page
          c.write("Content-Length: " + 18 + len1 + "\r\n\r\n");
          c.write("{\"sat\":" + val1 +"}\r\n");
          c.write("\r\n");
          c.stop();
          sendHTTPData();
          
          println("sent");  // command executed
          delay(1); // slight delay
          prev1 = val1; //set prev
      }
      
      if (val2 != prev2 ){ // if new reading is different than the old one
      
          print("sliderValue");
          println(sliderValue);
          print("val");
          println(val);
          print("len");
          println(len);
          
          c = new Client(this, "192.168.2.100", 80); // Connect to server on port 80
          c.write("PUT /api/" + apiKey +"/lights/" + light + "/state HTTP/1.1\r\n"); // Use the HTTP "GET" command to ask for a Web page
          c.write("Content-Length: " + 18 + len2 + "\r\n\r\n");
          c.write("{\"hue\":" + val2 +"}\r\n");
          c.write("\r\n");
          c.stop();
          sendHTTPData();
          
          println("sent");  // command executed
          delay(1); // slight delay
          prev2 = val2; //set prev
      }
  delay(1);
}


void sendHTTPData() {
  if (c.available() > 0) { // If there's incoming data from the client...
    data = c.readString(); // ...then grab it and print it
    println(data);
  }
}
