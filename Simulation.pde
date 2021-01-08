int m1 = 1;
int m2 = 100;
float v2 = -1;
float v1 = 0;
float energy = m1*pow(v1, 2)/2 + m2*pow(v2, 2)/2;
float momentum = m1*v1 + m2*v2;

Box OneKiloBox = new Box(m1, v1, 200, 50);
Box BigBox = new Box(m2, v2, 300, 75);
int CollisionCounter = 0;
void setup() {
  size(1200, 600);
}

void draw() {
  background(0);
  fill(200);
  stroke(200);
  rect(0, 0, 20, height);
  rect(0, height - 50, width, 100);
  OneKiloBox.Move();
  OneKiloBox.Show();
  if (OneKiloBox.hits(BigBox.GetXposition())) {
    CollisionCounter++;
    BigBox.SetXposition(OneKiloBox.GetXposition()+50);
    OneKiloBox.SetXposition(BigBox.GetXposition()-50);
    float nv2 = ((2*m2*momentum)+sqrt(pow(momentum*m2*  2, 2)-4*((pow(momentum, 2)-(2*energy*m1))*(m2*(m1+m2)))))/(2*m2*(m1+m2));
    BigBox.SetVelocity(nv2);
    OneKiloBox.SetVelocity((momentum-m2*nv2)/m1);
  }
  BigBox.Move();
  BigBox.Show();
  if (OneKiloBox.GetXposition() <= 20) {
    CollisionCounter++;
    momentum = m1*OneKiloBox.GetVelocity() + m2*BigBox.GetVelocity();
  }
  fill(100);
  textSize(32);
  text(str(CollisionCounter), 100, 30);
} 
