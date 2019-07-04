public class Vertice {

  public float[] coordenadas;
  public int quantidadeDimensoes;

  public Vertice(float... coordenadas) {
    this.quantidadeDimensoes = coordenadas.length;
    this.coordenadas = coordenadas;
  }
  
  public Vertice(Vertice outro) {
     this.quantidadeDimensoes = outro.quantidadeDimensoes;
     this.coordenadas = new float[outro.quantidadeDimensoes];
     for(int i = 0; i < outro.quantidadeDimensoes; i++) {
         this.coordenadas[i] = outro.coordenadas[i];
     }
  }

  public float getX() {
    return this.coordenadas[0];
  }

  public float getY() {
    return this.coordenadas[1];
  }
  
  public float getZ() {
     return this.coordenadas[2]; 
  }
  
  public int getQtdDimensoes(){
    return this.quantidadeDimensoes;
  }

  public void setX(float x) {
    this.coordenadas[0] = x;
  }

  public void setY(float y) {
    this.coordenadas[1] = y;
  }
  
  public void setZ(float z) {
     this.coordenadas[2] = z; 
  }
  
}
