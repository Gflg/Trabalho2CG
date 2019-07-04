public class Face {
  
  public Aresta[] arestas;
  
  public Face(int qtdArestas) {
    this.arestas = new Aresta[qtdArestas];    
  }
  
  public Face(Aresta... arestas) {
    this.arestas = arestas;
  }
  
  public void drawFace() {
    for(int i = 0; i < arestas.length; i++) {
      arestas[i].drawAresta();
    }
  }
  
  public float[] getDistanciaMediaDecagonoFaces0e1(float centroX, float centroY, float centroZ) {
    float[] mediaFinal = new float[3];
    float[] mediaAresta = new float[3];
    for(int i=0; i<3; i++)
      mediaFinal[i] = 0;
    for(int i=0; i<10; i++){
      if(i==0 || i==3 || i==4 || i==7 || i==9){
        mediaAresta = arestas[i].getDistanciaMediaAresta(centroX, centroY, centroZ);
        for(int j=0; j<3; j++)
          mediaFinal[j] += mediaAresta[j];
      }
    }
    for(int i=0; i<3; i++)
      mediaFinal[i] = mediaFinal[i]/5;
    return mediaFinal;
  }
  
  public float[] getDistanciaMediaDecagonoFacesLaterais(float centroX, float centroY, float centroZ) {
    float[] mediaFinal = new float[3];
    float[] mediaAresta = new float[3];
    for(int i = 0; i < 3; i++)
      mediaFinal[i] = 0;
    for(int i = 0; i < 10; i++) {
       if(i == 0 || i == 2) {
         mediaAresta = arestas[i].getDistanciaMediaAresta(centroX, centroY, centroZ);
         for(int j = 0; j < 3; j++)
           mediaFinal[j] += mediaAresta[j];
       }
    }
    for(int i = 0; i < 3; i++)
      mediaFinal[i] = mediaFinal[i]/2;
    return mediaFinal;
  }
  
}
