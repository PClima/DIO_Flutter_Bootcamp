class PessoaModel {
  int _id = 0;
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;

  PessoaModel.vazio();
  PessoaModel(this._id, this._nome, this._altura, this._peso);

  //Getters

  int get id => _id;

  String get nome => _nome;

  double get peso => _peso;

  double get altura => _altura;

  //Setters
  set nome(String nome) {
    _nome = nome;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set id(int id) {
    _id = id;
  }
}
