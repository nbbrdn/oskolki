# Oskolki Source fork — v0.1 overlay

Base: Ghost **Source 1.7.1** (`TryGhost/Source`, branch `main` at the time this bundle was prepared).

This bundle is intentionally an **overlay**, not a redistributed copy of the whole Source repository.
Fork/clone Source first, then copy these files over the fork.

## What v0.1 changes

- Default post template does **not** render the feature image.
- `custom-feature-image.hbs` is available for the occasional post that should show a hero/feature image.
- Common post markup is extracted to `partials/article.hbs`.
- Comments are isolated in `partials/comments.hbs`; native Ghost comments are used today, another engine can replace this partial later.
- Related articles are isolated in `partials/related-posts.hbs`.
- Custom CSS lives in `assets/css/oskolki.css`, leaving upstream Source CSS untouched.
- Feed thumbnails are small on desktop **and mobile**.
- Excerpts are 3 lines on desktop, 2 on tablets, hidden on very narrow phones.
- Article content width is 760px with slightly larger long-form typography.
- Theme defaults: list feed, images on, author hidden in feed, date shown, homepage hero/header off, serif titles.

## Apply

From your Source fork root:

```bash
cp -R /path/to/this-overlay/* .
pnpm install
pnpm test
pnpm zip
```

The installable theme will be created in:

```text
dist/oskolki-source.zip
```

## Development

Current Source declares Node >= 22.12.0 and pnpm 11.22.0.

```bash
pnpm install
pnpm dev
```

If Ghost is running locally, symlink the fork into `content/themes/` and activate it in Ghost Admin.

## Upstream strategy

Keep Ghost Source as a second remote:

```bash
git remote add upstream https://github.com/TryGhost/Source.git
git fetch upstream
```

Periodically merge/rebase upstream changes into your fork. Because our visual overrides are in `assets/css/oskolki.css` and the article body is moved into our own partial, most upstream updates should be low-conflict.

## License

Keep the original Source `LICENSE` file in the fork. Source is MIT-licensed.

## Next logical increments

1. Finalize typography/colors after testing on real genealogy posts.
2. Decide native Ghost comments vs external engine; only `partials/comments.hbs` should change.
3. Add genealogy-specific metadata/blocks only after we know which fields are genuinely useful.
4. Add CI: `pnpm test` + build zip on push/tag.
