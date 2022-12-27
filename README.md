# Animes

Aplicativo Flutter

## Principais dependências

- Navegação: [GoRouter](https://pub.dev/packages/go_router)
- Injeção de dependência: [Provider](https://pub.dev/packages/provider)
- Chamadas de rede: [Dio](https://pub.dev/packages/dio)
- Persistência de dados: [Hive](https://pub.dev/packages/hive)
- Gerenciamento de estado: [Flutter Triple](https://pub.dev/packages/flutter_triple)

## Arquitetura

O aplicativo segue o padrão MVVM + Clean Architecture contendo os seguintes módulos:

- App: Responsável pela inicialização do aplicativo. 

- Core:

- Data Local: Módulo responsável por salvar e obter as informações salvas localmente. Este módulo conhece qualquer módulo feature

- Dependency Injection: Responsável pela injeção de dependência do aplicativo. Este módulo conhece todos os outros

- Design System: Módulo independente que contém as cores, tipografias e os componentes reutilizáveis de UI

- Feature Auth: Módulo responsável pela tela de login

- Feature Home: Módulo responsável pelas telas de listagem de animes, detalhes de um anime clicado e animes favoritados

- Navigation: Responsável pela navegação entre as features (qualquer módulo feature tem acesso a este módulo). Cada feature pode possuir uma interface de navegação, como por exemplo: a [AuthBoundary](https://github.com/alvarobcprado/animes_app/blob/main/modules/navigation/lib/src/auth_boundary.dart) é uma interface que contém um método para navegação da Feature Auth para Feature Home. Sendo assim, cada feature é responsável pela implementação da navegação de outra feature para a sua própria feature (neste caso temos a [AuthBoundaryImpl](https://github.com/alvarobcprado/animes_app/blob/main/modules/feature_home/lib/src/boundary/auth_boundary_impl.dart) contida na Feature Home)
