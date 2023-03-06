/*
  Warnings:

  - Made the column `isEmailActivated` on table `emailActivation` required. This step will fail if there are existing NULL values in that column.
  - Made the column `activationLink` on table `emailActivation` required. This step will fail if there are existing NULL values in that column.
  - Made the column `isPhoneNumberActivated` on table `phoneNumberActivation` required. This step will fail if there are existing NULL values in that column.
  - Made the column `activationCode` on table `phoneNumberActivation` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "emailActivation" ALTER COLUMN "isEmailActivated" SET NOT NULL,
ALTER COLUMN "activationLink" SET NOT NULL,
ALTER COLUMN "activationLink" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "phoneNumberActivation" ALTER COLUMN "isPhoneNumberActivated" SET NOT NULL,
ALTER COLUMN "activationCode" SET NOT NULL;

-- AlterTable
ALTER TABLE "users" ALTER COLUMN "phoneNumber" SET DATA TYPE BIGINT;
