-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" INTEGER NOT NULL,
    "isEmailActivated" BOOLEAN NOT NULL DEFAULT false,
    "isPhoneNumberActivated" BOOLEAN NOT NULL DEFAULT false,
    "activationLink" TEXT NOT NULL,
    "activationCode" INTEGER NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tokens" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "refreshToken" TEXT NOT NULL,

    CONSTRAINT "tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "infoUsers" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" INTEGER NOT NULL,
    "searchAreaOfWorkId" INTEGER NOT NULL,
    "fileSummaryKey" TEXT NOT NULL,
    "fileSummaryName" TEXT NOT NULL,
    "summaryLink" TEXT NOT NULL,
    "workingNow" BOOLEAN NOT NULL,
    "levelOfEducationId" INTEGER NOT NULL,

    CONSTRAINT "infoUsers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pastWorks" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "lastJobName" TEXT NOT NULL,
    "areaOfWorkId" INTEGER NOT NULL,
    "jobTitle" TEXT NOT NULL,
    "startedWork" DATE NOT NULL,

    CONSTRAINT "pastWorks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spokenLanguages" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "languageId" INTEGER NOT NULL,
    "estimation" INTEGER NOT NULL,

    CONSTRAINT "spokenLanguages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ownedSkills" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "skillId" INTEGER NOT NULL,
    "estimation" INTEGER NOT NULL,

    CONSTRAINT "ownedSkills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "socialNetworksWithLinks" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "socialNetworkId" INTEGER NOT NULL,
    "link" TEXT NOT NULL,

    CONSTRAINT "socialNetworksWithLinks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "groups" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "groupNameId" INTEGER NOT NULL,

    CONSTRAINT "groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "areasOfWork" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "areasOfWork_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills" (
    "id" SERIAL NOT NULL,
    "areaOfWorkId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "levelOfEducation" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "levelOfEducation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "languages" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "languages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "socialNetworks" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "socialNetworks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "groupNames" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "groupNames_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_phoneNumber_key" ON "users"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "tokens_userId_key" ON "tokens"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "infoUsers_userId_key" ON "infoUsers"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "infoUsers_email_key" ON "infoUsers"("email");

-- CreateIndex
CREATE UNIQUE INDEX "infoUsers_phoneNumber_key" ON "infoUsers"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "socialNetworksWithLinks_link_key" ON "socialNetworksWithLinks"("link");

-- CreateIndex
CREATE UNIQUE INDEX "areasOfWork_name_key" ON "areasOfWork"("name");

-- CreateIndex
CREATE UNIQUE INDEX "skills_name_key" ON "skills"("name");

-- CreateIndex
CREATE UNIQUE INDEX "levelOfEducation_name_key" ON "levelOfEducation"("name");

-- CreateIndex
CREATE UNIQUE INDEX "languages_name_key" ON "languages"("name");

-- CreateIndex
CREATE UNIQUE INDEX "socialNetworks_name_key" ON "socialNetworks"("name");

-- CreateIndex
CREATE UNIQUE INDEX "groupNames_name_key" ON "groupNames"("name");

-- AddForeignKey
ALTER TABLE "tokens" ADD CONSTRAINT "tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "infoUsers" ADD CONSTRAINT "infoUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "infoUsers" ADD CONSTRAINT "infoUsers_searchAreaOfWorkId_fkey" FOREIGN KEY ("searchAreaOfWorkId") REFERENCES "areasOfWork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "infoUsers" ADD CONSTRAINT "infoUsers_levelOfEducationId_fkey" FOREIGN KEY ("levelOfEducationId") REFERENCES "levelOfEducation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pastWorks" ADD CONSTRAINT "pastWorks_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pastWorks" ADD CONSTRAINT "pastWorks_areaOfWorkId_fkey" FOREIGN KEY ("areaOfWorkId") REFERENCES "areasOfWork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spokenLanguages" ADD CONSTRAINT "spokenLanguages_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spokenLanguages" ADD CONSTRAINT "spokenLanguages_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "languages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ownedSkills" ADD CONSTRAINT "ownedSkills_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ownedSkills" ADD CONSTRAINT "ownedSkills_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "skills"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "socialNetworksWithLinks" ADD CONSTRAINT "socialNetworksWithLinks_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "socialNetworksWithLinks" ADD CONSTRAINT "socialNetworksWithLinks_socialNetworkId_fkey" FOREIGN KEY ("socialNetworkId") REFERENCES "socialNetworks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "groups" ADD CONSTRAINT "groups_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "groups" ADD CONSTRAINT "groups_groupNameId_fkey" FOREIGN KEY ("groupNameId") REFERENCES "groupNames"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skills" ADD CONSTRAINT "skills_areaOfWorkId_fkey" FOREIGN KEY ("areaOfWorkId") REFERENCES "areasOfWork"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
