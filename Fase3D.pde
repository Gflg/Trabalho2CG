public class Fase3D{
  float[] distanciasFaces = {0,0,0,0,0,0,0,0,0,0,0,0};
  float[][] rotacaoZ = {{0,0,0,0},
                        {0,0,0,0},
                        {0,0,1,0},
                        {0,0,0,1}};

  float[][] rotacaoX = {{1,0,0,0},
                        {0,0,0,0},
                        {0,0,0,0},
                        {0,0,0,1}};

  float[][] rotacaoY = {{0,0,0,0},
                        {0,1,0,0},
                        {0,0,0,0},
                        {0,0,0,1}};

  public void setRotacao(float angulo){
    rotacaoZ[0][0] = cos(angulo);
    rotacaoZ[0][1] = -sin(angulo);
    rotacaoZ[1][0] = sin(angulo);
    rotacaoZ[1][1] = cos(angulo);

    rotacaoY[0][0] = cos(angulo);
    rotacaoY[0][2] = sin(angulo);
    rotacaoY[2][0] = -sin(angulo);
    rotacaoY[2][2] = cos(angulo);
  }
  
  public void setRotacaoX(float angulo){
    rotacaoX[1][1] = cos(angulo);
    rotacaoX[1][2] = -sin(angulo);
    rotacaoX[2][1] = sin(angulo);
    rotacaoX[2][2] = cos(angulo);
  }

  public void drawTela(){
    
    stroke(163, 16, 163);

    float[][] translacao = new float[3][3];

    //Criando os vértices do Decágono 1
    Vertice pontaDoDecagono1 = new Vertice(0, 0, 0);

    Decagono decagono1 = new Decagono(pontaDoDecagono1);

    translacao[0][0] = 435;
    translacao[0][1] = 0;
    translacao[1][0] = 450;
    translacao[1][1] = 0;
    translacao[2][0] = 0;
    translacao[2][1] = 0;

    for (int i = 0; i < decagono1.vertices.length; i++){
      decagono1.moveVertice(i, translacao);
    }

    //decagono1.drawFigura();
        
    Decagono3D decagono3 = new Decagono3D(pontaDoDecagono1);

    translacao[0][0] += 200;

    for (int i = 0; i < decagono3.vertices.length; i++){
      decagono3.moveVertice(i, translacao);
    }

    decagono3.drawFigura();
    
     Decagono3D decagono2 = new Decagono3D(pontaDoDecagono1);

    //Rotação = 45º porque a figura é isométrica
    setRotacao(PI/4); //45º no eixo y
    setRotacaoX(0.61540309); //35.36º no eixo x

    stroke(163, 16, 163);

    translacao[0][0] += 160;
    translacao[0][1] = 0;
    translacao[1][0] += 25;
    translacao[1][1] = 0;
    translacao[2][0] = 0;
    translacao[2][1] = 0;

    for (int i = 0; i < decagono2.vertices.length; i++){
      //decagono2.transformaVertice(i, rotacaoZ);
      decagono2.transformaVertice(i, rotacaoX);
      decagono2.transformaVertice(i, rotacaoY);
      decagono2.moveVertice(i, translacao);
    }
    
    //decagono2.drawFigura();

  }

}
