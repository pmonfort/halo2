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

In another window, you'll need to use and start Sidekiq.

```bash
bundle exec sidekiq
```

To reset Redis, you can use this command:

```bash
redis-cli flushall
```

Do not post your solution on GitHub. When you fork this, ensure that it is a PRIVATE fork.
