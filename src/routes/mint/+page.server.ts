import type { Actions } from "./$types";

export const actions = {
  default: async ({ request }) => {
    const formData = await request.formData();
    const amount = formData.get("amount");
    const recipient = formData.get("recipient");
    const message = formData.get("message");

    // TODO: Implement minting logic
    return {
      success: true,
    };
  },
} satisfies Actions;
