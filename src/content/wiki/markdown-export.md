---
title: "Markdown Export"
description: "Every memo lives on as a plain markdown file with YAML frontmatter — yours forever, even if you stop using Sanpou."
firstAddedVersion: "1.0.0"
lastUpdated: "2026-05-14"
---

Sanpou doesn't lock your memos inside the app. Every memo is exported as a plain `.md` file with YAML frontmatter — opens in Obsidian, Logseq, any text editor, or just `cat`.

## File Naming

Each file is named `YYYY-MM-DD HHmm [first 30 chars of text].md`, so they sort chronologically and you can recognize them at a glance.

## Multiple Export Folders

You can configure up to three external folders to receive your memos. Each new memo is written to all of them simultaneously — useful for keeping a copy in iCloud Drive, a sync folder, and an Obsidian vault.

## Embedded Media

Attached photos and videos are copied alongside the markdown and embedded using wiki-link syntax (`![[folderName/image.jpg]]`), so they show up inline in apps that support wiki links.

## Frontmatter

The frontmatter includes `created_at`, `steps`, `location`, and `leaflet_coordinates` by default. You can add your own keys — see [Frontmatter Customization](/sanpou-site/wiki/frontmatter-customization/).
