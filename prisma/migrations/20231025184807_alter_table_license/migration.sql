-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_License" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "licenseType" TEXT NOT NULL,
    "professionId" INTEGER NOT NULL,
    CONSTRAINT "License_professionId_fkey" FOREIGN KEY ("professionId") REFERENCES "ProfessionalBoard" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_License" ("id", "licenseType", "professionId") SELECT "id", "licenseType", "professionId" FROM "License";
DROP TABLE "License";
ALTER TABLE "new_License" RENAME TO "License";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
