import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_CONFIGURACOES_NOME_USUARIO,
  CHAVE_CONFIGURACOES_ALTURA,
  CHAVE_CONFIGURACOES_RECEBER_NOTIFICACOES,
  CHAVE_CONFIGURACOES_DARK_MODE,
  CHAVE_NUMERO_ALEATORIO
}

class AppStorageService {
  // NUMERO ALEATORIO //
  Future<void> setNumeroAleatorio(int numero) async {
    await _setInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString(), numero);
  }

  Future<int> getNumeroAleatorio() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString());
  }

  // CONFIGURAÇÕES //
  Future<void> setConfiguracoesNomeUsuario(String nome) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_CONFIGURACOES_NOME_USUARIO.toString(), nome);
  }

  Future<String> getConfiguracoesNomeUsuario() async {
    return _getString(
        STORAGE_CHAVES.CHAVE_CONFIGURACOES_NOME_USUARIO.toString());
  }

  Future<void> setConfiguracoesAltura(double altura) async {
    await _setDouble(
        STORAGE_CHAVES.CHAVE_CONFIGURACOES_ALTURA.toString(), altura);
  }

  Future<double> getConfiguracoesAltura() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_CONFIGURACOES_ALTURA.toString());
  }

  Future<void> setConfiguracoesReceberNotificacoes(bool value) async {
    await _setBool(
        STORAGE_CHAVES.CHAVE_CONFIGURACOES_RECEBER_NOTIFICACOES.toString(),
        value);
  }

  Future<bool> getConfiguracoesReceberNotificacoes() async {
    return _getBool(
        STORAGE_CHAVES.CHAVE_CONFIGURACOES_RECEBER_NOTIFICACOES.toString());
  }

  Future<void> setConfiguracoesDarkMode(bool value) async {
    await _setBool(
        STORAGE_CHAVES.CHAVE_CONFIGURACOES_DARK_MODE.toString(), value);
  }

  Future<bool> getConfiguracoesDarkMode() async {
    return _getBool(STORAGE_CHAVES.CHAVE_CONFIGURACOES_DARK_MODE.toString());
  }

  // DADOS CADASTRAIS//
  //Nome
  Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  //Data de nascimento
  Future<void> setDadosCadastraisDataNascimento(DateTime data) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(),
        data.toString());
  }

  Future<String> getDadosCadastraisDataNascimento() async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

  //Nível de experiência
  Future<void> setDadosCadastraisNivelExperiencia(String nome) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(),
        nome);
  }

  Future<String> getDadosCadastraisNivelExperiencia() async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString());
  }

  //Linguagens
  Future<void> setDadosCadastraisLinguagens(List<String> linguagens) async {
    await _setStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString(),
        linguagens);
  }

  Future<List<String>> getDadosCadastraisLinguagens() async {
    return _getStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString());
  }

  //Tempo de Experiência
  Future<void> setDadosCadastraisTempoExperiencia(int tempoExperiencia) async {
    await _setInt(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(),
        tempoExperiencia);
  }

  Future<int> getDadosCadastraisTempoExperiencia() async {
    return _getInt(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  //Salário
  Future<void> setDadosCadastraisSalario(double salario) async {
    await _setDouble(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), salario);
  }

  Future<double> getDadosCadastraisSalario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }

  _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
