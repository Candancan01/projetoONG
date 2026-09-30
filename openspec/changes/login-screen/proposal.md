## Why

O projeto prevê login para tutores/adotantes e administradores, mas o frontend Reflex ainda exibe apenas a página inicial de exemplo. Uma tela de entrada simples torna esse acesso identificável e oferece os campos correspondentes ao contrato de login já existente no Xano.

## What Changes

- Substituir a página inicial de exemplo por uma tela básica de login do Porto Seguro Pet.
- Apresentar campos de e-mail e senha e uma ação de entrar.
- Manter a interface no Reflex e não simular autenticação nem persistir credenciais; a integração com o endpoint Xano depende de configuração de URL fora deste escopo.
- Não incluir cadastro, recuperação de senha, autorização por perfil ou outras áreas do sistema.

## Capabilities

### New Capabilities
- `login-screen`: experiência visual básica de entrada para usuários do sistema.

### Modified Capabilities

## Impact

- Frontend Reflex em `projetoONG/projetoONG.py`.
- O contrato existente `POST auth/login` do Xano recebe e-mail e senha e retorna token; nenhuma alteração no backend ou chamada de API está prevista nesta mudança.
- Nenhuma dependência nova.
