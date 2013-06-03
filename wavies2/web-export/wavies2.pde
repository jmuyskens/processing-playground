float t = 0;
float i = 0.1;

void setup() {
  size(500,500);
  background(255);
  strokeWeight(2);
}

float sinc(float x){
  return 15 * sin(x) + 25;
}

void drawV(int x, int y, float off){
  line(x,y,x+sinc(t+off),y+25);
  line(x+50,y,x+50-sinc(t+off+PI),y+25);
}

void draw() {
  background(255);
  
  float off = 0.0;
  for(int x = 100; x <= 350; x += 50){
    float offsX = off;
    for(int y = 50; y <= 400; y += 10){
      drawV(x, y, offsX);
      offsX += 0.5;
    }
    off += PI/2;
  }
      
  t += i;
}



