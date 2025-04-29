import type { Actions } from "./$types";

export const actions = {
  default: async ({ request }) => {
    const formData = await request.formData();
    const giftCardId = formData.get("giftCardId");

    // TODO: Implement redemption logic
    return {
      success: true,
    };
  },
} satisfies Actions;
