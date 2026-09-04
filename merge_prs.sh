#!/usr/bin/env bash
set -e

REPO="OpenLoco/OpenGraphics"
MIN_PR_NUM=182  # Inclusive lower bound
MAX_PR_NUM=184  # Inclusive upper bound

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: Please run this script from inside your local Git repository."
  exit 1
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch: $CURRENT_BRANCH"

echo "Fetching open PRs from $REPO..."
# Fetch open PR numbers and sort numerically in ascending order (oldest -> newest)
PR_LIST=$(gh pr list --repo "$REPO" --state open --json number --limit 100 --jq '.[].number' | sort -n)

if [ -z "$PR_LIST" ]; then
  echo "No open PRs found."
  exit 0
fi

for PR in $PR_LIST; do
  # Inclusive range check: skip if PR < MIN_PR_NUM or PR > MAX_PR_NUM
  if [ "$PR" -lt "$MIN_PR_NUM" ] || [ "$PR" -gt "$MAX_PR_NUM" ]; then
    echo "Skipping PR #$PR (outside range [$MIN_PR_NUM, $MAX_PR_NUM])"
    continue
  fi

  echo "-----------------------------------"
  echo "Checking out and merging PR #$PR..."
  
  if gh pr checkout "$PR" --repo "$REPO"; then
    PR_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    
    git checkout "$CURRENT_BRANCH"
    echo "Merging branch $PR_BRANCH into $CURRENT_BRANCH..."
    
    if ! git merge "$PR_BRANCH" --no-edit -m "Local merge of PR #$PR"; then
      echo "Conflict detected on PR #$PR! Please resolve conflicts manually."
      exit 1
    fi
  else
    echo "Failed to check out PR #$PR"
  fi
done

echo "-----------------------------------"
echo "All PRs in range [$MIN_PR_NUM, $MAX_PR_NUM] merged in order into $CURRENT_BRANCH!"