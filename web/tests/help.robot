*** Settings ***
Documentation       Suite de testes de recebimento de pedido de ajuda

Resource            ../resources/base.resource


*** Test Cases ***
Deve receber uma notificação de pedido de ajuda
# 1a Pessoa => Admin
# 3a Pessoa => Aluno (João)

# Dado que tenho um aluno cadastrado

    ${admin}    Get Fixture    admin
    ${joao}    Get Fixture    joao
    

    Reset Student    ${joao}[student][email]

    ${token}    Get Service Token    ${admin}
    ${student_id}    POST New Student    ${token}    ${joao}[student]

# Quando esse aluno (João) envia um pedido de ajuda via mobile

    POST Question    ${student_id}    ${joao}[question]

# Então devo ver uma notificação no painel do administrador

    Do Login    ${admin}
    Open Notifications
    Notification Should Be    ${joao}[question]


Deve poder responder um pedido de ajuda


# Dado que abri um novo pedido de ajuda
    ${admin}    Get Fixture    admin
    ${edu}    Get Fixture    edu
    
    Reset Student    ${edu}[student][email]

    ${token}    Get Service Token    ${admin}
    ${student_id}    POST New Student    ${token}    ${edu}[student]

    POST Question    ${student_id}    ${edu}[question]

# Quando respondo esse pedido

    Do Login    ${admin}
    Open Notifications
    # Preferi deixar a mensagem "Coma ovo!" hardcoded do que adicionar dentro da fixture de admin uma resposta
    Answer Notification    ${edu}[question]    Coma ovo!
    Submit Answer
    
# Então devo ver uma mensagem de sucesso

    Verify Toaster    Resposta enviada com sucesso
