import { json } from "@remix-run/node";
import { getAllLicenseTypes } from "~/models/profession.server";

export const loader = async () => json(await getAllLicenseTypes());

export const action = async () =>
  json({ message: "the recieved method is invalid for this endpoint" });
