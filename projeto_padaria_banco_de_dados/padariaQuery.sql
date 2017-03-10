/*create database padaria
default character set utf8
default collate utf8_general_ci;

use padaria;
create table cliente(
cpf_cl varchar(14) not null,
nome_cl varchar(60) not null,
email_cl varchar(60) not null,
telefone_cl int not null,
primary key(cpf_cl)
)default charset = utf8;

create table fornecedor(
cod_forn  SMALLINT not null AUTO_INCREMENT,
nome_forn varchar(60) not null,
cnpj_forn varchar(18) not null,
endereco_forn varchar(200) not null,
primary key(cod_forn)
)default charset = utf8;

create table produto(
cod_prod  SMALLINT not null AUTO_INCREMENT,
tipo_prod varchar(30) not null,
nome_prod varchar(60) not null,
valor_prod DECIMAL not null,
primary key(cod_prod)
)default charset = utf8;

create table funcionario(
cpf_fc varchar(14) not null,
nome_fc varchar(60) not null,
carteiratrab_fc varchar(15) not null,
cargo_fc varchar(30) not null,
salario_fc DECIMAL not null,
primary key(cpf_fc)
)default charset = utf8;

create table compra_venda(
cod_cv SMALLINT not null,
data_cv datetime not null,
quantidade_cv varchar(30) not null,
cpf_cl varchar(14) not null,
cpf_fc varchar(14) not null,
cod_prod SMALLINT not null,
primary key(cpf_cl,cpf_fc,cod_prod),
FOREIGN KEY (cpf_cl) REFERENCES cliente(cpf_cl),
FOREIGN KEY (cpf_fc) REFERENCES funcionario(cpf_fc),
FOREIGN KEY (cod_prod) REFERENCES produto(cod_prod)

)default charset = utf8;


alter table compra_venda add index(cod_cv);

alter table compra_venda change cod_cv cod_cv smallint NOT NULL AUTO_INCREMENT;

create table produziu(
mes_prd date not null,
quantidadde_prd SMALLINT not null,

cpf_fc varchar(14) not null,
cod_prod SMALLINT not null,
primary key(cpf_fc,cod_prod),
FOREIGN KEY (cpf_fc) REFERENCES funcionario(cpf_fc),
FOREIGN KEY (cod_prod) REFERENCES produto(cod_prod)

)default charset = utf8;
*/


