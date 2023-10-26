import { PrismaClient } from "@prisma/client";
  import boards from "~/assets/data/professional-boards.json";
import licenses from "~/assets/data/professional-licenses.json";
import { seedBoard, seedLicenses } from "~/config/seed-data/profession.server";
const prisma = new PrismaClient();

const logDatabaseCleared = () => console.log(`Database is being cleared.`);
const cleanup = async () =>
  Promise.all([
    prisma.professionalBoard.deleteMany(),
    prisma.license.deleteMany(),
  ]);
const seed = async () => {
  Promise.all([seedBoard(boards), seedLicenses(licenses, boards)]);

  console.log(`Database has been seeded. 🌱`);
};

cleanup()
  .then(async () => (logDatabaseCleared(), Promise.resolve(seed())))
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
