import 'package:mymoto/Modelos/moto.dart';
import 'package:mymoto/Modelos/usuario.dart';
import 'package:mymoto/Paginas/Cadastro/servico_firebase_cadastro_por_email.dart';
import 'package:rxdart/rxdart.dart';

class BlocCadastroPorEmail {
  final _login = BehaviorSubject<String>();
  final _nome = BehaviorSubject<String>();
  final _senha = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _confirmarSenha = BehaviorSubject<String>();
  final _telefone = BehaviorSubject<String>();
  // mudar modelo marca e quilometragem para receber o tipo Moto
  
  final _modelo = BehaviorSubject<Moto>();
  final _marca = BehaviorSubject<Moto>();
  final _quilometragem = BehaviorSubject<Moto>();

  Stream<String> get login => _login.stream;
  Stream<String> get nome => _nome.stream;
  Stream<String> get senha => _login.stream;
  Stream<String> get email => _email.stream;
  Stream<String> get confirmarSenha => _confirmarSenha.stream;
  Stream<String> get telefone => _telefone.stream;
  // mudar modelo marca e quilometragem para receber o tipo Moto
  Stream<Moto> get modelo => _modelo.stream;
  Stream<Moto> get marca => _marca.stream;
  Stream<Moto> get quilometragem => _quilometragem.stream;

  Function(String) get mudarLogin => _login.sink.add;
  Function(String) get mudarNome => _nome.sink.add;
  Function(String) get mudarSenha => _senha.sink.add;
  Function(String) get mudarEmail => _email.sink.add;
  Function(String) get mudarConfirmarSenhar => _confirmarSenha.sink.add;
  Function(String) get mudarTelefone => _telefone.sink.add;
  // mudar modelo marca e quilometragem para receber o tipo Moto
  Function(Moto) get mudarModelo => _modelo.sink.add;
  Function(Moto) get mudarMarca => _marca.sink.add;
  Function(Moto) get mudarQuilometragem => _quilometragem.sink.add;

  ServicoFirebaseCadastroPorEmail _servico = ServicoFirebaseCadastroPorEmail();

  void salvar() {
    Usuario usuario = new Usuario();
    usuario.login = _login.value;
    usuario.nome = _nome.value;
    usuario.senha = _senha.value;
    usuario.email = _email.value;
    usuario.confirmarSenha = _confirmarSenha.value; // todo
    usuario.telefone = _telefone.value;
    // passar o objeto de moto que está sendo criado no cadastro para o bloc (esta tela)
    Moto moto = new Moto();
    //moto.modelo = _modelo.value;
    //moto.marca = _marca.value;
    //moto.quiometragem = _quilometragem.value;

    print(usuario.toString());
    print(moto.toString());
    _servico.salvar(usuario);
  }

  void dispose() {
    _login.close();
    _nome.close();
    _senha.close();
    _email.close();
    _confirmarSenha.close();
    _telefone.close();
    _modelo.close();
    _marca.close();
    _quilometragem.close();
  }
}
