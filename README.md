# Gift Card Application

A Cardano-based gift card application that allows users to mint and redeem gift cards on the blockchain.

## Features

- Mint gift cards with custom amounts and messages
- Redeem gift cards using a unique identifier
- Secure and transparent transactions on the Cardano blockchain

## Prerequisites

- Node.js (v16 or later)
- Aiken (for smart contract development)
- Cardano wallet (e.g., Nami, Eternl, or Flint)

## Setup

1. Clone the repository:

```bash
git clone <repository-url>
cd gift-card-app
```

2. Install dependencies:

```bash
npm install
```

3. Create a `.env` file in the root directory with the following variables:

```
VITE_BLOCKFROST_API_KEY=your_blockfrost_api_key
VITE_BLOCKFROST_URL=your_blockfrost_url
```

4. Start the development server:

```bash
npm run dev
```

## Smart Contract Development

The smart contract is written in Aiken. To compile and test the contract:

```bash
aiken build
aiken test
```

## Project Structure

- `validators/` - Contains the Aiken smart contracts
- `src/` - Frontend application code
  - `routes/` - SvelteKit routes
  - `lib/` - Utility functions and types
- `static/` - Static assets

## License

Apache-2.0
