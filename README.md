# wswork_project

Projeto WS WORK

Nesse projeto acredito que o foco principal não seje as telas e sim a regra de negócio, então não me preocupei tanto com a questão de theme, e design system, caso tivesse mais telas seria necessário fazer um design system para o app e eu gosto de fazer arquitetando via packages que facilita bastante a reutilização do projeto e facilita a manutenção do mesmo.

Optei por uma arquitetura modularizada e por camadas, utilizando o pacote flutter_modular,que possibilita uma boa separação das responsabilidades e uma organização clara. Dessa maneira, criei um módulo específico para "carros", visando simplificar a manutenção e permitir uma fácil adição de novas funcionalidades. Essa abordagem também facilita a injeção de dependências, seguindo os princípios do SOLID, o que contribui significativamente para a manutenção e execução de testes unitários, de integração e de widgets. A estruturação dos módulos em domain/data/presentation, conforme os conceitos do clean dart, permite uma clara separação entre regra de negócio, lógica de dados e apresentação.

Com relação a entidades, criei uma entidade de lead para fazer o post da mesma com todas informações necessárias, o carro que escolheu, id do device, e junto disso algumas informações do celular. E no repositório coloco a regra de negócio, uma da regra foi a não inserção de dois leads no mesmo celular que tem o mesmo carro, então não terá carro duplicado

Além disso utilizei o bloc para fazer o gerenciamento de estado da aplicação, criando um controller para a pagina de seleção de carros com isso consigo modelar os dados de uma forma mais fácil. Para a utilização do banco sqlflite criei uma classe e utilizei do design pattern Singleton para ter apenas uma instância do db na minha aplicação e fazer a abertura do mesmo só uma vez e fechar assim que fazer a utilização. Com relação ao post dos leads de forma periodica criei um Timer que chama a função do post dos leads e após fazer o request deleto os leads que tenho no meu banco de dados pois acredito que não tenho que enviar novamente o lead que já foi enviado.

Foi criado também um cliente service para a utilização nesse caso do dio, porém se tivesse que mudar para o http seria de forma fácil a troca de biblioteca de client, no client criei também um response para a aplicação e um request também para facilitar.

# Gostaria de ter feito

Gostaria de fazer os testes de widgets, unitários e de integração, além de deixar o app com um visual mais elegante, com splash, icone.

Qualquer dúvida pode entrar em contato
