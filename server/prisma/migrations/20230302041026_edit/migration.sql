-- AlterTable
ALTER TABLE "infoUsers" ALTER COLUMN "email" DROP NOT NULL,
ALTER COLUMN "phoneNumber" DROP NOT NULL,
ALTER COLUMN "fileSummaryKey" DROP NOT NULL,
ALTER COLUMN "fileSummaryName" DROP NOT NULL,
ALTER COLUMN "summaryLink" DROP NOT NULL;

-- AlterTable
ALTER TABLE "users" ALTER COLUMN "email" DROP NOT NULL,
ALTER COLUMN "phoneNumber" DROP NOT NULL,
ALTER COLUMN "isEmailActivated" DROP NOT NULL,
ALTER COLUMN "isPhoneNumberActivated" DROP NOT NULL,
ALTER COLUMN "activationLink" DROP NOT NULL,
ALTER COLUMN "activationCode" DROP NOT NULL;