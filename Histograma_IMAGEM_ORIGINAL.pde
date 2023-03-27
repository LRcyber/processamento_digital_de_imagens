
size(400, 400);

//Carrega uma imagem do diretório de dados
PImage img = loadImage("Toyokawa.jpg");
PImage imgh = createImage(400, 400, RGB);

image(img, 0, 0);
int[] hist = new int[256];
PrintWriter output;
output = createWriter("positions.txt"); 
// calcula o histograma
for (int i = 0; i < img.width; i++) {
  for (int j = 0; j < img.height; j++) {
    int bright = int(brightness(get(i, j)));
    hist[bright]++; 
    imgh.set(i, j, color(0,0,0));
  }
}

int histMax = max(hist);

image(imgh, 0, 0);
//stroke(255);
for (int i = 0; i < imgh.width; i += 2) {
  int which = int(map(i, 0, imgh.width, 0, 255));
  int y = int(map(hist[which], 0, histMax, imgh.height, 0));
  line(i, imgh.height, i, y);
}


save("Toyokawa_original2.png");

for (int i = 0; i < 256; i++) {  
     output.println(i + "\t" + hist[i]); // Write the coordinate to the file  
}

output.flush(); // Writes the remaining data to the file
output.close(); // Finishes the file
exit(); // Stops the program
