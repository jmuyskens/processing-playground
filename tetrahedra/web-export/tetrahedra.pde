float t = 0.0;
float incr = 0.05;
int HEIGHT = 500;
int WIDTH = 500;
float centerY = HEIGHT / 2;
float centerX = WIDTH / 2;



void setup() {
  size(WIDTH, HEIGHT);
  background(255);
}

float sincr(float x) {
  return 20 * sin(x);
}

void drawV(float x, float y, float angle) {
  line(x + sincr(t), y, x - sincr(t), y); 
}

void draw() {
  background(255);
  drawV(centerX, centerY);
  t += incr;
}
  

