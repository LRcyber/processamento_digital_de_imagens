PImage img;
PImage imo;

void setup() {
  size(400,400);
  int i, j;
  color c;
  float r, g, b, d;
  
  String fname = "Toyokawa";
  img = loadImage(fname+".jpg");
  PImage imo = createImage(400, 400, RGB);
  
  for (i=1; i<=400; i++) {
    for (j=1; j<=400; j++) {
        c = img.get(i,j);
        r = red(c);
        g = green(c);
        b = blue(c);
        d = (r*0.3)+(g*0.59)+(b*0.11);
        imo.set(i,j, color(d+50)); 
    }
  }
  imo.save(fname+"p_b3.jpg");
  exit();
}
