# Domain Model — Porto Seguro Pet

## 1. Visão do domínio

O Porto Seguro Pet é um sistema de gerenciamento para uma ONG de
proteção animal. O domínio abrange o acompanhamento dos animais
desde o resgate, passando pelos cuidados necessários, lares
temporários e processo de adoção, até o acompanhamento pós-adoção.

O sistema também contempla usuários, tutores/adotantes, voluntários,
atividades, doações e suprimentos utilizados pela ONG.

---

## 2. Principais conceitos do domínio

### Animal

Representa o animal resgatado pela ONG e acompanhado durante o
período em que estiver sob seus cuidados.

O animal pode passar por diferentes situações, como cuidados
veterinários, permanência em lar temporário, disponibilização para
adoção, processo de adoção e adoção efetivada.

O status atual deve representar a situação atual do animal e ser
atualizado quando ocorrer uma mudança relevante.

---

### Lar Temporário

Representa um local ou responsável que recebe temporariamente um
animal que está sob os cuidados da ONG.

Um animal pode passar por diferentes lares temporários ao longo do
tempo. O histórico dessas permanências deve ser mantido.

---

### Atendimento Veterinário

Representa um atendimento realizado para acompanhar a condição de
saúde de um animal.

O atendimento pode ocorrer em diferentes momentos, sempre que houver
necessidade de avaliação ou tratamento. Não está restrito ao momento
do resgate.

---

### Tutor/Adotante

Representa a pessoa interessada em adotar um animal e que participa
do processo de adoção.

O tutor/adotante possui informações cadastrais e pode realizar
diferentes solicitações de adoção ao longo do tempo.

---

### Usuário

Representa uma conta de acesso ao sistema.

Existem dois tipos de acesso:

- TUTOR/ADOTANTE: utiliza o sistema para acompanhar suas
  solicitações e processos de adoção;
- ADMINISTRADOR: possui acesso às informações e aos processos
  internos da ONG.

O administrador não é representado por uma entidade separada. Seu
tipo de acesso é definido no próprio usuário.

---

### Processo de Adoção

Representa a solicitação e o processo de avaliação para adoção de um
animal.

O processo relaciona um animal a um tutor/adotante e possui uma
situação que acompanha sua evolução.

A aprovação da solicitação não significa que a adoção já foi
efetivada. A adoção é efetivada somente após a confirmação e a
entrega ou retirada do animal.

---

### Acompanhamento Pós-Adoção

Representa os acompanhamentos realizados após a efetivação da
adoção.

O acompanhamento pode envolver diferentes ações, de acordo com as
necessidades do animal e da adoção. Não é limitado a visitas
presenciais.

---

### Voluntário

Representa uma pessoa aprovada pela ONG para atuar como voluntária.

Um voluntário pode participar de diferentes atividades da ONG.

---

### Atividade

Representa uma atividade realizada ou organizada pela ONG.

As atividades podem envolver, por exemplo, resgate de animais,
cuidados com animais, transporte, feiras e eventos de adoção,
divulgação, campanhas de arrecadação e atividades administrativas.

---

### Doador

Representa uma pessoa que realiza doações financeiras para a ONG.

Um mesmo doador pode realizar diferentes doações financeiras ao
longo do tempo utilizando o mesmo cadastro.

---

### Doação

Representa uma contribuição financeira realizada para a ONG.

A doação financeira é associada a um doador e possui informações
sobre valor e data.

Doações de materiais não são representadas como doações financeiras.
Os materiais recebidos são registrados como entradas no estoque.

---

### Estoque de Suprimentos

Representa os suprimentos utilizados pela ONG nos cuidados dos
animais e em suas atividades.

O estoque mantém a quantidade disponível e a quantidade mínima
definida para indicar a necessidade de reposição.

---

### Movimentação de Estoque

Representa uma entrada ou saída de suprimentos do estoque.

As movimentações mantêm o histórico das alterações na quantidade dos
suprimentos.

As entradas podem ocorrer por compra, doação ou reposição. As saídas
podem ocorrer, por exemplo, pelo uso nos animais, atividades da ONG
ou descarte.

---

## 3. Relacionamentos do domínio

### Animal e Lar Temporário

Um animal pode possuir vários registros de permanência em lares
temporários.

Um lar temporário pode receber vários animais ao longo do tempo.

O relacionamento mantém o histórico das permanências.

**Cardinalidade:**

ANIMAL (1) : N ANIMAL_LAR_TEMPORARIO

LAR_TEMPORARIO (1) : N ANIMAL_LAR_TEMPORARIO

---

### Animal e Atendimento Veterinário

Um animal pode receber vários atendimentos veterinários ao longo do
tempo.

**Cardinalidade:**

ANIMAL (1) : N ATENDIMENTO_VETERINARIO

---

### Animal e Processo de Adoção

Um animal pode estar relacionado a diferentes processos de adoção ao
longo do tempo.

**Cardinalidade:**

ANIMAL (1) : N PROCESSO_ADOCAO

---

### Tutor/Adotante e Processo de Adoção

Um tutor ou adotante pode realizar diferentes solicitações de adoção.

**Cardinalidade:**

TUTOR_ADOTANTE (1) : N PROCESSO_ADOCAO

---

### Processo de Adoção e Acompanhamento Pós-Adoção

Um processo de adoção pode possuir vários registros de
acompanhamento após a adoção.

**Cardinalidade:**

PROCESSO_ADOCAO (1) : N ACOMPANHAMENTO_POS_ADOCAO

---

### Doador e Doação

Um doador pode realizar várias doações financeiras ao longo do
tempo.

**Cardinalidade:**

DOADOR (1) : N DOACAO

---

### Estoque e Movimentação de Estoque

Um suprimento pode possuir várias movimentações de entrada e saída.

**Cardinalidade:**

ESTOQUE_SUPRIMENTOS (1) : N MOVIMENTACAO_ESTOQUE

---

### Voluntário e Atividade

Um voluntário pode participar de várias atividades.

Uma atividade pode contar com a participação de vários voluntários.

Esse relacionamento é representado por uma entidade associativa.

**Cardinalidade conceitual:**

VOLUNTARIO (N) : N ATIVIDADE

A participação é registrada por:

VOLUNTARIO_ATIVIDADE

---

### Usuário e Tutor/Adotante

Um usuário do tipo TUTOR/ADOTANTE está associado a um cadastro de
tutor/adotante.

**Cardinalidade:**

USUARIO (1) : 1 TUTOR_ADOTANTE

Usuários do tipo ADMINISTRADOR não possuem uma entidade de
administrador separada.

---

## 4. Relacionamentos associativos

### Animal e Lar Temporário

O relacionamento entre animais e lares temporários é representado
por ANIMAL_LAR_TEMPORARIO.

Essa estrutura permite registrar diferentes períodos de permanência
de um mesmo animal e manter seu histórico de acolhimento.

### Voluntário e Atividade

O relacionamento entre voluntários e atividades é representado por
VOLUNTARIO_ATIVIDADE.

Essa estrutura permite registrar quais voluntários participam de
cada atividade e de quais atividades cada voluntário participa.

---

## 5. Regras estruturais importantes

- O cadastro do animal ocorre após o resgate.
- Uma solicitação de resgate não significa automaticamente que o
  animal será resgatado.
- O status do animal deve representar sua situação atual.
- O histórico de permanência em lares temporários deve ser mantido.
- A aprovação de uma solicitação de adoção não significa que a
  adoção foi efetivada.
- A adoção somente é considerada efetivada após a confirmação e a
  entrega ou retirada do animal.
- O atendimento veterinário pode ocorrer em diferentes momentos.
- O acompanhamento pós-adoção é genérico e não se limita a visitas
  presenciais.
- Um mesmo doador pode realizar diferentes doações financeiras
  utilizando o mesmo cadastro.
- Doações materiais são registradas como entradas no estoque.
- As movimentações de estoque devem manter o histórico de entradas e
  saídas.
- Um voluntário pode participar de várias atividades e uma atividade
  pode contar com vários voluntários.