---
title: Tower Enterprise release checklist
description: A checklist of documentation updates to complete before a Tower Enterprise release
---

Tower Enterprise is released in quarterly cycles. The code freeze during the last 4 weeks of the release cycle is used to test and draft instructions and documentation updates for release features and fixes. When features for the upcoming release are confirmed, a number of updates to documentation occur for each release cycle.

## Weeks leading to release

- [ ]  Review release notes Google doc
- [ ]  Write content for new features, updates, breaking changes
- [ ]  Prep Tower docs version of release notes and changelog (enterprise/release_notes/23.2.md)
- [ ]  Compare list of fixes with doc requests backlog to see if any are addressed by them that need a new FAQ / doc update

## Before Enterprise release announcement email

- [ ]  Update the following Tower docs pages with new CR URLs ([`cr.seqera.io/private/nf-tower-enterprise/frontend:v22.4.2`](http://cr.seqera.io/private/nf-tower-enterprise/frontend:v23.2.0) , [`cr.seqera.io/private/nf-tower-enterprise/backend:v23.2.0`](http://cr.seqera.io/private/nf-tower-enterprise/frontend:v23.2.0)) and nf-launcher image URL ([`https://quay.io/seqeralabs/nf-launcher:j17-23.04.2`](https://quay.io/seqeralabs/nf-launcher:j17-23.04.2)):
    - [ ]  templates/aws-ecs-cloudformation.json
    - [ ]  templates/docker-compose.yml
    - [ ]  templates/tower-cron.yml
    - [ ]  templates/tower-svc.yml
    - [ ]  docs/index.md
    - [ ]  docs/prerequisites/aws.md
    - [ ]  docs/prerequisites/azure.md
    - [ ]  docs/prerequisites/gcp.md
    - [ ]  docs/prerequisites/on-prem.md
- [ ]  Review Paolo’s release notes in nf-tower-deployment
- [ ]  Publish Tower docs version of release notes and changelog (docs/release_notes/23.2.md)