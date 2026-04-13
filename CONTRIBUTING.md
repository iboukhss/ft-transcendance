# Contributing to the project

## Branching model

We use trunk-based development with feature branches (read more here: https://trunkbaseddevelopment.com/).

That basically means we maintain a single source of truth (`master` in our case) and all contributions stem from this branch out into short-lived feature branches. These feature branches are later merged back onto the master branch (via `git rebase`) during a code review (pull request).

A feature branch should always correspond to a single feature or bugfix, different features should remain in their own respective feature branches. This approach has multiple benefits: preventing breakage on the main working branch, speeding up the code review and merging process, and keeping developers focused on clearly defined tasks.

Ideally, a feature branch should not exceed ~3 days of work. Long lived branches are a sign of bad task splitting and future merge conflicts, this is not a hard rule however, just a basic guideline.

## Branch naming rules

When creating new branches only use the following prefixes:

| Prefix | Use case | Example |
| --- | --- | --- |
| `feature/` | New features or improvements | `feature/stripe-integration` |
| `bugfix/` | Standard bug fixes | `bugfix/auth-redirect` |
| `hotfix/` | Critical bug fixes | `hotfix/database-connection` |
| `docs/` | Pure documentation changes | `docs/api-guide` |

This is mostly for keeping the GitHub repo organized and see what features are currently being worked on.

## Commit convention

For uniformity please use the following commit format:

```
<scope>: <Action in present tense>
```

Examples:
```
db: Add status field to missions table  // Good!
ui: Fix padding on signup form          // Good!
api: Added new route for xyz            // Bad, past tense
fix: Fix bug in database connection     // Bad, wrong scope
```

These rules are highly encouraged, but not strongly enforced. They are mostly there to keep everyone on the same page. Do not worry too much about commit messages, `git` is a very flexible tool and rearranging and renaming commits before a final merge is really easy to do. This is always something that can be fixed during code review!

### List of available scopes

Always try to use the following scopes in your commit messages:

| Scope | Use this when you... | Associated folders (not exhaustive) |
| --- | --- | --- |
| **ui** | Change how things look | `app/components`, `app/pages` |
| **app** | Change how the frontend thinks | `app/`, `app/composables`, `app/middleware` |
| **api** | Change API endpoints | `server/api` |
| **db** | Do any database changes (schema, migration, etc.) | `server/database`, `schema.ts` |
| **server** | Change how the backend works | `server/routes`, `server/middleware` |
| **shared** | Add shared utility functions | `shared/` |
| **infra** | Modify things related to the build process and overall project infrastructure | `package.json`, `nuxt.config.ts`, `docker-compose.yml` |
| **env** | Edit local environment settings | `.env.example`, `.nuxtrc`, `.gitignore` |
| **docs** | Write documentation | `README.md`, `CONTRIBUTING.md` |

The scopes above follow directly Nuxt 4 directory stucture (learn more here: https://nuxt.com/docs/4.x/directory-structure).

Consider `app` and `server` as general scopes for frontend and backend development respectively.

### Commit hygiene

In general, it's easier to have multiple small commits and squash them together in logical groups rather than dividing a single big commit.

That being said, you should always try to make your commits work in isolation (look up **atomic commits**), and avoid committing broken or semi-working changes.

Reminder, `git commit --amend` and `git rebase --interactive` are your best friends :wink:.
