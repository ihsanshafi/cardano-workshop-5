<script lang="ts">
	let amount = '';
	let recipient = '';
	let message = '';
	let loading = false;
	let error = '';
	let success = '';

	async function handleSubmit() {
		loading = true;
		error = '';
		success = '';

		try {
			// TODO: Implement minting logic
			success = 'Gift card minted successfully!';
		} catch (e) {
			error = e instanceof Error ? e.message : 'An error occurred';
		} finally {
			loading = false;
		}
	}
</script>

<main>
	<h1>Mint Gift Card</h1>
	<form on:submit|preventDefault={handleSubmit}>
		<div class="form-group">
			<label for="amount">Amount (ADA)</label>
			<input
				type="number"
				id="amount"
				bind:value={amount}
				required
				min="1"
				step="0.1"
			/>
		</div>

		<div class="form-group">
			<label for="recipient">Recipient Address</label>
			<input
				type="text"
				id="recipient"
				bind:value={recipient}
				required
			/>
		</div>

		<div class="form-group">
			<label for="message">Message (optional)</label>
			<textarea
				id="message"
				bind:value={message}
				rows="3"
			/>
		</div>

		<button type="submit" disabled={loading}>
			{loading ? 'Minting...' : 'Mint Gift Card'}
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

	input,
	textarea {
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