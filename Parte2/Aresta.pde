public class Aresta {
  
  public Vertice[] vertices;
  
  public Aresta(Vertice v1, Vertice v2) {
    this.vertices = new Vertice[2];
    this.vertices[0] = v1;
    this.vertices[1] = v2;
  }
  
  public void drawAresta() {
    if (vertices[0].getQtdDimensoes() == 2){
      line(vertices[0].getX(), vertices[0].getY(), vertices[1].getX(), vertices[1].getY());
    }
    else{
      line(vertices[0].getX(), vertices[0].getY(), vertices[0].getZ(), vertices[1].getX(), vertices[1].getY(), vertices[1].getZ());
    }
  }
  
  public float[] getDistanciaMediaAresta(float centroX, float centroY, float centroZ){
    float[] media = new float[3];
    for(int i=0; i<3; i++){
      media[i] = 0;
    }
    float distanciaX, distanciaY, distanciaZ;
    for(int i=0; i<2; i++){
      distanciaX = vertices[i].getX() - centroX;
      distanciaY = vertices[i].getY() - centroY;
      distanciaZ = vertices[i].getZ() - centroZ;
      if(distanciaX < 0)
        distanciaX = -distanciaX;
      if(distanciaY < 0)
        distanciaY = -distanciaY;
      if(distanciaZ < 0)
        distanciaZ = -distanciaZ;
      media[0] += distanciaX;
      media[1] += distanciaY;
      media[2] += distanciaZ;
    }
    for(int i=0; i<3; i++){
      media[i] = media[i]/2;
    }
    return media;
  }
  
}
