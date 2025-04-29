import { getLucid } from "./lucid";
import { GiftCardDatum } from "./types";

export async function mintGiftCard(
  amount: bigint,
  recipient: string,
  message?: string
) {
  const lucid = await getLucid();
  const { paymentCredential } = lucid.utils.getAddressDetails(recipient);

  const datum: GiftCardDatum = {
    owner: paymentCredential?.hash || "",
    message: message || "",
  };

  // TODO: Implement minting logic
  return {
    txHash: "",
    datum,
  };
}

export async function redeemGiftCard(giftCardId: string) {
  const lucid = await getLucid();

  // TODO: Implement redemption logic
  return {
    txHash: "",
  };
}
