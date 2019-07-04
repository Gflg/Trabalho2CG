public class Decagono3D extends FiguraGeometrica {

  public Decagono3D(Vertice pontaDecagono){
    super(3, 20);
    this.vertices[0] = new Vertice(pontaDecagono); //duas faces
    this.vertices[1] = new Vertice(pontaDecagono.getX() - 40, pontaDecagono.getY() + 30, pontaDecagono.getZ()); //face esquerda
    this.vertices[2] = new Vertice(pontaDecagono.getX() + 40, pontaDecagono.getY() + 30, pontaDecagono.getZ()); //face direita
    this.vertices[3] = new Vertice(pontaDecagono.getX() - 60, pontaDecagono.getY() + 60, pontaDecagono.getZ()); //face esquerda
    this.vertices[4] = new Vertice(pontaDecagono.getX() + 60, pontaDecagono.getY() + 60, pontaDecagono.getZ()); //face direita
    this.vertices[5] = new Vertice(pontaDecagono.getX() - 60, pontaDecagono.getY() + 90, pontaDecagono.getZ()); //face esquerda
    this.vertices[6] = new Vertice(pontaDecagono.getX() + 60, pontaDecagono.getY() + 90, pontaDecagono.getZ()); //face direita
    this.vertices[7] = new Vertice(pontaDecagono.getX() - 40, pontaDecagono.getY() + 120, pontaDecagono.getZ()); //face esquerda
    this.vertices[8] = new Vertice(pontaDecagono.getX() + 40, pontaDecagono.getY() + 120, pontaDecagono.getZ()); //face direita
    this.vertices[9] = new Vertice(pontaDecagono.getX(), pontaDecagono.getY() + 130, pontaDecagono.getZ()); //duas faces
    this.vertices[10] = new Vertice(pontaDecagono.getX(), pontaDecagono.getY(), pontaDecagono.getZ()+30);
    this.vertices[11] = new Vertice(pontaDecagono.getX() - 40, pontaDecagono.getY() + 30, pontaDecagono.getZ()+30);
    this.vertices[12] = new Vertice(pontaDecagono.getX() + 40, pontaDecagono.getY() + 30, pontaDecagono.getZ()+30);
    this.vertices[13] = new Vertice(pontaDecagono.getX() - 60, pontaDecagono.getY() + 60, pontaDecagono.getZ()+30);
    this.vertices[14] = new Vertice(pontaDecagono.getX() + 60, pontaDecagono.getY() + 60, pontaDecagono.getZ()+30);
    this.vertices[15] = new Vertice(pontaDecagono.getX() - 60, pontaDecagono.getY() + 90, pontaDecagono.getZ()+30);
    this.vertices[16] = new Vertice(pontaDecagono.getX() + 60, pontaDecagono.getY() + 90, pontaDecagono.getZ()+30);
    this.vertices[17] = new Vertice(pontaDecagono.getX() - 40, pontaDecagono.getY() + 120, pontaDecagono.getZ()+30);
    this.vertices[18] = new Vertice(pontaDecagono.getX() + 40, pontaDecagono.getY() + 120, pontaDecagono.getZ()+30);
    this.vertices[19] = new Vertice(pontaDecagono.getX(), pontaDecagono.getY() + 130, pontaDecagono.getZ()+30);
    Aresta[][] arestas = new Aresta[4][10];
    this.faces = new Face[12];

    //face da frente
    arestas[0][0] = new Aresta(vertices[0], vertices[1]);
    arestas[0][1] = new Aresta(vertices[0], vertices[2]);
    arestas[0][2] = new Aresta(vertices[1], vertices[3]);
    arestas[0][3] = new Aresta(vertices[2], vertices[4]);
    arestas[0][4] = new Aresta(vertices[3], vertices[5]);
    arestas[0][5] = new Aresta(vertices[4], vertices[6]);
    arestas[0][6] = new Aresta(vertices[5], vertices[7]);
    arestas[0][7] = new Aresta(vertices[6], vertices[8]);
    arestas[0][8] = new Aresta(vertices[7], vertices[9]);
    arestas[0][9] = new Aresta(vertices[8], vertices[9]);
    this.faces[0] = new Face(arestas[0]);

    //face de trás
    arestas[1][0] = new Aresta(vertices[10], vertices[11]);
    arestas[1][1] = new Aresta(vertices[10], vertices[12]);
    arestas[1][2] = new Aresta(vertices[11], vertices[13]);
    arestas[1][3] = new Aresta(vertices[12], vertices[14]);
    arestas[1][4] = new Aresta(vertices[13], vertices[15]);
    arestas[1][5] = new Aresta(vertices[14], vertices[16]);
    arestas[1][6] = new Aresta(vertices[15], vertices[17]);
    arestas[1][7] = new Aresta(vertices[16], vertices[18]);
    arestas[1][8] = new Aresta(vertices[17], vertices[19]);
    arestas[1][9] = new Aresta(vertices[18], vertices[19]);
    this.faces[1] = new Face(arestas[1]);

    //face da esquerda
    arestas[2][0] = new Aresta(vertices[0], vertices[10]);
    arestas[2][1] = new Aresta(vertices[0], vertices[1]);
    arestas[2][2] = new Aresta(vertices[1], vertices[11]);
    arestas[2][3] = new Aresta(vertices[10], vertices[11]);
    this.faces[2] = new Face(arestas[2][0], arestas[2][1], arestas[2][2], arestas[2][3]);
      
    arestas[2][4] = new Aresta(vertices[1], vertices[3]);
    arestas[2][5] = new Aresta(vertices[3], vertices[13]);
    arestas[2][6] = new Aresta(vertices[13], vertices[11]);
    this.faces[3] = new Face(arestas[2][2], arestas[2][4], arestas[2][5], arestas[2][6]);
    
    arestas[2][7] = new Aresta(vertices[3], vertices[5]);
    arestas[2][8] = new Aresta(vertices[5], vertices[15]);
    arestas[2][9] = new Aresta(vertices[13], vertices[15]);
    this.faces[4] = new Face(arestas[2][5], arestas[2][7], arestas[2][8], arestas[2][9]);
    
    Aresta[][] arestasWireEsquerda = new Aresta[2][3];
    arestasWireEsquerda[0][0] = new Aresta(vertices[5], vertices[7]);
    arestasWireEsquerda[0][1] = new Aresta(vertices[7], vertices[17]);
    arestasWireEsquerda[0][2] = new Aresta(vertices[15], vertices[17]);
    this.faces[5] = new Face(arestas[2][8], arestasWireEsquerda[0][0], arestasWireEsquerda[0][1], arestasWireEsquerda[0][2]);
    
    arestasWireEsquerda[1][0] = new Aresta(vertices[7], vertices[9]);
    arestasWireEsquerda[1][1] = new Aresta(vertices[9], vertices[19]);
    arestasWireEsquerda[1][2] = new Aresta(vertices[17], vertices[19]);
    this.faces[6] = new Face(arestasWireEsquerda[0][1], arestasWireEsquerda[1][0], arestasWireEsquerda[1][1], arestasWireEsquerda[1][2]);

    //face da direita
    arestas[3][0] = new Aresta(vertices[0], vertices[10]);
    arestas[3][1] = new Aresta(vertices[0], vertices[2]);
    arestas[3][2] = new Aresta(vertices[2], vertices[12]);
    arestas[3][3] = new Aresta(vertices[10], vertices[12]);
    this.faces[7] = new Face(arestas[3][0], arestas[3][1], arestas[3][2], arestas[3][3]);
    
    arestas[3][4] = new Aresta(vertices[2], vertices[4]);
    arestas[3][5] = new Aresta(vertices[4], vertices[14]);
    arestas[3][6] = new Aresta(vertices[12], vertices[14]);
    this.faces[8] = new Face(arestas[3][2], arestas[3][4], arestas[3][5], arestas[3][6]);
    
    arestas[3][7] = new Aresta(vertices[4], vertices[6]);
    arestas[3][8] = new Aresta(vertices[6], vertices[16]);
    arestas[3][9] = new Aresta(vertices[14], vertices[16]);
    this.faces[9] = new Face(arestas[3][5], arestas[3][7], arestas[3][8], arestas[3][9]);

    Aresta[][] arestasWireDireita = new Aresta[2][3];
    arestasWireDireita[0][0] = new Aresta(vertices[6], vertices[8]); //<>//
    arestasWireDireita[0][1] = new Aresta(vertices[8], vertices[18]);
    arestasWireDireita[0][2] = new Aresta(vertices[16], vertices[18]);
    this.faces[10] = new Face(arestas[3][8], arestasWireDireita[0][0], arestasWireDireita[0][1], arestasWireDireita[0][2]);
    
    arestasWireDireita[1][0] = new Aresta(vertices[8], vertices[9]);
    arestasWireDireita[1][1] = new Aresta(vertices[9], vertices[19]);
    arestasWireDireita[1][2] = new Aresta(vertices[18], vertices[19]);
    this.faces[11] = new Face(arestasWireDireita[0][1], arestasWireDireita[1][0], arestasWireDireita[1][1], arestasWireDireita[1][2]);

    transformacaoCoordenadas(this.vertices);
  }
  
  public int qtdFaces(){
    return 12;
  }

}
