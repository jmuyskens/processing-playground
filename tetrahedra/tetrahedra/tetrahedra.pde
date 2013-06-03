float t = 0.0;
float incr = 0.01;
int HEIGHT = 500;
int WIDTH = 500;
float centerY = HEIGHT / 2;
float centerX = WIDTH / 2;
float PIDIV = PI / 4;



void setup() {
  size(500, 500);
  background(255);
}

float sincr(float x) {
  return 50 * sin(x);
}
float coscr(float x) {
  return 50 * cos(x);
}
float getSinAX(float angle) {
   return (centerX + 100 * sin(angle)) + sincr(t) * sin(angle); 
}
float getSinAY(float angle) {
   return (centerY + 100 * cos(angle)) + sincr(t) * cos(angle);
}
float getCosAX(float angle) { 
   return (centerX + 100 * sin(angle)) + coscr(t) * sin(angle);
}
float getCosAY(float angle) {
    return (centerY + 100 * cos(angle)) + coscr(t) * cos(angle);
}
float getSinBX(float angle) {
   return (centerX + 100 * sin(angle)) - sincr(t) * sin(angle); 
}
float getSinBY(float angle) {
   return (centerY + 100 * cos(angle)) - sincr(t) * cos(angle);
}
float getCosBX(float angle) { 
   return (centerX + 100 * sin(angle)) - coscr(t) * sin(angle);
}
float getCosBY(float angle) {
    return (centerY + 100 * cos(angle)) - coscr(t) * cos(angle);
}
void drawSinV(float x, float y, float angle) {
  triangle(getSinAX(angle), getSinAY(angle), getSinBX(angle), getSinBY(angle), getCosAX(angle + PIDIV), getCosAY(angle + PIDIV));
  triangle(getSinAX(angle), getSinAY(angle), getSinBX(angle), getSinBY(angle), getCosBX(angle + PIDIV), getCosBX(angle + PIDIV));
  triangle(getSinAX(angle), getSinAY(angle), getCosAX(angle + PIDIV), getCosAY(angle + PIDIV), getCosBX(angle + PIDIV), getCosBY(angle + PIDIV)); 
  triangle(getSinBX(angle), getSinBY(angle), getCosAX(angle + PIDIV), getCosAY(angle + PIDIV), getCosBX(angle + PIDIV), getCosBY(angle + PIDIV));
}

void drawCosV(float x, float y, float angle) {
  triangle(getCosAX(angle), getCosAY(angle), getCosBX(angle), getCosBY(angle), getSinAX(angle + PIDIV), getSinAY(angle + PIDIV));
  triangle(getCosAX(angle), getCosAY(angle), getCosBX(angle), getCosBY(angle), getSinBX(angle + PIDIV), getSinBY(angle + PIDIV));
  triangle(getCosAX(angle), getCosAY(angle), getSinAX(angle + PIDIV), getSinAY(angle + PIDIV), getSinBX(angle + PIDIV), getSinBY(angle + PIDIV)); 
  triangle(getCosBX(angle), getCosBY(angle), getSinAX(angle + PIDIV), getSinAY(angle + PIDIV), getSinBX(angle + PIDIV), getSinBY(angle + PIDIV));
}

void draw() {
  background(255);
  boolean odd = false;
  for (float i = 0; i < 2*PI; i+=PIDIV) {
    float angle = i;
    if(odd) {      
      drawCosV(centerX + 100 * sin(i), centerY + 100 * cos(i), angle);
      odd = false;
    } else {
      drawSinV(centerX + 100 * sin(i), centerY + 100 * cos(i), angle);
      odd = true;
    }
  }
  t += incr;
}
  
