-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 02/07/2012 às 12h39min
-- Versão do Servidor: 5.5.24
-- Versão do PHP: 5.3.10-1ubuntu3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `teste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `cpf` varchar(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `idPessoa` int(11) NOT NULL,
  `idResponsavel` int(11) DEFAULT NULL,
  `idTurma` int(11) NOT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idPessoa` (`idPessoa`),
  KEY `idResponsavel` (`idResponsavel`),
  KEY `idTurma` (`idTurma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

CREATE TABLE IF NOT EXISTS `atividade` (
  `idatv` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  `turno` varchar(30) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  PRIMARY KEY (`idatv`),
  KEY `idProfessor` (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

CREATE TABLE IF NOT EXISTS `candidato` (
  `cpf` varchar(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `idPessoa` int(11) NOT NULL,
  `idResponsavel` int(11) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idPessoa` (`idPessoa`),
  KEY `idResponsavel` (`idResponsavel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidatoAlocadoLista`
--

CREATE TABLE IF NOT EXISTS `candidatoAlocadoLista` (
  `cpfCandidato` varchar(11) NOT NULL,
  `idLista` int(11) NOT NULL,
  PRIMARY KEY (`cpfCandidato`,`idLista`),
  KEY `idLista` (`idLista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidatoViraAluno`
--

CREATE TABLE IF NOT EXISTS `candidatoViraAluno` (
  `cpfCandidato` varchar(11) NOT NULL,
  `cpfAluno` varchar(11) NOT NULL,
  PRIMARY KEY (`cpfCandidato`,`cpfAluno`),
  KEY `cpfAluno` (`cpfAluno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cestabasica`
--

CREATE TABLE IF NOT EXISTS `cestabasica` (
  `idces` int(11) NOT NULL,
  `dataEntrega` date NOT NULL,
  `qtd` int(11) DEFAULT NULL,
  PRIMARY KEY (`idces`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE IF NOT EXISTS `contrato` (
  `idc` int(11) NOT NULL,
  `qtdCota` int(2) NOT NULL,
  `valorCota` decimal(9,2) NOT NULL,
  `idPatrocinador` int(11) NOT NULL,
  PRIMARY KEY (`idc`),
  KEY `idPatrocinador` (`idPatrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curriculo`
--

CREATE TABLE IF NOT EXISTS `curriculo` (
  `cpf` varchar(11) NOT NULL,
  `profissao` varchar(30) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `miniCurriculo` blob,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idPessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `idcur` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  `idrequisito` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcur`),
  KEY `idrequisito` (`idrequisito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE IF NOT EXISTS `disciplina` (
  `iddis` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idrequisito` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddis`),
  KEY `idcurso` (`idcurso`),
  KEY `idrequisito` (`idrequisito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doacaoalimento`
--

CREATE TABLE IF NOT EXISTS `doacaoalimento` (
  `iddoa` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  `qtd` int(11) NOT NULL,
  `idMatricula` int(11) NOT NULL,
  PRIMARY KEY (`iddoa`),
  KEY `idMatricula` (`idMatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doacaoViraCesta`
--

CREATE TABLE IF NOT EXISTS `doacaoViraCesta` (
  `iddoacao` int(11) NOT NULL,
  `idcesta` int(11) NOT NULL,
  PRIMARY KEY (`iddoacao`,`idcesta`),
  KEY `idcesta` (`idcesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `cpf` varchar(11) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `profissao` varchar(30) DEFAULT NULL,
  `dataAdmissao` varchar(10) DEFAULT NULL,
  `salario` decimal(9,2) DEFAULT NULL,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idPessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `listaespera`
--

CREATE TABLE IF NOT EXISTS `listaespera` (
  `idlist` int(11) NOT NULL,
  `prazo` date NOT NULL,
  `idTurma` int(11) NOT NULL,
  PRIMARY KEY (`idlist`),
  KEY `idTurma` (`idTurma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `codigo` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nivelacesso` int(2) NOT NULL,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `idPessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `idmat` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `cpfAluno` varchar(11) NOT NULL,
  `idTurma` int(11) NOT NULL,
  PRIMARY KEY (`idmat`),
  KEY `idTurma` (`idTurma`),
  KEY `cpfAluno` (`cpfAluno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE IF NOT EXISTS `pagamento` (
  `idpag` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `valorPago` decimal(9,2) NOT NULL,
  `idContrato` int(11) NOT NULL,
  `idPatrocinador` int(11) NOT NULL,
  PRIMARY KEY (`idpag`),
  KEY `idContrato` (`idContrato`),
  KEY `idPatrocinador` (`idPatrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinador`
--

CREATE TABLE IF NOT EXISTS `patrocinador` (
  `idPt` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`idPt`),
  KEY `idPessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinadorfisico`
--

CREATE TABLE IF NOT EXISTS `patrocinadorfisico` (
  `cpf` varchar(11) NOT NULL,
  `idPatrocinador` int(11) NOT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idPatrocinador` (`idPatrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `patrocinadorjuridico`
--

CREATE TABLE IF NOT EXISTS `patrocinadorjuridico` (
  `cnpj` varchar(14) NOT NULL,
  `razaoSocial` varchar(30) DEFAULT NULL,
  `idPatrocinador` int(11) NOT NULL,
  PRIMARY KEY (`cnpj`),
  KEY `idPatrocinador` (`idPatrocinador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int(11) NOT NULL,
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
  `idprof` int(11) NOT NULL,
  `cargaHoraria` decimal(3,2) DEFAULT NULL,
  `idPessoa` int(11) NOT NULL,
  `cpfFuncionario` varchar(11) NOT NULL,
  PRIMARY KEY (`idprof`),
  KEY `idPessoa` (`idPessoa`),
  KEY `cpfFuncionario` (`cpfFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professorAlocadoCurso`
--

CREATE TABLE IF NOT EXISTS `professorAlocadoCurso` (
  `idprofessor` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  PRIMARY KEY (`idprofessor`,`idcurso`),
  KEY `idcurso` (`idcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE IF NOT EXISTS `responsavel` (
  `idresp` int(11) NOT NULL,
  `idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`idresp`),
  KEY `idPessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE IF NOT EXISTS `turma` (
  `idtur` int(11) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataTermino` date NOT NULL,
  `horInicio` time NOT NULL,
  `horTermino` time NOT NULL,
  `idProfessor` int(11) NOT NULL,
  PRIMARY KEY (`idtur`),
  KEY `idProfessor` (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`),
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`idResponsavel`) REFERENCES `responsavel` (`idresp`),
  ADD CONSTRAINT `aluno_ibfk_3` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idtur`);

--
-- Restrições para a tabela `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `atividade_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`idprof`);

--
-- Restrições para a tabela `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `candidato_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`),
  ADD CONSTRAINT `candidato_ibfk_2` FOREIGN KEY (`idResponsavel`) REFERENCES `responsavel` (`idresp`);

--
-- Restrições para a tabela `candidatoAlocadoLista`
--
ALTER TABLE `candidatoAlocadoLista`
  ADD CONSTRAINT `candidatoAlocadoLista_ibfk_1` FOREIGN KEY (`cpfCandidato`) REFERENCES `candidato` (`cpf`),
  ADD CONSTRAINT `candidatoAlocadoLista_ibfk_2` FOREIGN KEY (`idLista`) REFERENCES `listaespera` (`idlist`);

--
-- Restrições para a tabela `candidatoViraAluno`
--
ALTER TABLE `candidatoViraAluno`
  ADD CONSTRAINT `candidatoViraAluno_ibfk_1` FOREIGN KEY (`cpfCandidato`) REFERENCES `candidato` (`cpf`),
  ADD CONSTRAINT `candidatoViraAluno_ibfk_2` FOREIGN KEY (`cpfAluno`) REFERENCES `aluno` (`cpf`);

--
-- Restrições para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`idPatrocinador`) REFERENCES `patrocinador` (`idPt`);

--
-- Restrições para a tabela `curriculo`
--
ALTER TABLE `curriculo`
  ADD CONSTRAINT `curriculo_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`idrequisito`) REFERENCES `curso` (`idcur`) ON DELETE SET NULL;

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
  ADD CONSTRAINT `doacaoViraCesta_ibfk_1` FOREIGN KEY (`iddoacao`) REFERENCES `doacaoalimento` (`iddoa`),
  ADD CONSTRAINT `doacaoViraCesta_ibfk_2` FOREIGN KEY (`idcesta`) REFERENCES `cestabasica` (`idces`);

--
-- Restrições para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `listaespera`
--
ALTER TABLE `listaespera`
  ADD CONSTRAINT `listaespera_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idtur`);

--
-- Restrições para a tabela `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idtur`),
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`cpfAluno`) REFERENCES `aluno` (`cpf`);

--
-- Restrições para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`idc`),
  ADD CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`idPatrocinador`) REFERENCES `patrocinador` (`idPt`);

--
-- Restrições para a tabela `patrocinador`
--
ALTER TABLE `patrocinador`
  ADD CONSTRAINT `patrocinador_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `patrocinadorfisico`
--
ALTER TABLE `patrocinadorfisico`
  ADD CONSTRAINT `patrocinadorfisico_ibfk_1` FOREIGN KEY (`idPatrocinador`) REFERENCES `patrocinador` (`idPt`);

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
  ADD CONSTRAINT `professor_ibfk_2` FOREIGN KEY (`cpfFuncionario`) REFERENCES `funcionario` (`cpf`);

--
-- Restrições para a tabela `professorAlocadoCurso`
--
ALTER TABLE `professorAlocadoCurso`
  ADD CONSTRAINT `professorAlocadoCurso_ibfk_1` FOREIGN KEY (`idprofessor`) REFERENCES `professor` (`idprof`),
  ADD CONSTRAINT `professorAlocadoCurso_ibfk_2` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcur`);

--
-- Restrições para a tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD CONSTRAINT `responsavel_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`id`);

--
-- Restrições para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`idprof`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;