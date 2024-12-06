DROP TABLE IF EXISTS customer;
CREATE TABLE customer
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    customer_name  VARCHAR(255),
    company_name   VARCHAR(255),
    contact_number VARCHAR(20),
    email_id       VARCHAR(255),
    created_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS order_detail;
CREATE TABLE order_detail
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    order_number    VARCHAR(20)    NOT NULL,
    order_date      DATE           NOT NULL,
    deliver_date    DATE,
    total_amount    DECIMAL(10, 2) NOT NULL,
    discount_amount DECIMAL(10, 2),
    net_amount      DECIMAL(10, 2) NOT NULL,
    tax_amount      DECIMAL(10, 2),
    created_at      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    create_by       INT            NOT NULL,
    customer_id     INT            NOT NULL,
    FOREIGN KEY (create_by) REFERENCES users (id),
    FOREIGN KEY (customer_id) REFERENCES customer (id)
);

