CREATE TABLE IF NOT EXISTS trade_freeze (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    frozen BOOLEAN NOT NULL DEFAULT FALSE,
    freeze_time TIMESTAMP NULL,
    UNIQUE KEY unique_player_id (player_id)
);