import java.awt.Dimension;
import java.awt.*;

public class FiguraGeometrica {

  Vertice[] vertices;
  Face[] faces;
  private int quantidadeDimensoes, quantidadeVertices;
  Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
  private float XdMax = (float) screenSize.getWidth(); //private float XdMax = displayWidth;
  private float YdMax = (float) screenSize.getHeight(); //private float YdMax = displayHeight;
  private float XuMax = width;
  private float YuMax = height;

  public FiguraGeometrica(int quantidadeDimensoes, int quantidadeVertices) {
    this.vertices = new Vertice[quantidadeVertices];
    setQuantidadeDimensoes(quantidadeDimensoes);
    setQuantidadeVertices(quantidadeVertices);
    setXdMax(XdMax);
    setYdMax(YdMax);
    setXuMax(XuMax);
    setYuMax(YuMax);
  }

  int getQuantidadeDimensoes(){
    return this.quantidadeDimensoes;
  }

  private void setQuantidadeDimensoes(int quantidadeDimensoes) {
    this.quantidadeDimensoes = quantidadeDimensoes;
  }

  int getQuantidadeVertices(){
    return this.quantidadeVertices;
  }

  private void setQuantidadeVertices(int quantidadeVertices) {
    this.quantidadeVertices = quantidadeVertices;
  }

  float getXdMax(){
    return this.XdMax;
  }

  private void setXdMax(float XdMax) {
    this.XdMax = XdMax;
  }

  float getYdMax(){
    return this.YdMax;
  }

  private void setYdMax(float YdMax) {
    this.YdMax = YdMax;
  }

  float getXuMax(){
    return this.XuMax;
  }

  private void setXuMax(float XuMax) {
    this.XuMax = XuMax;
  }

  float getYuMax(){
    return this.YuMax;
  }

  private void setYuMax(float YuMax) {
    this.YuMax = YuMax;
  }
  
  public void drawFigura() {
    for (int i = 0; i < this.faces.length; i++) {
       for (int j = 0; j < this.faces[i].arestas.length; j++) {
           this.faces[i].arestas[j].drawAresta();
       }
    }
    
  }

/*
  public void updateVertice(int vertice, float[] novosPontos) {
    for (int i = 0; i < getQuantidadeDimensoes(); i++){
      this.vertices[i][vertice] = novosPontos[i];
    }
  }
*/

  void transformaVertice(int vertice, float[][] transformacao) {
    if(transformacao.length==4){
      float[][] aux = new float[4][1];
      for(int i=0; i<3; i++){
        aux[i][0] = vertices[vertice].coordenadas[i];
      }
      aux[3][0] = 1;
      for(int i = 0; i < transformacao.length; i++){
        float soma = 0;
        for(int j = 0; j < transformacao[i].length; j++){
          soma += transformacao[i][j]*aux[j][0];
        }
        if (i < 3)
          vertices[vertice].coordenadas[i] = soma;
      }
    }
    else{
      float[][] aux = new float[3][1];
      for(int i=0; i<2; i++){
        aux[i][0] = vertices[vertice].coordenadas[i];
      }
      aux[2][0] = 1;
      for(int i = 0; i < transformacao.length; i++){
        float soma = 0;
        for(int j = 0; j < transformacao[i].length; j++){
          soma += transformacao[i][j]*aux[j][0];
        }
        vertices[vertice].coordenadas[i] = soma;
      }
    }
  }

  void moveVertice(int vertice, float[][] translacao) {
    for (int i = 0; i < getQuantidadeDimensoes(); i++){
      vertices[vertice].coordenadas[i] += translacao[i][0];
    }
  }

  void transformacaoCoordenadas(Vertice[] vertices) {
    for(int i = 0; i < vertices.length; i++){
      float Xu = vertices[i].coordenadas[0];
      float Yu = vertices[i].coordenadas[1];
      //vertices[i].coordenadas[0] = (Xu * XdMax) / XuMax;
      //vertices[i].coordenadas[1] = ((Yu * (-YdMax)) / YuMax) + YdMax;
    }
  }

}
