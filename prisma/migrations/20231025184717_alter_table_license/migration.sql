/*
  Warnings:

  - The primary key for the `License` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `License` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - A unique constraint covering the columns `[shortName]` on the table `ProfessionalBoard` will be added. If there are existing duplicate values, this will fail.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_License" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "licenseType" INTEGER NOT NULL,
    "professionId" INTEGER NOT NULL,
    CONSTRAINT "License_professionId_fkey" FOREIGN KEY ("professionId") REFERENCES "ProfessionalBoard" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_License" ("id", "licenseType", "professionId") SELECT "id", "licenseType", "professionId" FROM "License";
DROP TABLE "License";
ALTER TABLE "new_License" RENAME TO "License";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "ProfessionalBoard_shortName_key" ON "ProfessionalBoard"("shortName");
