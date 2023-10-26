/*
  Warnings:

  - You are about to drop the column `professionId` on the `License` table. All the data in the column will be lost.
  - Added the required column `boardId` to the `License` table without a default value. This is not possible if the table is not empty.
  - Added the required column `professionName` to the `License` table without a default value. This is not possible if the table is not empty.
  - Added the required column `professionPrefix` to the `License` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_License" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "licenseType" TEXT NOT NULL,
    "boardId" INTEGER NOT NULL,
    "professionPrefix" TEXT NOT NULL,
    "professionName" TEXT NOT NULL,
    CONSTRAINT "License_boardId_fkey" FOREIGN KEY ("boardId") REFERENCES "ProfessionalBoard" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_License" ("id", "licenseType") SELECT "id", "licenseType" FROM "License";
DROP TABLE "License";
ALTER TABLE "new_License" RENAME TO "License";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
