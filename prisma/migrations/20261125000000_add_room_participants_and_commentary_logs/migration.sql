-- CreateTable room_participants
CREATE TABLE IF NOT EXISTS `room_participants` (
    `id` VARCHAR(191) NOT NULL,
    `room_code` VARCHAR(6) NOT NULL,
    `user_id` VARCHAR(191) NULL,
    `session_id` VARCHAR(191) NOT NULL,
    `display_name` VARCHAR(100) NOT NULL,
    `team_name` VARCHAR(100) NULL,
    `team_name_normalized` VARCHAR(100) NULL,
    `team_short_code` VARCHAR(10) NULL,
    `team_color` VARCHAR(32) NULL,
    `franchise_id` VARCHAR(32) NULL,
    `franchise_name` VARCHAR(100) NULL,
    `franchise_code` VARCHAR(10) NULL,
    `franchise_color` VARCHAR(32) NULL,
    `is_host` BOOLEAN NOT NULL DEFAULT false,
    `is_spectator` BOOLEAN NOT NULL DEFAULT false,
    `joined_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `room_participants_room_code_session_id_key`(`room_code`, `session_id`),
    INDEX `room_participants_room_code_idx`(`room_code`),
    INDEX `room_participants_room_code_team_name_normalized_idx`(`room_code`, `team_name_normalized`),
    INDEX `room_participants_user_id_idx`(`user_id`),
    PRIMARY KEY (`id`),
    CONSTRAINT `room_participants_room_code_fkey` FOREIGN KEY (`room_code`) REFERENCES `rooms`(`room_code`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `room_participants_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable commentary_logs
CREATE TABLE IF NOT EXISTS `commentary_logs` (
    `id` VARCHAR(191) NOT NULL,
    `room_code` VARCHAR(6) NOT NULL,
    `text` VARCHAR(500) NOT NULL,
    `event_type` VARCHAR(32) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `commentary_logs_room_code_idx`(`room_code`),
    INDEX `commentary_logs_room_code_created_at_idx`(`room_code`, `created_at`),
    PRIMARY KEY (`id`),
    CONSTRAINT `commentary_logs_room_code_fkey` FOREIGN KEY (`room_code`) REFERENCES `rooms`(`room_code`) ON DELETE CASCADE ON UPDATE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
