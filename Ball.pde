class Ball {
  float x, y, dx, dy;
  int rad;
  color c;
  int state;
  
  Ball(float nx, float ny) {
    x = nx;
    y = ny;
    dx = random(-5, 5);
    dy = random(-5, 5);
    c = color(random(255), random(255),random(255));
    state = 0;
    rad = 5;
  }
  
  Ball() {
    this(random(width), random(height));
  }
  
  void move() {
    x += dx;
    y += dy;
    bounce();
  }
  
  void bounce() {
    if (x <= 0 || x >= width)
      dx *= -1;
    if (y <= 0 || y >= height)
      dy *= -1;
  }
  
  void show() {
    fill(c);
    ellipse(x, y, 2*rad, 2*rad);
  }
  
  void expand() {
    rad++;
  }
  
  void shrink() {
    if (rad > 0)
      rad--;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  int getRad() {
    return rad;
  }
  
  color getC() {
    return c;
  }
  
  int getState() {
    return state;
  }
  
  void setState(int nstate) {
    state = nstate;
  }
  
}