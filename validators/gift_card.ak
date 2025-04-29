use aiken/builtin
use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use aiken/primitive/string
use cardano/transaction.{OutputReference, Transaction, TxIn}

pub type Datum {
  owner: VerificationKeyHash,
}

pub type Redeemer {
  gift_card: ByteArray,
}

// Minting policy for gift card NFTs
pub fn mint_gift_card(
  own_ref: OutputReference,
  _redeemer: ByteArray,
  self: Transaction,
) {
  // Ensure minting is tied to a specific UTxO
  let is_spending_utxo = list.any(self.inputs, fn(input: TxIn) {
    input.output_ref == own_ref
  })

  trace @"is_spending_utxo": string.from_bool(is_spending_utxo)

  is_spending_utxo?
}

// Validator for locking/unlocking funds
validator gift_card {
  spend(
    datum: Option<Datum>,
    redeemer: Redeemer,
    _own_ref: OutputReference,
    self: Transaction,
  ) {
    expect Some(Datum { owner }) = datum

    // Check if transaction is signed by the owner
    let is_signed = list.has(self.extra_signatories, owner)

    // Verify gift card NFT is burned
    let gift_card_asset = redeemer.gift_card
    let is_burning_gift_card = builtin.get_minted_quantity(
      self.mint,
      gift_card_asset
    ) == -1

    trace @"is_signed": string.from_bool(is_signed)
    trace @"is_burning_gift_card": string.from_bool(is_burning_gift_card)

    is_signed? && is_burning_gift_card?
  }
}

test gift_card_example() {
  let datum =
    Datum { owner: #"00000000000000000000000000000000000000000000000000000000" }

  let redeemer = Redeemer { gift_card: #"6769667463617264" } // "giftcard" in hex

  let placeholder_utxo = OutputReference { transaction_id: "", output_index: 0 }

  gift_card.spend(
    Some(datum),
    redeemer,
    placeholder_utxo,
    Transaction {
      ..transaction.placeholder,
      extra_signatories: [datum.owner],
      mint: #[[#"6769667463617264", -1]]],
    },
  )
}