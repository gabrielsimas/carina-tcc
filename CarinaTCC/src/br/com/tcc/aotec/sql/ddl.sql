--
-- Banco de Dados: `aotec`
--

CREATE DATABASE IF NOT EXISTS aotec;

USE aotec;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `idResponsavel` int(11) DEFAULT NULL,
  `idTurma` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  --KEY `idPessoa` (`idPessoa`),
  --KEY `idResponsavel` (`idResponsavel`),
  --KEY `idTurma` (`idTurma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--
/*
 *TODO: criar a tabela Turno
 *TODO: Criar um campo estrangeiro idTurno 
 */
CREATE TABLE IF NOT EXISTS `atividade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `turno` varchar(30) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE IF NOT EXISTS `candidato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `idResponsavel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidatoAlocadoLista`
--
/*
CREATE TABLE IF NOT EXISTS `candidatoAlocadoLista` (
  `cpfCandidato` varchar(11) NOT NULL,
  `idLista` int(11) NOT NULL,
  PRIMARY KEY (`cpfCandidato`,`idLista`),
  KEY `idLista` (`idLista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
*/

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidatoViraAluno`
--
/*
CREATE TABLE IF NOT EXISTS `candidatoViraAluno` (
  `cpfCandidato` varchar(11) NOT NULL,
  `cpfAluno` varchar(11) NOT NULL,
  PRIMARY KEY (`cpfCandidato`,`cpfAluno`),
  KEY `cpfAluno` (`cpfAluno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
*/
-- --------------------------------------------------------

--
-- Estrutura da tabela `cestabasica`
--
/* A Cesta Básica é umam composição de 
 * vários alimentos, logo deve ser uma união com os alimentos
 * */
CREATE TABLE IF NOT EXISTS `cestabasica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataEntrega` date NOT NULL,
  `qtd` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE IF NOT EXISTS `contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qtdCota` int(2) NOT NULL,
  `valorCota` decimal(9,2) NOT NULL,
  `idPatrocinador` int(11) NOT NULL,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curriculo`
--

CREATE TABLE IF NOT EXISTS `curriculo` (
  `id` varchar(11) NOT NULL,
  `profissao` varchar(30) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `miniCurriculo` blob,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `idrequisito` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE IF NOT EXISTS `disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idrequisito` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doacaoalimento`
--

CREATE TABLE IF NOT EXISTS `doacaoalimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  `qtd` int(11) NOT NULL,
  `idMatricula` int(11) NOT NULL,
  PRIMARY KEY (`iddoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doacaoViraCesta`
--
/*
 * Ação não vira Entidade
 */
/*
CREATE TABLE IF NOT EXISTS `doacaoViraCesta` (
  `iddoacao` int(11) NOT NULL,
  `idcesta` int(11) NOT NULL,
  PRIMARY KEY (`iddoacao`,`idcesta`),
  KEY `idcesta` (`idcesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
*/
-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `profissao` varchar(30) DEFAULT NULL,
  `dataAdmissao` varchar(10) DEFAULT NULL,
  `salario` decimal(9,2) DEFAULT NULL,
  --`idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `listaespera`
--

CREATE TABLE IF NOT EXISTS `listaespera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prazo` date NOT NULL,
  `idTurma` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nivelacesso` int(2) NOT NULL,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `id` int(11) NOT NULL,
  cod_matricula INTEGER NOT NULL, --Criado
  `data` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `cpfAluno` varchar(11) NOT NULL,
  `idTurma` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE IF NOT EXISTS `pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `valorPago` decimal(9,2) NOT NULL,
  `idContrato` int(11) NOT NULL,
  `idPatrocinador` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinador`
--

CREATE TABLE IF NOT EXISTS `patrocinador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) DEFAULT NULL,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinadorfisico`
--

CREATE TABLE IF NOT EXISTS `patrocinadorfisico` (
  id INTEGER NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `idPatrocinador` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinadorjuridico`
--

CREATE TABLE IF NOT EXISTS `patrocinadorjuridico` (
  id INTEGER NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) NOT NULL,
  `razaoSocial` varchar(30) DEFAULT NULL,
  `idPatrocinador` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `idade` int(2) DEFAULT NULL,
  `logradouro` varchar(40) DEFAULT NULL,
  `numero` int(4) DEFAULT NULL,
  `complemento` varchar(10) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE IF NOT EXISTS `professor` (
  id INTEGER NOT NULL AUTO_INCREMENT,
  `idprof` int(11) NOT NULL,
  `cargaHoraria` decimal(3,2) DEFAULT NULL,
  `idPessoa` int(11) NOT NULL,
  `cpfFuncionario` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professorAlocadoCurso`
--

CREATE TABLE IF NOT EXISTS `professorAlocadoCurso` (
  id INTEGER NOT NULL AUTO_INCREMENT,
  `idprofessor` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL, 
  --PRIMARY KEY (`idprofessor`,`idcurso`),
  KEY `idcurso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE IF NOT EXISTS `responsavel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE IF NOT EXISTS `turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataInicio` date NOT NULL,
  `dataTermino` date NOT NULL,
  `horInicio` time NOT NULL,
  `horTermino` time NOT NULL,
  `idProfessor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`),
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`idResponsavel`) REFERENCES `responsavel` (`id`),
  ADD CONSTRAINT `aluno_ibfk_3` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`id`);

--
-- Restrições para a tabela `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `atividade_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`id`);

--
-- Restrições para a tabela `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `candidato_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`),
  ADD CONSTRAINT `candidato_ibfk_2` FOREIGN KEY (`idResponsavel`) REFERENCES `responsavel` (`id`);

--
-- Restrições para a tabela `candidatoAlocadoLista`
--
ALTER TABLE `candidatoAlocadoLista`
  ADD CONSTRAINT `candidatoAlocadoLista_ibfk_1` FOREIGN KEY (`idCandidato`) REFERENCES `candidato` (`id`),
  ADD CONSTRAINT `candidatoAlocadoLista_ibfk_2` FOREIGN KEY (`idLista`) REFERENCES `listaespera` (`id`);

--
-- Restrições para a tabela `candidatoViraAluno`
--
ALTER TABLE `candidatoViraAluno`
  ADD CONSTRAINT `candidatoViraAluno_ibfk_1` FOREIGN KEY (`idCandidato`) REFERENCES `candidato` (`id`),
  ADD CONSTRAINT `candidatoViraAluno_ibfk_2` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`id`);

--
-- Restrições para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`idPatrocinador`) REFERENCES `patrocinador` (`id`);

--
-- Restrições para a tabela `curriculo`
--
ALTER TABLE `curriculo`
  ADD CONSTRAINT `curriculo_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`idrequisito`) REFERENCES `curso` (`id`) ON DELETE SET NULL;

--
-- Restrições para a tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disciplina_ibfk_2` FOREIGN KEY (`idrequisito`) REFERENCES `disciplina` (`iddis`) ON DELETE SET NULL;

--
-- Restrições para a tabela `doacaoalimento`
--
ALTER TABLE `doacaoalimento`
  ADD CONSTRAINT `doacaoalimento_ibfk_1` FOREIGN KEY (`idMatricula`) REFERENCES `matricula` (`idmat`);

--
-- Restrições para a tabela `doacaoViraCesta`
--
ALTER TABLE `doacaoViraCesta`
  ADD CONSTRAINT `doacaoViraCesta_ibfk_1` FOREIGN KEY (`iddoacao`) REFERENCES `doacaoalimento` (`id`),
  ADD CONSTRAINT `doacaoViraCesta_ibfk_2` FOREIGN KEY (`idcesta`) REFERENCES `cestabasica` (`id`);

--
-- Restrições para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `listaespera`
--
ALTER TABLE `listaespera`
  ADD CONSTRAINT `listaespera_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`id`);

--
-- Restrições para a tabela `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`id`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`id`);

--
-- Restrições para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`id`),
  ADD CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`idPatrocinador`) REFERENCES `patrocinador` (`id`);

--
-- Restrições para a tabela `patrocinador`
--
ALTER TABLE `patrocinador`
  ADD CONSTRAINT `patrocinador_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `patrocinadorfisico`
--
ALTER TABLE `patrocinadorfisico`
  ADD CONSTRAINT `patrocinadorfisico_ibfk_1` FOREIGN KEY (`idPatrocinador`) REFERENCES `patrocinador` (`id`);

--
-- Restrições para a tabela `patrocinadorjuridico`
--
ALTER TABLE `patrocinadorjuridico`
  ADD CONSTRAINT `patrocinadorjuridico_ibfk_1` FOREIGN KEY (`idPatrocinador`) REFERENCES `patrocinador` (`idPt`);

--
-- Restrições para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`),
  ADD CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`id`);

--
-- Restrições para a tabela `professorAlocadoCurso`
--
ALTER TABLE `professorAlocadoCurso`
  ADD CONSTRAINT `professorAlocadoCurso_ibfk_1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`id`),
  ADD CONSTRAINT `professorAlocadoCurso_ibfk_2` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`id`);

--
-- Restrições para a tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD CONSTRAINT `responsavel_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;