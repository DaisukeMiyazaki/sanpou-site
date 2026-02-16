import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const blog = defineCollection({
	loader: glob({ base: './src/content/blog', pattern: '**/*.{md,mdx}' }),
	schema: ({ image }) =>
		z.object({
			title: z.string(),
			description: z.string(),
			pubDate: z.coerce.date(),
			updatedDate: z.coerce.date().optional(),
			heroImage: image().optional(),
		}),
});

const releases = defineCollection({
	loader: glob({ base: './src/content/releases', pattern: '**/*.{md,mdx}' }),
	schema: z.object({
		title: z.string(),
		version: z.string(),
		pubDate: z.coerce.date(),
		description: z.string(),
	}),
});

export const collections = { blog, releases };
