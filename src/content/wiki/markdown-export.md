---
title: "Markdown Export"
description: "Every memo lives on as a plain markdown file with YAML frontmatter — yours forever, even if you stop using Sanpou."
firstAddedVersion: "1.0.0"
lastUpdated: "2026-07-11"
---

Sanpou doesn't lock your memos inside the app. Every memo is exported as a plain `.md` file with YAML frontmatter — opens in Obsidian, Logseq, any text editor, or just `cat`.

## File Naming

Each file is named `YYYY-MM-DD HHmm [first 30 chars of text].md`, so they sort chronologically and you can recognize them at a glance.

## Multiple Export Folders

You can configure up to three external folders to receive your memos. Each new memo is written to all of them simultaneously — useful for keeping a copy in iCloud Drive, a sync folder, and an Obsidian vault.

## Embedded Media

Attached photos and videos are copied alongside the markdown and embedded using wiki-link syntax (`![[folderName/image.jpg]]`), so they show up inline in apps that support wiki links.

## Frontmatter

The frontmatter includes `created_at`, `steps`, `location`, and `leaflet_coordinates` by default. You can add your own keys — see [Frontmatter Customization](/wiki/frontmatter-customization/).

## Genius Loci Notes

When a memo has location data, Sanpou can generate a short interpretive note about the place — its landforms, nearby features, and any relevant background — after the memo is saved. When such a note exists, it's appended to the exported markdown below your memo text, separated by a horizontal rule and headed `### 土地の記憶` ("memory of the land"):

```markdown
your memo text

---

### 土地の記憶

The generated note about this place.
```

The note is only added when one was generated for the memo, so memos without location data (or saved before the note finished) export without this section. If the note is generated after the initial save, the markdown file is re-exported to include it.
