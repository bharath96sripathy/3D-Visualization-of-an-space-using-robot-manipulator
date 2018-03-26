import peasy.*;
PeasyCam cam;
import processing.serial.*;
Serial myPort;
float xa;
float yb;
float zc;
int inv;
int con;
String input;
float[] A,B,AB;                // constants needed for line equation
float[] C,D,CD;                // constants needed for plane equation
float n,t;                     // constants needed for line/plane intersection equation
float[] drawpointX;            // holds all X coordinates of points in 3D space
float[] drawpointY;            // holds all Y coordinates of points in 3D space
float[] drawpointZ;            // holds all Z coordinates of points in 3D space
int k = 0;  // counts the number of white pixels in entire scan for placing them in the "drawpoint" vectors


void setup()
{ 
  size(800, 600, P3D);
  rotateZ(PI/3);
  cam = new PeasyCam(this, 200);
  background(0);
  fill(255);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  print("progrsssam");
  while ( myPort.available() < 0)
  {
  }
  print("program");
}
void draw()
{
  perspective(PI/3.0, (float)width/height, 1, 500);  // adjust the near and far clipping planes to see the whole scene (last two number)
  stroke(255, 0, 0);                              // make the line red
  line(0, 0, 0, 50, 0, 0);                             // make a line in the x-direction of 50
  stroke(0, 255, 0);                              // make the line green
  line(0, 0, 0, 0, 50, 0);                             // make a line in the y-direction of 50
  stroke(0, 0, 255);                              // make the line blue
  line(0, 0, 0, 0, 0, 50);                             // make a line in the z-direction of 50

  camera(50*cos(mouseX/100.0)+10, 20, -50*sin(mouseX/100.0)-30, // X,Y,Z location of the camera (not the webcam)
    10, 0, -30, // X,Y,Z location of what the camera is looking at (not the webcam)
    0.0, -1.0, 0.0);  // where is up for the camera (not the webcam)
     input = myPort.readStringUntil('\n');      // Read each line(coordinate) on to input

  if (input != null)
  {
    input = trim(input);
    float inv[] = float(split(input, ','));
    for (int con = 0; con < inv.length; con++)
    {
      print("inv" + con + ":" + inv[con] + "\t");
    }
    if (inv.length >1)
    {
      xa = inv[0];
      yb = inv[1];
      zc = inv[2];
    }
      if(keyPressed){  // only renders point cloud if a key is pressed on the keyboard
    
  
    
    k = 0;  // reset "k" to zero
    
         C = new float[]{modelX(0,0,0), modelY(0,0,0), modelZ(0,0,0)};  // create a point on laser plane with global coordinates
      translate(10, 0, 0);                                           // move along by 10 in X-direction
      D = new float[]{modelX(0,0,0), modelY(0,0,0), modelZ(0,0,0)};  // create another point, 10 in X-direction away from laser plane 
      CD = new float[]{D[0]-C[0], D[1]-C[1], D[2]-C[2]};             // create a line perpindicular to plane using points "C" and "D" (NORMAL VECTOR)
      // CD[0]x + CD[1]y + CD[2]z = n
      
      popMatrix();  // close off local coordinates to return current position to the motor shaft with the motor's angle
      
      
        A = new float[]{modelX(0,0,0), modelY(0,0,0), modelZ(0,0,0)};  // create a point on webcam's centre with global coordinates
        translate(0,0,10);                                             // move along by 10 in Z-direction
        B = new float[]{modelX(0,0,0), modelY(0,0,0), modelZ(0,0,0)};  // create another point, 10 in Z-direction out in front of the webcam, along the imaginary line
        AB = new float[]{B[0]-A[0], B[1]-A[1], B[2]-A[2]};             // create the line from the webcam using points "A" and "B" (PROJECTION LINE)
        
        popMatrix();  // close off local coordinates to return current position to the motor shaft with the motor's angle
        
        // Intersection of Line and Plane
        t = (n - CD[0]*A[0] - CD[1]*A[1] - CD[2]*A[2])
        /   (CD[0]*AB[0] + CD[1]*AB[1] + CD[2]*AB[2]);  // Equation for the laser plane rearranged with equations for projection line substituted in to find constant "t"
        xa = A[0] + AB[0]*t;                        // Using "t" in line equation to find X-coordinate of intersection
        yb = A[1] + AB[1]*t;                        // Using "t" in line equation to find X-coordinate of intersection
        zc = A[2] + AB[2]*t;                        // Using "t" in line equation to find X-coordinate of intersection
  }
  float x= xa;
  float y= yb;
  float z= zc;
  stroke(255);
  point(x, y, z);
}
      }