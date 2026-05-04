# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Quick Start

Install dependencies and run the development server:

```bash
npm install
npm run dev
```

The app will be available at http://localhost:3000

## Build & Deployment

```bash
npm run build          # Build for production
npm run preview        # Preview production build locally
npm run generate       # Generate static site
```

## Core Architecture

**Onelink** is a "link-in-bio" tool where profile data (name, bio, social links, custom links) lives entirely in the URL as a base64-encoded JSON string. Two main pages serve different purposes:

### Data Model
The data object has these fields:
- `n` - name
- `d` - description/bio
- `i` - profile image URL
- `f`, `t`, `ig`, `gh`, `tg`, `l`, `e`, `w`, `y` - social links (Facebook, Twitter, Instagram, GitHub, Telegram, LinkedIn, Email, WhatsApp, YouTube)
- `ls` - array of custom links, each with `l` (label), `i` (icon name), `u` (URL)

### Pages
- **pages/index.vue** - Editor page where users fill out a form. Real-time preview renders on the right. The "Publish" button encodes the data to base64 and copies a shareable URL.
- **pages/1.vue** - Template viewer that decodes the `data` query parameter and renders using the Simple template.

### Component Organization
- **components/AppForm/** - Form sections for each data category (Profile, SocialLinks, Links, Preview)
- **components/Base/** - Reusable UI components (FormSection, Loading)
- **components/Templates/** - Display templates (Simple is the current template)

### Data Encoding
- **utils/transformer.js** - `encodeData()` converts the data object to base64 JSON; `decodeData()` reverses it. Uses `js-base64` library.

## Key Dependencies

- **Nuxt 3** - meta-framework for Vue
- **Tailwind CSS** - utility-first styling
- **@nuxtjs/color-mode** - dark/light mode support
- **nuxt-icon** - icon component system
- **@headlessui/vue** - unstyled accessible UI primitives
- **floating-vue** - tooltip/popover library
- **vuedraggable** - drag-and-drop for custom links
- **js-base64** - base64 encoding/decoding

## Development Notes

The codebase is intentionally small and experimental. The roadmap mentions:
1. Multiple templates (currently only Simple template exists)
2. Refactoring repeated boilerplate code

When adding features, keep the data model compact since it's embedded in URLs (very long URLs need a link shortener like dub.co).
