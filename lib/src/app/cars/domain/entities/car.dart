// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  bool operator ==(covariant Car other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.timestampCadastro == timestampCadastro &&
        other.modeloId == modeloId &&
        other.ano == ano &&
        other.combustivel == combustivel &&
        other.numPortas == numPortas &&
        other.cor == cor &&
        other.nomeModelo == nomeModelo &&
        other.valor == valor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        timestampCadastro.hashCode ^
        modeloId.hashCode ^
        ano.hashCode ^
        combustivel.hashCode ^
        numPortas.hashCode ^
        cor.hashCode ^
        nomeModelo.hashCode ^
        valor.hashCode;
  }
}
