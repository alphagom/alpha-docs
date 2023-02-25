-- -----------------------------------------------------
-- Schema devgom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `devgom` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `devgom` ;

-- -----------------------------------------------------
-- Table `devgom`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`user` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`id`	varchar(20)	NULL,
	`pw`	varchar(250)	NULL,
	`email`	varchar(100)	NULL,
	`nickname`	varchar(10)	NULL,
	`user_portfolio_seq`	bigint	NOT NULL,
	CONSTRAINT `PK_USER` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`info_seq`	bigint	NOT NULL,
	`portfolio_ education_seq`	bigint	NOT NULL,
	`cover_seq`	bigint	NOT NULL,
	`portfolio_project_seq`	bigint	NOT NULL,
	`portfolio_activities_seq`	bigint	NOT NULL,
	`portfolio_awards_seq`	bigint	NOT NULL,
	`portfolio_career_seq`	bigint	NOT NULL,
	`portfolio_coverletter_seq`	bigint	NOT NULL,
	 CONSTRAINT `PK_PORTFOLIO` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`info` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`name`	varchar(20)	NULL,
	`birth`	date	NULL,
	`image`	varchar(2083)	NULL,
	`email`	varchar(100)	NULL,
	`github`	varchar(100)	NULL,
	`website`	varchar(2500)	NULL,
	`design_type`	int	NULL,
	 CONSTRAINT `PK_INFO` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`education` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`type`	varchar(10)	NULL,
	`name`	varchar(30)	NULL,
	`status`	varchar(16)	NULL,
	`transfer`	tinyint	NULL,
	`admission_date`	date	NULL,
	`graduation_date`	date	NULL,
	`major`	varchar(30)	NULL,
	`major_ grade`	DECIMAL(3,2)	NULL,
	`major_ perfect_grade`	DECIMAL(3,2)	NULL,
	`minor`	varchar(30)	NULL,
	`minor_grade`	DECIMAL(3,2)	NULL,
	`minor_perfect_grade`	DECIMAL(3,2)	NULL,
	`double`	varchar(30)	NULL,
	`double_grade`	DECIMAL(3,2)	NULL,
	`double_perfect_grade`	DECIMAL(3,2)	NULL,
	`paper`	varchar(2083)	NULL,
	`paper_description`	varchar(300)	NULL,
	`design_type`	int	NULL,
	 CONSTRAINT `PK_EDUCATION` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_education` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT ,
	`education_seq`	bigint	NOT NULL,
	CONSTRAINT `PK_PORTFOLIO_EDUCATION` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`cover`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`cover` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`image`	varchar(2083)	NULL,
	`design_type`	int	NULL,
	 CONSTRAINT `PK_COVER` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_project` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT ,
	`project_seq`	bigint	NOT NULL,
	CONSTRAINT `PK_PORTFOLIO_PROJECT` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`project` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`title`	varchar(100)	NULL,
	`start_date`	date	NULL,
	`end_date`	date	NULL,
	`description`	varchar(100)	NULL,
	`members`	int	NULL,
	`duty`	varchar(300)	NULL,
	`github`	varchar(2500)	NULL,
	`notion`	varchar(2500)	NULL,
	`website`	varchar(2500)	NULL,
	`result`	varchar(300)	NULL,
	`review`	varchar(1000)	NULL,
	`image1`	varchar(2083)	NULL,
	`image2`	varchar(2083)	NULL,
	`image3`	varchar(2083)	NULL,
	`image4`	varchar(2083)	NULL,
	`design_type`	int	NULL,
	 CONSTRAINT `PK_PROJECT` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_activities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_activities` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`activities_seq`	bigint	NOT NULL,
	 CONSTRAINT `PK_PORTFOLIO_ACTIVITIES` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`activities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`activities` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`type`	varchar(10)	NULL,
	`start_date`	date	NULL,
	`end_date`	date	NULL,
	`title`	varchar(100)	NULL,
	`description`	varchar(300)	NULL,
	`design_type`	int	NULL,
	 CONSTRAINT `PK_ACTIVITIES` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_awards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_awards` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`awards_seq`	bigint	NOT NULL,
	 CONSTRAINT `PK_PORTFOLIO_ AWARDS` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`awards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`awards` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`title`	varchar(30)	NULL,
	`description`	varchar(100)	NULL,
	`day`	date	NULL,
	`host`	varchar(100)	NULL,
	`design_type`	int	NULL,
	 CONSTRAINT `PK_AWARDS` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_career`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_career` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`career_seq`	bigint	NOT NULL,
	 CONSTRAINT `PK_PORTFOLIO_ CAREER` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`career`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`career` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`company`	varchar(100)	NULL,
	`status`	tinyint	NULL,
	`start_date`	date	NULL,
	`end_date`	date	NULL,
	`rank`	varchar(30)	NULL,
	`job`	varchar(30)	NULL,
	`result`	varchar(200)	NULL,
	`design_type`	int	NULL,
	 CONSTRAINT `PK_CAREER` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`coverletter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`coverletter` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`title`	varchar(100)	NULL,
	`content`	varchar(1000)	NULL,
	`design_type`	int	NULL,
	 CONSTRAINT `PK_COVERLETTER` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_coverletter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_coverletter` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`coverletter_seq`	bigint	NOT NULL,
	 CONSTRAINT `PK_PORTFOLIO_COVERLETTER` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`user_portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`user_portfolio` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`portfolio_seq`	bigint	NOT NULL,
	`liked_count`	int	NULL,
	`saved_count`	int	NULL,
	`top`	tinyint	NULL,
	`portfolio_order`	varchar(20)	NULL,
	`education_order`	varchar(20)	NULL,
	`project_order`	varchar(20)	NULL,
	`awards_order`	varchar(20)	NULL,
	`activities_order`	varchar(20)	NULL,
	`career_order`	varchar(20)	NULL,
	`coverletter_order`	varchar(20)	NULL,
	 CONSTRAINT `PK_USER_PORTFOLIO` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`liked`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`liked` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`portfolio_seq`	bigint	NULL,
	`user_seq`	bigint	NOT NULL,
	 CONSTRAINT `PK_LIKED` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`saved`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`saved` (
	`seq`	bigint	NOT NULL AUTO_INCREMENT,
	`portfolio_seq`	bigint	NULL,
	`user_seq`	bigint	NOT NULL,
	 CONSTRAINT `PK_SAVED` PRIMARY KEY (`seq`)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;