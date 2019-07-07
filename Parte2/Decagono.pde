public class Decagono extends FiguraGeometrica {

  public Decagono(Vertice pontaDecagono){
    super(3, 10);
    this.vertices[0] = new Vertice(pontaDecagono);
    this.vertices[1] = new Vertice(pontaDecagono.getX() - 40, pontaDecagono.getY() + 30, pontaDecagono.getZ());
    this.vertices[2] = new Vertice(pontaDecagono.getX() + 40, pontaDecagono.getY() + 30, pontaDecagono.getZ());
    this.vertices[3] = new Vertice(pontaDecagono.getX() - 60, pontaDecagono.getY() + 60, pontaDecagono.getZ());
    this.vertices[4] = new Vertice(pontaDecagono.getX() + 60, pontaDecagono.getY() + 60, pontaDecagono.getZ());
    this.vertices[5] = new Vertice(pontaDecagono.getX() - 60, pontaDecagono.getY() + 90, pontaDecagono.getZ());
    this.vertices[6] = new Vertice(pontaDecagono.getX() + 60, pontaDecagono.getY() + 90, pontaDecagono.getZ());
    this.vertices[7] = new Vertice(pontaDecagono.getX() - 40, pontaDecagono.getY() + 120, pontaDecagono.getZ());
    this.vertices[8] = new Vertice(pontaDecagono.getX() + 40, pontaDecagono.getY() + 120, pontaDecagono.getZ());
    this.vertices[9] = new Vertice(pontaDecagono.getX(), pontaDecagono.getY() + 130, pontaDecagono.getZ());
    Aresta[] arestas = new Aresta[10];
    arestas[0] = new Aresta(vertices[0], vertices[1]);
    arestas[1] = new Aresta(vertices[0], vertices[2]);
    arestas[2] = new Aresta(vertices[1], vertices[3]);
    arestas[3] = new Aresta(vertices[2], vertices[4]);
    arestas[4] = new Aresta(vertices[3], vertices[5]);
    arestas[5] = new Aresta(vertices[4], vertices[6]);
    arestas[6] = new Aresta(vertices[5], vertices[7]);
    arestas[7] = new Aresta(vertices[6], vertices[8]);
    arestas[8] = new Aresta(vertices[7], vertices[9]);
    arestas[9] = new Aresta(vertices[8], vertices [9]);
    this.faces = new Face[1];
    this.faces[0] = new Face(arestas);
    transformacaoCoordenadas(this.vertices);
  }

}
