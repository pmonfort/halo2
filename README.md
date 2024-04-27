# README

This is a working repository for the Halo Science interview loop.
To get started, you'll need to ensure you have all the prerequisites, including SQLite and Redis.

```bash
bundle
rake db:create
rake db:migrate
rails s
```

In another window (or using a Procfile manager) run bun for building.

```bash
bun install
bun run build --watch
```
