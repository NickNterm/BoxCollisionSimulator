class Box {
  float WallXPosition = 20;
  float size;
  float Xposition;
  int mass;
  float velocity;
  Box(int mass, float velocity, float Xposition,int size) {
    this.mass = mass;
    this.velocity = velocity;
    this.Xposition = Xposition;
    this.size = size;
  }

  void Move() {
    Xposition += velocity;
    if (Xposition <= WallXPosition) {
      velocity = - velocity;
      this.SetXposition(WallXPosition);
    }
  }

  void SetVelocity(float v) {
    velocity = v;
  }

  float GetVelocity() {
    return velocity;
  }

  boolean hits(float x) {
    return x < Xposition + size;
  }

  float GetXposition() {
    return Xposition;
  }
  
  void SetXposition(float x) {
    Xposition = x;
  }
  
  void Show() {
    fill(127);
    rect(Xposition, height - 50 - size, size, size);
  }
}
