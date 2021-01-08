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
  println("Energy: " + energy);
  println("Momentum: " + momentum);
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
    //m1*v1+m2*v2 = const1           // v2 = (const1 - m1*v1)/m2
    //m1*v1^2/2+m2*v2^2/2 = const2   //v1^2 = (2*const2-m2*((const1 - m1*v1)/m2)^2)/m1

    //momentum = m1*v1'+m2*v2'    //v2' = (momentum - m1*v1')/m2

    //energy = m1*v1'^2/2+m2*v2'^2/2  
    // energy = m1*v1'^2/2+m2*((momentum - m1*v1')/m2)^2/2  
    //2*energy = m1*v1'^2+m2*((momentum - m1*v1')/m2)^2
    //2*energy = m1*v1'^2 + ((momentum - m1*v1')^2)/m2
    // 2*enegry = m1*v1'^2 + momentum^2 - 2*m1*v1'*momentum + m1^2/m2*v1^2
    // v1'^2(m1+m1^2/m1



    //2*energy = m1*v1'^2+m2*v2'^2 
    //2*energy - m2*v2'^2 = m1*v1'^2
    //(2*energy - m2*v2'^2)/m1 = v1'^2
    //v1' = sqrt((2*energy - m2*v2'^2)/m1)

    float nv2 = ((2*m2*momentum)+sqrt(pow(momentum*m2*  2, 2)-4*((pow(momentum, 2)-(2*energy*m1))*(m2*(m1+m2)))))/(2*m2*(m1+m2));
    println("M1: " + sqrt((2*energy - pow(nv2, 2)*m2)/m1));
    println("M2: " + nv2);
    BigBox.SetVelocity(nv2);
    OneKiloBox.SetVelocity((momentum-m2*nv2)/m1);
    println("Energy: " + int(m1*pow(OneKiloBox.GetVelocity(), 2)/2 + m2*pow(BigBox.GetVelocity(), 2)/2));//sqrt((2*energy - pow(nv2,2)*m2)/m1)
  }
  BigBox.Move();
  BigBox.Show();
  //println(m1*pow(v1, 2)/2 + m2*pow(v2, 2)/2);
  //println(m1*v1 + m2*v2);
  if (OneKiloBox.GetXposition() <= 20) {
    CollisionCounter++;
    momentum = m1*OneKiloBox.GetVelocity() + m2*BigBox.GetVelocity();
  }
  fill(100);
  textSize(32);
  text(str(CollisionCounter), 100, 30);
} 
