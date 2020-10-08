class UFO {
  float x, y, w, h;
  boolean isHit;

  UFO(Float x, Float y) {
    this.x = x;
    this.y = y;
    w = 50;
    h = 20;
    isHit = false;
  }

  void draw() {
    fill(0, 153, 51);
    ellipse(this.x, this.y-10, 30, 20);
    ellipse(this.x, this.y, w, h);
  }

  void hit() {
    this.x = 10*x;
    this.y = 10*y;
    isHit = true;
  }

  void move() {
    if (isHit != true) {
      this.x = this.x+3.5;
    }
  }
}
