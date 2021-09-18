CREATE schema consultorio_medico2;

CREATE TABLE paciente(
CPF varchar(15) not null,
nome varchar(30),
DataNascimento date,
cidade varchar(20),
bairro varchar(20),
rua varchar(30),
NdaCasa varchar(4),
NdApt varchar(4),
celular varchar(15),
telefone varchar(10),
TipoSanguineo varchar(4),
convenio varchar(10),
idDoenca varchar(15),
idAlergia varchar(35),
altura numeric (4.2),
peso numeric(4.2),
constraint PK_agendamento primary key (CPF)
);

CREATE TABLE funcionario(
idFuncionario varchar(8) not null,
Funcionario varchar(40),
idCargo varchar(8) not null,
consultorio varchar(4),
constraint PK_funcionario primary key(idFuncionario)
);

CREATE TABLE agendamento(
idAgendamento varchar(10) not null,
CPF varchar(15) not null,
DataConsulta date not null,
horario varchar(5) not null,
idFuncionario varchar(8) not null,
idProcedimento varchar(20) not null,
convenio varchar(10),
constraint PK_agendamento primary key(idAgendamento)
);

Create table procedimento(
idProcedimento varchar(10) not null,
procedimento varchar(30) not null, 
valor numeric(4,1),
constraint PK_procedimento primary key(idProcedimento));


CREATE TABLE convenio(
convenio varchar(10) not null,
PorcentagemDesconto numeric(4,2) not null,
constraint PK_convenio primary key(convenio)
);

CREATE TABLE doencas(
idDoenca varchar(10) not null,
NomeDoenca varchar(40) not null,
constraint PK_doencas primary key(idDoenca)
);

CREATE TABLE alergia(
idMedicamento varchar(10) not null,
Medicamento varchar(40) not null,
constraint PK_alergia primary key(idMedicamento) 
);

CREATE TABLE relacao(
CPF varchar(15) not null,
idDoenca varchar (10),
idMedicamento varchar(10),
constraint PK_relacao primary key(CPF)
);
CREATE TABLE cargo(
idCargo varchar(8) not null primary key,
Cargo varchar(20)
);
CREATE TABLE realiza(
CPF varchar(15) not null,
idProcedimento varchar(10) not null, 
constraint PK_realiza primary key(CPF) );
alter table relacao add constraint fk_relacao_cpf foreign key(CPF) references paciente(CPF);
alter table relacao add constraint fk_relacao_idDoenca foreign key(idDoenca) references doencas(idDoenca);
alter table relacao add constraint fk_relacao_idMedicamento foreign key(idMedicamento) references alergia(idMedicamento);
alter table paciente add constraint fk_paciente_convenio foreign key(convenio) references convenio(convenio);
alter table funcionario add constraint fk_funcionario_cargo foreign key(idCargo) references cargo(idCargo);
alter table agendamento add constraint fk_agendamento_cpf foreign key(CPF) references paciente(CPF);
alter table agendamento add constraint fk_agendamento_idFuncionario foreign key(idFuncionario) references funcionario(idFuncionario);
alter table agendamento add constraint fk_agendamento_convenio foreign key(convenio) references convenio(convenio);
alter table agendamento add constraint fk_agendamento_procedimento foreign key(idProcedimento) references procedimento(idProcedimento);
alter table realiza add constraint fk_realiza_cpf foreign key(CPF) references paciente(CPF);
alter table realiza add constraint fk_realiza_procedimento foreign key(idProcedimento) references procedimento(idProcedimento);
