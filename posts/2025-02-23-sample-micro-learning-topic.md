---
layout: post
title: "Understanding Git Fast-Forward Merges"
date: 2025-02-23
excerpt: "A quick guide to when and why git merge uses fast-forward mode."
---

In Git, a **fast-forward merge** occurs when the branch you're merging into hasn't diverged from the branch you're merging.

## When Fast-Forward Happens

If your `main` branch looks like this:
```
A---B---C (main)
         \
          D---E (feature)
```

And no new commits have been added to `main` since you created `feature`, merging `feature` into `main` can simply move the `main` pointer forward to commit `E`. This is a fast-forward merge.

## Controlling Fast-Forward Behavior

```bash
# Always create a merge commit (even if fast-forward possible)
git merge --no-ff feature

# Allow fast-forward (default behavior)
git merge feature
```

## Why Use --no-ff?

- **History clarity**: Creates an explicit merge commit showing when features were integrated
- **Feature tracking**: Makes it easier to see feature boundaries in history
- **Team workflow**: Ensures consistent history structure in collaborative projects