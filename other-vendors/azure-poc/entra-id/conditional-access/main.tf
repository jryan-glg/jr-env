  terraform {
    required_providers {
      azuread = {
        source  = "hashicorp/azuread"
        version = "~> 2.47"
      }
    }
  }

provider "azuread" {}

resource "azuread_conditional_access_policy" "poc_test_policy" {
  display_name = "POC: Report-Only MFA for Test User"
  state        = "enabledForReportingButNotEnforced" # This is crucial, it makes the policy non-enforcing

  conditions {
    client_app_types = ["all"]
    applications {
      included_applications = ["All"]
    }
    users {
      # Replace with the Object ID of a single test user
      included_users = ["00000000-0000-0000-0000-000000000000"]
    }
  }

  grant_controls {
    operator      = "OR"
    built_in_controls = ["mfa"]
  }
}

output "policy_id" {
  value = azuread_conditional_access_policy.poc_test_policy.id
}