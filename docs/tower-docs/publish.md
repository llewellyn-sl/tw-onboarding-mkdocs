---
title: Tower documentation publishing process
description: Instructions to publish content updates to help.tower.nf
---

This page details how to publish content updates to the [live site](https://help.tower.nf) once new content has been successfully pushed to [nf-tower-docs](https://github.com/seqeralabs/nf-tower-docs). See [MkDocs](./mkdocs.md) for content contribution guidelines, and [Style](./style.md) for the Markdown elements used in the Tower docs project. 

This guide assumes you have completed the [Docker build instructions](https://github.com/seqeralabs/nf-tower-cloud/blob/master/docs/README.md) to set up your local environment. 

## Publish to help.tower.nf

We have a Netlify deployment pipeline that publishes the nf-tower-docs `master-html` branch to the public docs site. 

From the root of your local nf-tower-docs:

```bash
VERSION=23.2               # Major versions only. No patch.
BRANCH=master-html

git checkout master

# To check the branch locally:
mike deploy -b $BRANCH --update-aliases $VERSION latest    # Use to serve l
mkdocs serve

# To push the branch to GH and the live site
mike set-default latest -b $BRANCH
git push origin master-html
# Check the live site ~10 seconds later.

# Delete your local master-html branch once complete
git branch -d master-html
```
