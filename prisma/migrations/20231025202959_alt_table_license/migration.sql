/*
  Warnings:

  - Added the required column `professionalBoard` to the `License` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_License" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "licenseType" TEXT NOT NULL,
    "boardId" INTEGER NOT NULL,
    "professionalBoard" TEXT NOT NULL,
    "professionPrefix" TEXT NOT NULL,
    "professionName" TEXT NOT NULL,
    CONSTRAINT "License_boardId_fkey" FOREIGN KEY ("boardId") REFERENCES "ProfessionalBoard" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_License" ("boardId", "id", "licenseType", "professionName", "professionPrefix") SELECT "boardId", "id", "licenseType", "professionName", "professionPrefix" FROM "License";
DROP TABLE "License";
ALTER TABLE "new_License" RENAME TO "License";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
