---
title: "Photo Transcription"
description: "Pull text out of a photo you've attached to a memo — signs, menus, posters — and drop it straight into the memo body."
firstAddedVersion: "2.5.0"
lastUpdated: "2026-05-27"
---

Not every walk thought arrives as a sentence. Sometimes it's a sign you photographed, a handwritten menu board, or a poster you'd like to remember. Photo transcription (technically called OCR) turns the text in those photos into something you can edit, search, and export with the rest of your memo.

## How to Start a Transcription

Transcription runs on photos that are **already attached** to a memo — it doesn't launch the camera on its own.

- **While composing a memo**: tap a photo thumbnail to open it full-screen, then tap the **Read text** button overlaid on the preview.
- **From a saved memo**: open the [memo detail view](/sanpou-site/wiki/memo-detail/), find the photo in the carousel, and tap the **Read text** button.

Both paths open the same confirmation sheet, where you pick language and orientation, run recognition, then edit before inserting.

## Languages

Photo transcription follows your app [language settings](/sanpou-site/wiki/languages/). The language picker only shows the languages you've actually enabled — your primary plus the optional secondary — so if you only use Japanese, you won't see an English toggle every time. Supported languages are **Japanese**, **English**, and **Dutch**.

## Vertical Japanese (Tategaki)

Japanese is the only language with a vertical-writing tradition, so the horizontal / vertical orientation toggle only appears when Japanese is the current transcription language. Horizontal text goes through the Vision framework; vertical Japanese routes through VisionKit's Live Text engine to handle tategaki correctly.

## Editing Before Insertion

Recognition results aren't perfect — they often pick up stray punctuation or misread kerned characters. The confirmation sheet drops the read text into an editable field first so you can tidy it up before it touches your memo. When you hit **Insert**, the cleaned text lands at your cursor position if you're composing a memo, or is appended to the body when you transcribe from a saved memo.

## Related

- [Photo & Video Capture](/sanpou-site/wiki/photo-video-capture/) — how photos get attached in the first place
- [Memo Detail](/sanpou-site/wiki/memo-detail/) — OCR is also reachable from saved memos
- [Languages](/sanpou-site/wiki/languages/) — primary / secondary language setup
