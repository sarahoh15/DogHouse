 
import gifAnimation.*;
float mx;
float my;
float easing = 0.22;
int radius = 24;
int edge = 100;
int inner = edge + radius;

int numFrames = 2; 
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
PImage img;  
Gif myAnimation;

void setup() {
  size(640, 640);
  frameRate(5);
  
  images[0] = loadImage("house_1.png");
  images[1] = loadImage("house_2.png");
  
  img = loadImage("dog.png");
    myAnimation = new Gif(this, "dog.gif");
myAnimation.play();
}

void draw() { 
  background(203,234,255);
  
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }
  
  mx = constrain(mx, 122, width - 210);
  my = constrain(my, 281+radius, height - 144);
  
   currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = -100; x < width; x += images[0].width) { 
    image(images[(currentFrame+offset) % numFrames], 0, 0);
    offset+=2;
    image(images[(currentFrame+offset) % numFrames], 0, 0);
    offset+=2;
  }
  fill(255);  
  image(myAnimation, mx, my);
}
