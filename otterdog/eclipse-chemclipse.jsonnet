local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('science.chemclipse', 'eclipse-chemclipse') {
  settings+: {
    description: "",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/chemclipse/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
    },
    orgs.newRepo('chemclipse') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "develop",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "ChemClipse Project",
      webhooks: [
        orgs.newRepoWebhook('https://chat.lablicate.com/plugins/github/webhook') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "issue_comment",
            "issues",
            "pull_request",
            "pull_request_review",
            "pull_request_review_comment",
            "push",
            "star"
          ],
          secret: "********",
        },
      ],
    },
  ],
}
