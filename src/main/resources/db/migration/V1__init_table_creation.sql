DROP TABLE  IF EXISTS `transactionstoragedb`.`payload_tracker`;
DROP TABLE  IF EXISTS `transactionstoragedb`.`payload_tracker_detail`;
DROP TABLE  IF EXISTS `transactionstoragedb`.`transaction_info`;
CREATE TABLE IF NOT EXISTS `transactionstoragedb`.`transaction_info` (
    `transaction_info_sk` VARCHAR(36) NOT NULL COMMENT 'Primary key of the table',
    `zfcn` VARCHAR(45) NOT NULL COMMENT 'The control number of the file that the transaction was received',
    `ztcn` VARCHAR(45) NOT NULL COMMENT 'The control number of the transaction',
    `transaction_received_date` DATETIME NOT NULL COMMENT 'The date and time when the transaction was received',
    `trading_partner_id` VARCHAR(50) NOT NULL COMMENT 'The trading partner id associated with the transaction',
    `marketplace_type_code` VARCHAR(50) NOT NULL COMMENT 'The marketplace type code associated with the transaction',
    `line_of_business_type_code` VARCHAR(50) NOT NULL COMMENT 'The line of business associated with the transaction',
    `business_unit_type_code` VARCHAR(50) NOT NULL COMMENT 'The business unit associated with the transaction',
    `state_type_code` VARCHAR(50) NOT NULL COMMENT 'The state of the transaction',
    `transaction_data` LONGBLOB NOT NULL COMMENT 'The transaction data stored as CLOB',
    `created_date` DATETIME NULL COMMENT 'The date when the record was created',
    `updated_date` DATETIME NULL COMMENT 'The date when the record was updated',
    PRIMARY KEY (`transaction_info_sk`))
    ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `transactionstoragedb`.`payload_tracker` (
    `payload_tracker_sk` VARCHAR(36) NOT NULL,
    `payload_id` VARCHAR(45) NOT NULL COMMENT 'A unique id assigned for the payload',
    `payload_key` VARCHAR(50) NOT NULL COMMENT 'The key for the type of payload, like account number for account payload and zeus transaction control number for transaction payload.',
    `payload_key_type_code` VARCHAR(45) NOT NULL COMMENT 'Identifies the type of payload like ACCOUNT, TRANSACTION, FILE etc',
    `payload` LONGTEXT NOT NULL COMMENT 'The payload as a string',
    `payload_direction_type_code` VARCHAR(45) NOT NULL COMMENT 'Identifies the direction of the payload, INBOUND or OUTBOUND',
    `src_dest` VARCHAR(100) NOT NULL COMMENT 'Identifies the source if the payload is inbound and destination if the payload is outbound',
    `created_date` DATETIME NULL COMMENT 'Date when the record was created',
    `updated_date` DATETIME NULL COMMENT 'Date when the record was updated',
    PRIMARY KEY (`payload_tracker_sk`))
    ENGINE = InnoDB
    COMMENT = 'This table contains all the payloads that are sent out or received in to the transaction storage service';
CREATE TABLE IF NOT EXISTS `transactionstoragedb`.`payload_tracker_detail` (
    `payload_tracker_detail_sk` VARCHAR(36) NOT NULL,
    `payload_tracker_sk` VARCHAR(36) NOT NULL COMMENT 'The foreign key of the payload tracker table',
    `response_type_code` VARCHAR(45) NOT NULL COMMENT 'The type of response received or sent. e.g. ACK, RESULT etc',
    `response_payload_id` VARCHAR(45) NOT NULL COMMENT 'The unique id assigned to the response payload',
    `response_payload` LONGTEXT NOT NULL,
    `payload_direction_type_code` VARCHAR(45) NOT NULL COMMENT 'Identifies the direction of the payload, INBOUND or OUTBOUND',
    `src_dest` VARCHAR(45) NOT NULL COMMENT 'Identifies the source if the payload is inbound and destination if the payload is outbound',
    `created_date` DATETIME NULL COMMENT 'Date when the record was created',
    `updated_date` DATETIME NULL COMMENT 'Date when the record was updated',
    PRIMARY KEY (`payload_tracker_detail_sk`),
    INDEX `payload_tracker_fk_idx` (`payload_tracker_sk` ASC) VISIBLE,
    CONSTRAINT `payload_tracker_fk`
    FOREIGN KEY (`payload_tracker_sk`)
    REFERENCES `transactionstoragedb`.`payload_tracker` (`payload_tracker_sk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB
    COMMENT = 'The payload tracker detail table, that tracks all the responses received for an outbound payload and all the responses sent for an inbound payload';