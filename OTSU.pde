

  size(400, 400);
  PImage img = loadImage("Toyokawa.jpg");
  //PImage imgh = createImage(400, 400, RGB);
  image(img, 0, 0);
  
  // Converter a imagem para escala de cinza
  img.filter(GRAY);
  
  // Calcular o histograma da imagem em escala de cinza
  int[] hist = new int[256];
  for (int i = 0; i < img.pixels.length; i++) {
    int p = (int) brightness(img.pixels[i]);
    hist[p]++;
  }
  
  // Calcular a probabilidade acumulada
  int[] cumulativeHist = new int[256];
  cumulativeHist[0] = hist[0];
  for (int i = 1; i < 256; i++) {
    cumulativeHist[i] = cumulativeHist[i - 1] + hist[i];
  }
  
  // Calcular a média das classes
  float[] mean = new float[256];
  for (int i = 0; i < 256; i++) {
    mean[i] = (float) (i * hist[i]) / cumulativeHist[255];
  }
  
  
  
  // Calcular a variação inter-classe
  float[] interClassVariance = new float[256];
  float overallMean = 0;
  for (int i = 0; i < 256; i++) {
    overallMean += mean[i] * hist[i];
  }
  overallMean /= img.pixels.length;
  for (int i = 0; i < 256; i++) {
    interClassVariance[i] = (float) (cumulativeHist[i] * (img.pixels.length - cumulativeHist[i])) / (img.pixels.length * img.pixels.length);
    interClassVariance[i] *= (mean[i] - overallMean) * (mean[i] - overallMean);
  }  
  // Encontrar o limiar de Otsu
  int threshold = 0;
  float maxVariance = 0;
  for (int i = 0; i < 256; i++) {
    if (interClassVariance[i] > maxVariance) {
      maxVariance = interClassVariance[i];
      threshold = i;
    }
  }  
  // Aplicar a limiarização
  for (int i = 0; i < img.pixels.length; i++) {
    int p = (int) brightness(img.pixels[i]);
    if (p < threshold) {
      img.pixels[i] = color(0);
    } else {
      img.pixels[i] = color(255);
    }
  }
image(img, 0, 0);
save("Toyokawa_otsu.jpg");
exit();
