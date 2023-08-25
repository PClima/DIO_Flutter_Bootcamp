class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNotificacoes = false;
  bool _darkMode = false;

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberNotificacoes,
      this._darkMode);

  ConfiguracoesModel.vazio() {
    _nomeUsuario = "";
    _altura = 0;
    _receberNotificacoes = false;
    _darkMode = false;
  }

  String get nomeUsuario => _nomeUsuario;
  double get altura => _altura;
  bool get receberNotificacoes => _receberNotificacoes;
  bool get darkMode => _darkMode;

  set nomeUsuario(String value) {
    _nomeUsuario = value;
  }

  set altura(double value) {
    _altura = value;
  }

  set receberNotificacoes(bool value) {
    _receberNotificacoes = value;
  }

  set darkMode(bool value) {
    _darkMode = value;
  }
}
