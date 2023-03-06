/*
  Warnings:

  - You are about to drop the column `activationCode` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `activationLink` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `isEmailActivated` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `isPhoneNumberActivated` on the `users` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "users" DROP COLUMN "activationCode",
DROP COLUMN "activationLink",
DROP COLUMN "isEmailActivated",
DROP COLUMN "isPhoneNumberActivated";

-- CreateTable
CREATE TABLE "emailActivation" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "isEmailActivated" BOOLEAN DEFAULT false,
    "activationLink" INTEGER,

    CONSTRAINT "emailActivation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "phoneNumberActivation" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "isPhoneNumberActivated" BOOLEAN DEFAULT false,
    "activationCode" INTEGER,

    CONSTRAINT "phoneNumberActivation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "emailActivation_userId_key" ON "emailActivation"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "phoneNumberActivation_userId_key" ON "phoneNumberActivation"("userId");

-- AddForeignKey
ALTER TABLE "emailActivation" ADD CONSTRAINT "emailActivation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "phoneNumberActivation" ADD CONSTRAINT "phoneNumberActivation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
