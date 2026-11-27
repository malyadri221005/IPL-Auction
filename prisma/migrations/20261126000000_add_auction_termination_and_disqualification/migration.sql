-- AlterTable
ALTER TABLE `room_participants`
  ADD COLUMN `participation_status` VARCHAR(32) NOT NULL DEFAULT 'ACTIVE',
  ADD COLUMN `disqualification_reason` VARCHAR(64) NULL,
  ADD COLUMN `disqualified_at` DATETIME(3) NULL,
  ADD COLUMN `exited_at` DATETIME(3) NULL;