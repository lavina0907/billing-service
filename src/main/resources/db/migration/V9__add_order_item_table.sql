DROP TABLE IF EXISTS order_item;
CREATE TABLE order_item
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    total_amount    DECIMAL(10, 2) NOT NULL,
    discount_type   VARCHAR(20),
    discount_amount DECIMAL(10, 2),
    discount        DECIMAL(10, 2),
    net_amount      DECIMAL(10, 2) NOT NULL,
    tax_type        VARCHAR(20),
    tax_amount      DECIMAL(10, 2),
    tax_rate        DECIMAL(10, 2),
    created_at      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    item_id         INT,
    service_id      INT,
    order_id        INT            NOT NULL,
    quantity        INT            NOT NULL,
    FOREIGN KEY (item_id) REFERENCES item (id),
    FOREIGN KEY (service_id) REFERENCES service (id),
    FOREIGN KEY (order_id) REFERENCES order_detail (id)
);

CREATE INDEX idx_order_item_order_id ON order_item (order_id);
