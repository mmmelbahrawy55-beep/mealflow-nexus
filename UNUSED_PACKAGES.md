# Unused Packages Analysis

> Generated: Analysis of packages installed but not imported anywhere in `src/`
> Method: `rg` (ripgrep) search for each package name across all `.ts`, `.tsx`, `.js`, `.jsx` files in `src/`

## Targeted Packages (6 checked)

| Package | Version | Imported in `src/`? | Status |
|---|---|---|---|
| `@mdxeditor/editor` | 3.52.3 | ❌ No | **UNUSED** |
| `react-markdown` | 10.1.0 | ❌ No | **UNUSED** |
| `react-syntax-highlighter` | 15.6.6 | ❌ No | **UNUSED** |
| `@reactuses/core` | 6.1.9 | ❌ No | **UNUSED** |
| `input-otp` | 1.4.2 | ✅ Yes (`src/components/ui/input-otp.tsx`) | Used (shadcn component) |
| `next-intl` | 4.7.0 | ❌ No | **UNUSED** — project uses custom `src/lib/i18n.tsx` instead |

### Summary of Targeted

- **5 unused** out of 6 targeted packages
- `input-otp` is used by the shadcn/ui `InputOTP` component

## Broader Scan (other potentially unused packages)

| Package | Version | Imported in `src/`? | Notes |
|---|---|---|---|
| `next-auth` | 4.24.13 | ❌ No | Installed but no auth routes configured yet |
| `@tanstack/react-query` | 5.90.19 | ❌ No | Installed but data fetching uses plain `fetch()` |
| `@tanstack/react-table` | 8.21.3 | ❌ No | No table views using this |
| `@dnd-kit/core` | 6.3.1 | ❌ No | No drag-and-drop features |
| `@dnd-kit/sortable` | 10.0.0 | ❌ No | No drag-and-drop features |
| `@dnd-kit/utilities` | 3.2.2 | ❌ No | No drag-and-drop features |
| `react-hook-form` | 7.71.1 | ✅ Yes | Used via shadcn/ui `Form` component |
| `@hookform/resolvers` | 5.2.2 | ✅ Yes | Used in shadcn/ui `Form` component |
| `framer-motion` | 12.26.2 | ✅ Yes | Used in all view components |
| `recharts` | 3.8.1 | ✅ Yes | Used in dashboards |
| `socket.io-client` | 4.8.3 | ✅ Yes | Used in OrderTrackingView |
| `zustand` | 5.0.10 | ✅ Yes | Core state management |
| `zod` | 4.3.5 | ✅ Yes | Used in API validation |
| `next-themes` | 0.4.6 | ✅ Yes | Dark mode support |
| `date-fns` | 4.1.0 | ✅ Yes | Date formatting in views |
| `react-leaflet` | 5.0.0 | ✅ Yes | Interactive map in OrderTrackingView |
| `leaflet` | 1.9.4 | ✅ Yes | Map tiles |
| `lucide-react` | 0.5.25.0 | ✅ Yes | Icons throughout the app |
| `sonner` | 2.0.7 | ✅ Yes | Used in shadcn/ui Toaster and RestaurantDetailView |
| `vaul` | 1.1.2 | ✅ Yes | shadcn/ui Drawer component |
| `embla-carousel-react` | 8.6.0 | ✅ Yes | shadcn/ui Carousel component |
| `react-resizable-panels` | 3.0.6 | ✅ Yes | shadcn/ui Resizable component |

## Recommendations

### Safe to Remove (confirmed unused)

```bash
bun remove @mdxeditor/editor react-markdown react-syntax-highlighter @reactuses/core next-intl
```

These 5 packages have **zero imports** anywhere in `src/`. Removing them would reduce `node_modules` size.

### Potentially Removable (no active usage, but may be intended for future use)

```bash
bun remove next-auth @tanstack/react-query @tanstack/react-table @dnd-kit/core @dnd-kit/sortable @dnd-kit/utilities
```

These packages are installed but not used. However, they may be intended for future features:
- `next-auth` — authentication is stubbed but not fully wired
- `@tanstack/react-query` — could replace raw `fetch()` calls
- `@tanstack/react-table` — could be used for admin data tables
- `@dnd-kit/*` — could be used for menu item reordering in restaurant dashboard

**Note:** No packages were actually uninstalled. This is a read-only analysis.
