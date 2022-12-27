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
- Data Local: 
- Dependency Injection: Responsável pela injeção de dependência do aplicativo. Este módulo conhece todos os outros
- Design System: Módulo independente que contém as cores, tipografias e os componentes reutilizáveis de UI
- Feature Auth: Módulo responsável pela tela de login
- Feature Home: Módulo responsável pelas telas de listagem de animes, detalhes de um anime clicado e animes favoritados
- Navigation: Módulo responsável pela navegação entre as features
