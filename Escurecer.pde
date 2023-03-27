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
        r = red(c)/2;
        g = green(c)/2;
        b = blue(c)/2;
        d = (255.0 - r)/2;
        imo.set(i,j, color(r,g,b)); 
    }
    println("linha"+str(i));
  }
  imo.save(fname+"-escurecida.jpg");
  exit();
}
