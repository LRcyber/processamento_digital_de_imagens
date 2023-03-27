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
        d = (255.0 - r)/2;
        if (r<128) { r = r/2; }
        else { d = (255.0 - r)/2; r = r+d; }
        
        imo.set(i,j, color(r,r,r)); 
    }
    println("linha"+str(i));
  }
  imo.save(fname+"-splitting.jpg");
  exit();
}
