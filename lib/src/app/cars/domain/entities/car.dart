class Car {
  final int id;
  final DateTime timestampCadastro;
  final int modeloId;
  final int ano;
  final String combustivel;
  final int numPortas;
  final String cor;
  final String nomeModelo;
  final double valor;
  Car({
    required this.id,
    required this.timestampCadastro,
    required this.modeloId,
    required this.ano,
    required this.combustivel,
    required this.numPortas,
    required this.cor,
    required this.nomeModelo,
    required this.valor,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'] as int,
      timestampCadastro: DateTime.fromMillisecondsSinceEpoch(
        json['timestamp_cadastro'] * 1000,
      ),
      modeloId: json['modelo_id'] as int,
      ano: json['ano'] as int,
      combustivel: json['combustivel'] as String,
      numPortas: json['num_portas'] as int,
      cor: json['cor'] as String,
      nomeModelo: json['nome_modelo'] as String,
      valor: json['valor'] as double,
    );
  }
}
