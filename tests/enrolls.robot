***Settings***
Documentation       Suite de testes de matrícula de alunos
...                 Administrador uma vez logado consegue matricular alunos na academia

Resource        ../resources/base.resource

***Test Cases***
Deve matricular um aluno

    ${admin}        Get Fixtures        admin

    ${student}      Get Fixtures        student

    Reset Student Enroll  ${student}[email]
    Do Login    ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student      ${student}[name]
    Select Plan         ${student}[enroll][plan]
    Fill Start Date     
    Submit Enroll Form
    Verify Toaster  Matrícula cadastrada com sucesso