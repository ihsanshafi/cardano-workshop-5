<script lang="ts">
	let giftCardId = '';
	let loading = false;
	let error = '';
	let success = '';

	async function handleSubmit() {
		loading = true;
		error = '';
		success = '';

		try {
			// TODO: Implement redemption logic
			success = 'Gift card redeemed successfully!';
		} catch (e) {
			error = e instanceof Error ? e.message : 'An error occurred';
		} finally {
			loading = false;
		}
	}
</script>

<main>
	<h1>Redeem Gift Card</h1>
	<form on:submit|preventDefault={handleSubmit}>
		<div class="form-group">
			<label for="giftCardId">Gift Card ID</label>
			<input
				type="text"
				id="giftCardId"
				bind:value={giftCardId}
				required
				placeholder="Enter your gift card ID"
			/>
		</div>

		<button type="submit" disabled={loading}>
			{loading ? 'Redeeming...' : 'Redeem Gift Card'}
		</button>

		{#if error}
			<p class="error">{error}</p>
		{/if}

		{#if success}
			<p class="success">{success}</p>
		{/if}
	</form>
</main>

<style>
	main {
		max-width: 600px;
		margin: 0 auto;
		padding: 2rem;
	}

	h1 {
		color: var(--primary-color);
		margin-bottom: 2rem;
		text-align: center;
	}

	.form-group {
		margin-bottom: 1.5rem;
	}

	label {
		display: block;
		margin-bottom: 0.5rem;
		font-weight: 500;
	}

	input {
		width: 100%;
		padding: 0.75rem;
		border: 1px solid #e2e8f0;
		border-radius: 0.5rem;
		font-size: 1rem;
	}

	button {
		width: 100%;
		padding: 0.75rem;
		background-color: var(--primary-color);
		color: white;
		border: none;
		border-radius: 0.5rem;
		font-size: 1rem;
		cursor: pointer;
		transition: background-color 0.2s;
	}

	button:hover:not(:disabled) {
		background-color: var(--secondary-color);
	}

	button:disabled {
		opacity: 0.7;
		cursor: not-allowed;
	}

	.error {
		color: #dc2626;
		margin-top: 1rem;
		text-align: center;
	}

	.success {
		color: #059669;
		margin-top: 1rem;
		text-align: center;
	}
</style> 