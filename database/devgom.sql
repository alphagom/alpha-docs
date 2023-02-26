-- -----------------------------------------------------
-- Schema devgom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `devgom` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `devgom`;

SET GLOBAL innodb_default_row_format = 'dynamic';
-- -----------------------------------------------------
-- Table `devgom`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`user`
(
    `seq`      bigint       NOT NULL AUTO_INCREMENT,
    `id`       varchar(20)  NULL,
    `pw`       varchar(250) NULL,
    `email`    varchar(100) NULL,
    `nickname` varchar(10)  NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`liked`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`liked`
(
    `seq`           bigint NOT NULL AUTO_INCREMENT,
    `portfolio_seq` bigint NULL,
    `user_seq`      bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`user_seq`) REFERENCES user (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`saved`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`saved`
(
    `seq`           bigint NOT NULL AUTO_INCREMENT,
    `portfolio_seq` bigint NULL,
    `user_seq`      bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`user_seq`) REFERENCES user (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`cover`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`cover`
(
    `seq`         bigint NOT NULL AUTO_INCREMENT,
    `image`       text   NULL,
    `design_type` int    NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`info`
(
    `seq`         bigint       NOT NULL AUTO_INCREMENT,
    `name`        varchar(20)  NULL,
    `birth`       date         NULL,
    `image`       text         NULL,
    `email`       varchar(100) NULL,
    `github`      varchar(100) NULL,
    `website`     text         NULL,
    `design_type` int          NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`education`
(
    `seq`                  bigint        NOT NULL AUTO_INCREMENT,
    `type`                 varchar(10)   NULL,
    `name`                 varchar(30)   NULL,
    `status`               varchar(16)   NULL,
    `transfer`             tinyint       NULL,
    `admission_date`       date          NULL,
    `graduation_date`      date          NULL,
    `major`                varchar(30)   NULL,
    `major_grade`         DECIMAL(3, 2) NULL,
    `major_perfect_grade` DECIMAL(3, 2) NULL,
    `minor`                varchar(30)   NULL,
    `minor_grade`          DECIMAL(3, 2) NULL,
    `minor_perfect_grade`  DECIMAL(3, 2) NULL,
    `double`               varchar(30)   NULL,
    `double_grade`         DECIMAL(3, 2) NULL,
    `double_perfect_grade` DECIMAL(3, 2) NULL,
    `paper`                text          NULL,
    `paper_description`    varchar(300)  NULL,
    `design_type`          int           NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_education`
(
    `seq`           bigint NOT NULL AUTO_INCREMENT,
    `education_seq` bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`education_seq`) REFERENCES education (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`project`
(
    `seq`         bigint        NOT NULL AUTO_INCREMENT,
    `title`       varchar(100)  NULL,
    `start_date`  date          NULL,
    `end_date`    date          NULL,
    `description` varchar(100)  NULL,
    `members`     int           NULL,
    `duty`        varchar(300)  NULL,
    `github`      text          NULL,
    `notion`      text          NULL,
    `website`     text          NULL,
    `result`      varchar(300)  NULL,
    `review`      varchar(1000) NULL,
    `image1`      text          NULL,
    `image2`      text          NULL,
    `image3`      text          NULL,
    `image4`      text          NULL,
    `design_type` int           NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_project`
(
    `seq`         bigint NOT NULL AUTO_INCREMENT,
    `project_seq` bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`project_seq`) REFERENCES project (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`activities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`activities`
(
    `seq`         bigint       NOT NULL AUTO_INCREMENT,
    `type`        varchar(10)  NULL,
    `start_date`  date         NULL,
    `end_date`    date         NULL,
    `title`       varchar(100) NULL,
    `description` varchar(300) NULL,
    `design_type` int          NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_activities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_activities`
(
    `seq`            bigint NOT NULL AUTO_INCREMENT,
    `activities_seq` bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`activities_seq`) REFERENCES activities (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`awards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`awards`
(
    `seq`         bigint       NOT NULL AUTO_INCREMENT,
    `title`       varchar(30)  NULL,
    `description` varchar(100) NULL,
    `day`         date         NULL,
    `host`        varchar(100) NULL,
    `design_type` int          NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_awards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_awards`
(
    `seq`        bigint NOT NULL AUTO_INCREMENT,
    `awards_seq` bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`awards_seq`) REFERENCES awards (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`career`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`career`
(
    `seq`         bigint       NOT NULL AUTO_INCREMENT,
    `company`     varchar(100) NULL,
    `status`      tinyint      NULL,
    `start_date`  date         NULL,
    `end_date`    date         NULL,
    `rank`        varchar(30)  NULL,
    `job`         varchar(30)  NULL,
    `result`      varchar(200) NULL,
    `design_type` int          NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_career`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_career`
(
    `seq`        bigint NOT NULL AUTO_INCREMENT,
    `career_seq` bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`career_seq`) REFERENCES career (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`coverletter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`coverletter`
(
    `seq`         bigint        NOT NULL AUTO_INCREMENT,
    `title`       varchar(100)  NULL,
    `content`     varchar(1000) NULL,
    `design_type` int           NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio_coverletter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio_coverletter`
(
    `seq`             bigint NOT NULL AUTO_INCREMENT,
    `coverletter_seq` bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`coverletter_seq`) REFERENCES coverletter (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`portfolio`
(
    `seq`                       bigint NOT NULL AUTO_INCREMENT,
    `cover_seq`                 bigint NOT NULL,
    `info_seq`                  bigint NOT NULL,
    `portfolio_education_seq`  bigint NOT NULL,
    `portfolio_project_seq`     bigint NOT NULL,
    `portfolio_activities_seq`  bigint NOT NULL,
    `portfolio_awards_seq`      bigint NOT NULL,
    `portfolio_career_seq`      bigint NOT NULL,
    `portfolio_coverletter_seq` bigint NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`cover_seq`) REFERENCES cover (`seq`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`info_seq`) REFERENCES info (`seq`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`portfolio_education_seq`) REFERENCES portfolio_education (`seq`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`portfolio_project_seq`) REFERENCES portfolio_project (`seq`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`portfolio_activities_seq`) REFERENCES portfolio_activities (`seq`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`portfolio_awards_seq`) REFERENCES portfolio_awards (`seq`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`portfolio_career_seq`) REFERENCES portfolio_career (`seq`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (`portfolio_coverletter_seq`) REFERENCES portfolio_coverletter (`seq`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `devgom`.`user_portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devgom`.`user_portfolio`
(
    `seq`               bigint      NOT NULL AUTO_INCREMENT,
    `liked_count`       int         NULL,
    `saved_count`       int         NULL,
    `top`               tinyint     NULL,
    `portfolio_order`   varchar(20) NULL,
    `education_order`   varchar(20) NULL,
    `project_order`     varchar(20) NULL,
    `awards_order`      varchar(20) NULL,
    `activities_order`  varchar(20) NULL,
    `career_order`      varchar(20) NULL,
    `coverletter_order` varchar(20) NULL,
    `portfolio_seq`     bigint      NOT NULL,
    `user_seq`          bigint      NOT NULL,
    `created_time` timestamp NOT NULL default current_timestamp,
    `updated_time` timestamp NOT NULL default current_timestamp,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`user_seq`) REFERENCES user (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    FOREIGN KEY (`portfolio_seq`) REFERENCES portfolio (`seq`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

