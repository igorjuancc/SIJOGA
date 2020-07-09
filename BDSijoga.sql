CREATE TABLE tb_estado (
	id_estado SERIAL PRIMARY KEY NOT NULL,
	nome_estado VARCHAR(100) NOT NULL,
	sigla_estado VARCHAR(2) NOT NULL
);

CREATE TABLE tb_cidade(
	id_cidade SERIAL PRIMARY KEY NOT NULL,
	nome_cidade VARCHAR(100) NOT NULL,
	id_estado_cidade INT NOT NULL,
	FOREIGN KEY (id_estado_cidade) REFERENCES tb_estado (id_estado)
);

CREATE TABLE tb_pessoa(
	id_pessoa SERIAL PRIMARY KEY NOT NULL,
	nome_pessoa VARCHAR(100) NOT NULL,
	cpf_pessoa VARCHAR(11) UNIQUE,
	email_pessoa VARCHAR(30) UNIQUE,
	data_pessoa DATE NOT NULL,
	sexo_pessoa CHAR(1) NOT NULL,
	fone_pessoa VARCHAR(11),
	id_endereco_pessoa INT
);

CREATE TABLE tb_endereco(
	id_endereco SERIAL PRIMARY KEY,
	cep_endereco CHAR(8) NOT NULL,
	id_cidade_endereco INT NOT NULL,
	bairro_endereco VARCHAR(30) NOT NULL,
	rua_endereco VARCHAR(100) NOT NULL,
	nr_endereco INT NOT NULL,
	comp_endereco VARCHAR(30),
	id_pessoa_endereco INT,
	FOREIGN KEY (id_cidade_endereco) REFERENCES tb_cidade (id_cidade),
	FOREIGN KEY (id_pessoa_endereco) REFERENCES tb_pessoa (id_pessoa)
);

ALTER TABLE tb_pessoa ADD FOREIGN KEY (id_endereco_pessoa) REFERENCES tb_endereco(id_endereco);

CREATE TABLE tb_advogado(
	id_advogado SERIAL PRIMARY KEY NOT NULL,
	senha_advogado VARCHAR(100) NOT NULL,
	reg_oab_advogado INT NOT NULL,
	FOREIGN KEY (id_advogado) REFERENCES tb_pessoa (id_pessoa)
);

CREATE TABLE tb_juiz(
	id_juiz SERIAL PRIMARY KEY NOT NULL,
	senha_juiz VARCHAR(100) NOT NULL,
	reg_oab_juiz INT NOT NULL,
	FOREIGN KEY (id_juiz) REFERENCES tb_pessoa (id_pessoa)
);

CREATE TABLE tb_parte(
	id_parte SERIAL PRIMARY KEY NOT NULL,
	senha_parte VARCHAR(100) NOT NULL,
	FOREIGN KEY (id_parte) REFERENCES tb_pessoa (id_pessoa)
);


/* ================================================================================ */

INSERT INTO tb_estado (nome_estado,sigla_estado) VALUES 
('Acre','AC'),
('Alagoas','AL'),
('Amapá','AP'),
('Amazonas','AM'),
('Bahia','BA'),
('Ceará','CE'),
('Distrito Federal','DF'),
('Espírito Santo','ES'),
('Goiás','GO'),
('Maranhão','MA'),
('Mato Grosso','MT'),
('Mato Grosso do Sul','MS'),
('Minas Gerais','MG'),
('Pará','PA'),
('Paraíba','PB'),
('Paraná','PR'),
('Pernambuco','PE'),
('Piauí','PI'),
('Rio de Janeiro','RJ'),
('Rio Grande do Norte','RN'),
('Rio Grande do Sul','RS'),
('Rondônia','RO'),
('Roraima','RR'),
('Santa Catarina','SC'),
('São Paulo','SP'),
('Sergipe','SE'),
('Tocantins','TO'); 

INSERT INTO tb_cidade (nome_cidade,id_estado_cidade) VALUES 
('Brasília',7),
('Acrelândia',1),
('Assis Brasil',1),
('Brasiléia',1),
('Bujari',1),
('Capixaba',1),
('Cruzeiro do Sul',1),
('Epitaciolândia',1),
('Feijó',1),
('Jordão',1),
('Mâncio Lima',1),
('Água Branca',2),
('Anadia',2),
('Arapiraca',2),
('Atalaia',2),
('Barra de Santo Antônio',2),
('Barra de São Miguel',2),
('Batalha',2),
('Belém',2),
('Belo Monte',2),
('Boca da Mata',2),
('Amapá',3),
('Calçoene',3),
('Cutias',3),
('Ferreira Gomes',3),
('Itaubal',3),
('Laranjal do Jari',3),
('Macapá',3),
('Mazagão',3),
('Oiapoque',3),
('Pedra Branca do Amapari',3),
('São Paulo de Olivença',4),
('São Sebastião do Uatumã',4),
('Silves',4),
('Tabatinga',4),
('Tapauá',4),
('Tefé',4),
('Tonantins',4),
('Uarini',4),
('Urucará',4),
('Urucurituba',4),
('Aurelino Leal',5),
('Baianópolis',5),
('Baixa Grande',5),
('Banzaê',5),
('Barra',5),
('Barra da Estiva',5),
('Barra do Choça',5),
('Barra do Mendes',5),
('Barra do Rocha',5),
('Barreiras',5),
('Frecheirinha',6),
('General Sampaio',6),
('Graça',6),
('Granja',6),
('Granjeiro',6),
('Groaíras',6),
('Guaiúba',6),
('Guaraciaba do Norte',6),
('Guaramiranga',6),
('Mantenópolis',8),
('Marataízes',8),
('Marechal Floriano',8),
('Marilândia',8),
('Mimoso do Sul',8),
('Montanha',8),
('Mucurici',8),
('Muniz Freire',8),
('Muqui',8),
('Nova Venécia',8),
('Cabeceiras',9),
('Cachoeira Alta',9),
('Cachoeira de Goiás',9),
('Cachoeira Dourada',9),
('Caçu',9),
('Caiapônia',9),
('Caldas Novas',9),
('Caldazinha',9),
('Campestre de Goiás',9),
('Campinaçu',9),
('Cajari',10),
('Campestre do Maranhão',10),
('Cândido Mendes',10),
('Cantanhede',10),
('Capinzal do Norte',10),
('Carolina',10),
('Carutapera',10),
('Caxias',10),
('Cedral',10),
('Central do Maranhão',10),
('Figueirópolis D Oeste',11),
('Gaúcha do Norte',11),
('General Carneiro',11),
('Glória D Oeste',11),
('Guarantã do Norte',11),
('Guiratinga',11),
('Indiavaí',11),
('Ipiranga do Norte',11),
('Itanhangá',11),
('Itaúba',11),
('Anaurilândia',12),
('Angélica',12),
('Antônio João',12),
('Aparecida do Taboado',12),
('Aquidauana',12),
('Aral Moreira',12),
('Bandeirantes',12),
('Bataguassu',12),
('Batayporã',12),
('Bela Vista',12),
('Arceburgo',13),
('Arcos',13),
('Areado',13),
('Argirita',13),
('Aricanduva',13),
('Arinos',13),
('Astolfo Dutra',13),
('Ataléia',13),
('Augusto de Lima',13),
('Baependi',13),
('Breu Branco',14),
('Breves',14),
('Bujaru',14),
('Cachoeira do Arari',14),
('Cachoeira do Piriá',14),
('Cametá',14),
('Canaã dos Carajás',14),
('Capanema',14),
('Capitão Poço',14),
('Castanhal',14),
('Araruna',15),
('Areia',15),
('Areia de Baraúnas',15),
('Areial',15),
('Aroeiras',15),
('Assunção',15),
('Baía da Traição',15),
('Bananeiras',15),
('Baraúna',15),
('Barra de Santa Rosa',15),
('Balsa Nova',16),
('Bandeirantes',16),
('Barbosa Ferraz',16),
('Barra do Jacaré',16),
('Barracão',16),
('Bela Vista da Caroba',16),
('Bela Vista do Paraíso',16),
('Bituruna',16),
('Boa Esperança',16),
('Boa Esperança do Iguaçu',16),
('Águas Belas',17),
('Alagoinha',17),
('Aliança',17),
('Altinho',17),
('Amaraji',17),
('Angelim',17),
('Araçoiaba',17),
('Araripina',17),
('Arcoverde',17),
('Barra de Guabiraba',17),
('Itainópolis',18),
('Itaueira',18),
('Jacobina do Piauí',18),
('Jaicós',18),
('Jardim do Mulato',18),
('Jatobá do Piauí',18),
('Jerumenha',18),
('João Costa',18),
('Joaquim Pires',18),
('Joca Marques',18),
('Pinheiral',19),
('Piraí',19),
('Porciúncula',19),
('Porto Real',19),
('Quatis',19),
('Queimados',19),
('Quissamã',19),
('Resende',19),
('Rio Bonito',19),
('Rio Claro',19),
('Equador',20),
('Espírito Santo',20),
('Extremoz',20),
('Felipe Guerra',20),
('Fernando Pedroza',20),
('Florânia',20),
('Francisco Dantas',20),
('Frutuoso Gomes',20),
('Galinhos',20),
('Goianinha',20),
('Amaral Ferrador',21),
('Ametista do Sul',21),
('André da Rocha',21),
('Anta Gorda',21),
('Antônio Prado',21),
('Arambaré',21),
('Araricá',21),
('Aratiba',21),
('Arroio do Meio',21),
('Arroio do Padre',21),
('Ariquemes',22),
('Buritis',22),
('Cabixi',22),
('Cacaulândia',22),
('Cacoal',22),
('Campo Novo de Rondônia',22),
('Candeias do Jamari',22),
('Castanheiras',22),
('Cerejeiras',22),
('Chupinguaia',22),
('Alto Alegre',23),
('Amajari',23),
('Boa Vista',23),
('Bonfim',23),
('Cantá',23),
('Caracaraí',23),
('Caroebe',23),
('Iracema',23),
('Mucajaí',23),
('Normandia',23),
('Alfredo Wagner',24),
('Alto Bela Vista',24),
('Anchieta',24),
('Angelina',24),
('Anita Garibaldi',24),
('Anitápolis',24),
('Antônio Carlos',24),
('Apiúna',24),
('Arabutã',24),
('Araquari',24),
('Buritama',25),
('Buritizal',25),
('Cabrália Paulista',25),
('Cabreúva',25),
('Caçapava',25),
('Cachoeira Paulista',25),
('Caconde',25),
('Cafelândia',25),
('Caiabu',25),
('Caieiras',25),
('Boquim',26),
('Brejo Grande',26),
('Campo do Brito',26),
('Canhoba',26),
('Canindé de São Francisco',26),
('Capela',26),
('Carira',26),
('Carmópolis',26),
('Cedro de São João',26),
('Cristinápolis',26),
('Lizarda',27),
('Luzinópolis',27),
('Marianópolis do Tocantins',27),
('Mateiros',27),
('Maurilândia do Tocantins',27),
('Miracema do Tocantins',27),
('Miranorte',27),
('Monte do Carmo',27),
('Monte Santo do Tocantins',27),
('Muricilândia',27);


