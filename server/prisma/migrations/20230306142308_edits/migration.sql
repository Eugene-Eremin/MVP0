/*
  Warnings:

  - A unique constraint covering the columns `[activationLink]` on the table `emailActivation` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[fileSummaryKey]` on the table `infoUsers` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[activationCode]` on the table `phoneNumberActivation` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[refreshToken]` on the table `tokens` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "socialNetworksWithLinks_link_key";

-- CreateIndex
CREATE UNIQUE INDEX "emailActivation_activationLink_key" ON "emailActivation"("activationLink");

-- CreateIndex
CREATE UNIQUE INDEX "infoUsers_fileSummaryKey_key" ON "infoUsers"("fileSummaryKey");

-- CreateIndex
CREATE UNIQUE INDEX "phoneNumberActivation_activationCode_key" ON "phoneNumberActivation"("activationCode");

-- CreateIndex
CREATE UNIQUE INDEX "tokens_refreshToken_key" ON "tokens"("refreshToken");
