const cds = require("@sap/cds");

const compression = require("compression");

cds.on("bootstrap", (app) => {
  cds.cov2ap.before = [compression({ filter: shouldCompress })];
});

function shouldCompress(req, res) {
  const type = res.getHeader("Content-Type");
  if (type && typeof type === "string" && type.startsWith("multipart/mixed")) {
    return true;
  }
  // fallback to standard filter function
  return compression.filter(req, res);
}


module.exports = async (srv) => {

  // ✅ ALWAYS connect to db first
  const db = await cds.connect.to('db');

  // ✅ Access entities from db model
  const { registry, hours } = db.entities;

  srv.before('CREATE', 'RegistryView.drafts', async (req) => {

    const { email, companyid, month, year } = req.data;

    const exists = await SELECT.one
      .from(registry)
      .where({ email, companyid, month, year });

    if (exists) {
      req.error({
        code: 'DUPLICATE_ENTRY',
        message: 'Entry already exists for ${email} / ${companyid} / ${month}-${year}',
        target: 'email'
      });
    }
  });
  
  srv.after(['CREATE', 'UPDATE'], 'RegistryView', async (data) => {
  await UPSERT.into(hours).entries({
    registry_ID: data.ID,
    absMen: data.absMen,
    absWomen: data.absWomen
  });
});
};