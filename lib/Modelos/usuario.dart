class Usuario{
  String id;
  String login;
  String nome;
  String senha;
  String email;
  String linkFoto;
  String cpf;
  String telefone;

  Usuario();

  Usuario.firebase({this.id, this.nome, this.email,this.linkFoto});

}