import { json } from "@remix-run/node";
import { useLoaderData } from "@remix-run/react";
import { getAllLicenseTypes } from "~/models/profession.server";

export const loader = async () => json(await getAllLicenseTypes());

export const action = async () =>
  json({ message: "the recieved method is invalid for this endpoint" });

const BoardSelection = () => {
  const data = useLoaderData();
  console.log(data);
  return (
    <div className="form-group">
      <label>License Selection</label>
      <select name="licenseType" id="license-type-selection">
        <option key="0" value="">Please Select A License</option>
        {data.map(({ entityName, licenses, ...board }) => (
          <>
            <hr />
            <optgroup key={board.id} label={entityName}>
              {licenses.map(({ id, professionName, licenseType }) => (
                <option key={`${id}-${licenseType}`} value={licenseType}>
                  {professionName} - {licenseType}
                </option>
              ))}
            </optgroup>
          </>
        ))}
      </select>
    </div>
  );
};

export default BoardSelection;
