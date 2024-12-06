-- Create the Item table
DROP TABLE IF EXISTS item;
CREATE TABLE item
(
    id                     INT AUTO_INCREMENT PRIMARY KEY,
    name                   VARCHAR(255)   NOT NULL,
    type                   VARCHAR(50),
    metal                  VARCHAR(50),
    price_calculation_type VARCHAR(50),
    price                  DECIMAL(10, 2) NOT NULL,
    created_at             TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at             TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE INDEX idx_item_name ON item (name);
