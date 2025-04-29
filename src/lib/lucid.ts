import { Lucid, Blockfrost } from "lucid-cardano";

const BLOCKFROST_API_KEY = import.meta.env.VITE_BLOCKFROST_API_KEY;
const BLOCKFROST_URL = import.meta.env.VITE_BLOCKFROST_URL;

export async function getLucid() {
  const lucid = await Lucid.new(
    new Blockfrost(BLOCKFROST_URL, BLOCKFROST_API_KEY),
    "Preview"
  );

  return lucid;
}

export async function getWallet() {
  const lucid = await getLucid();
  await lucid.selectWallet();
  return lucid;
}
