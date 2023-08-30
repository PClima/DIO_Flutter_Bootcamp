class ImcModel {
  int _id = 0;
  double _imc = 0;
  String _categoria = "";
  DateTime _dataCalculo = DateTime.now();
  int _idUsuario = 0;

  ImcModel.vazio();
  ImcModel(
      this._id, this._imc, this._categoria, this._dataCalculo, this._idUsuario);

  //Getters
  int get id => _id;
  double get imc => _imc;
  String get categoria => _categoria;
  DateTime get dataCalculo => _dataCalculo;
  int get idUsuario => _idUsuario;

  //Setters
  set imc(double imc) {
    _imc = imc;
  }

  set categoria(String categoria) {
    _categoria = categoria;
  }

  set altura(DateTime dataCalculo) {
    _dataCalculo = dataCalculo;
  }

  set id(int id) {
    _id = id;
  }

  set idUsuario(int idUsuario) {
    _idUsuario = idUsuario;
  }
}
