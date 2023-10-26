-- CreateTable
CREATE TABLE "ProfessionalBoard" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "entityName" TEXT NOT NULL,
    "shortName" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "License" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "licenseType" INTEGER NOT NULL,
    "professionId" INTEGER NOT NULL,
    CONSTRAINT "License_professionId_fkey" FOREIGN KEY ("professionId") REFERENCES "ProfessionalBoard" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
