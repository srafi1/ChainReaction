Ball[] balls;
Ball reactionStarter;
boolean reactionStarted;

void setup() {
  balls = new Ball[50];
  for (int i = 0; i < 50; i++)
    balls[i] = new Ball();
  size(500, 500);
  noStroke();
}

void draw() {
  background(0);
  updateAll();
  drawAll();
}

void updateAll() {
  for (Ball b : balls) {
    switch (b.getState()) {
    case 0:
      b.move();
      if (reactionStarted) {
        if ((reactionStarter.getState() == 1 || reactionStarter.getState() == 2) && colliding(b, reactionStarter))
          b.setState(1);
        for (Ball b2 : balls) {
          if (b == b2)
            continue;
          if ((b2.getState() == 1 || b2.getState() == 2) && colliding(b, b2))
            b.setState(1);
        }
      }
      break;
    case 1:
      if (b.getRad() < 50)
        b.expand();
      else
        b.setState(2);
      break;
    case 2:
      if (b.getRad() > 0)
        b.shrink();
      else
        b.setState(3);
      break;
    }
  }
  
  if (reactionStarted) {
    switch (reactionStarter.getState()) {
    case 1:
      if (reactionStarter.getRad() < 50)
        reactionStarter.expand();
      else
        reactionStarter.setState(2);
      break;
    case 2:
      if (reactionStarter.getRad() > 0)
        reactionStarter.shrink();
      else
        reactionStarter.setState(3);
      break; 
    }
  }
}

boolean colliding(Ball b1, Ball b2) {
  float x1 = b1.getX();
  float y1 = b1.getY();
  float x2 = b2.getX();
  float y2 = b2.getY();
  int r1 = b1.getRad();
  int r2 = b2.getRad();
  return dist(x1, y1, x2, y2) < r1 + r2;
}

void drawAll() {
  for (Ball b : balls)
    b.show();
  if (reactionStarted)
    reactionStarter.show();
}

void mouseClicked() {
  if (!reactionStarted) {
    reactionStarter = new Ball(mouseX, mouseY);
    reactionStarter.setState(1);
    reactionStarted = true;
  }
}