// import gui library
import controlP5.*;

// Create public gui holder
ControlP5 cp5;

int num = 90;
int threshold = 100;
boolean showCircles = true;

Circle c1;
ArrayList<Circle> particles = new ArrayList<Circle>();



void setup() {
  size(800, 500);
  background(#575656);



  for (int i = 0; i < num; i++) {
    c1 = new Circle();
    particles.add(c1);
  }

  // instantiate slider
  cp5 = new ControlP5(this);
 
  cp5.addSlider("threshold")
    .setPosition(20, 20)
    .setRange(0, 1000); 
}



void draw() {
  background(#575656);

  for (int i = 0; i < num; i++) {

    for (int j = 0; j < num; j++) {
      if (i != j) {
        float dist = dist(particles.get(i).pos.x, particles.get(i).pos.y, particles.get(j).pos.x, particles.get(j).pos.y );

        if (dist < threshold) {
          float alpha = map(dist, 0, threshold, 255, 0);
          stroke(random(255), random(255), random(255), random(255));
          line(particles.get(i).pos.x, particles.get(i).pos.y, particles.get(j).pos.x, particles.get(j).pos.y);
        }
      }
    }
    
    particles.get(i).updateCircle();
    particles.get(i).drawCircle();
  }
}