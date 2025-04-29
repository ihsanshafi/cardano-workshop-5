<script lang="ts">
	import { page } from '$app/stores';
</script>

<main>
	<h1>Gift Card App</h1>
	<nav>
		<a href="/mint" class="button">Mint Gift Card</a>
		<a href="/redeem" class="button">Redeem Gift Card</a>
	</nav>
</main>

<style>
	main {
		max-width: 800px;
		margin: 0 auto;
		padding: 2rem;
		text-align: center;
	}

	h1 {
		color: var(--primary-color);
		margin-bottom: 2rem;
	}

	nav {
		display: flex;
		gap: 1rem;
		justify-content: center;
	}

	.button {
		display: inline-block;
		padding: 0.75rem 1.5rem;
		background-color: var(--primary-color);
		color: white;
		text-decoration: none;
		border-radius: 0.5rem;
		transition: background-color 0.2s;
	}

	.button:hover {
		background-color: var(--secondary-color);
	}
</style> 