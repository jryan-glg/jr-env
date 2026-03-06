# Import process
# 1. Define the import block
import {
  to = azuread_conditional_access_policy.ca_pilot_grant_require_app_protection_policy_for_mobile_o365_ios_android
  id = "/identity/conditionalAccess/policies/7414cd36-3055-4fc5-83d0-4cbcb567aede"
}
# terraform import azuread_conditional_access_policy.my_location /identity/conditionalAccess/policies/aff49619-3d87-43e6-905d-d908594a747d

resource "azuread_conditional_access_policy" "country" {
  display_name = "OLD-GLG Allowed Country Policy"
  state        = "enabledForReportingButNotEnforced"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
    #   included_user_actions = []
    }
    locations {
      excluded_locations = ["17534d0b-2304-4a66-a252-7bfcbeed2bc8"]
      included_locations = ["All"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    # authentication_strength_policy_id = ""
    built_in_controls                 = ["mfa"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

######
resource "azuread_conditional_access_policy" "old_glg_session_timeout_24hrs" {
  display_name = "OLD-GLG Session Timeout 24hrs"
  state        = "enabledForReportingButNotEnforced"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = ["46715e5a-e742-41be-b742-56b89fe1df26"]
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["mfa"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
  session_controls {
    application_enforced_restrictions_enabled = false
    cloud_app_security_policy                 = null
    disable_resilience_defaults               = false
    persistent_browser_mode                   = null
    sign_in_frequency                         = 1
    sign_in_frequency_authentication_type     = "primaryAndSecondaryAuthentication"
    sign_in_frequency_interval                = "timeBased"
    sign_in_frequency_period                  = "days"
  }
}

#########
resource "azuread_conditional_access_policy" "old_internalappsaccesstestgroup" {
  display_name = "OLD-InternalAppsAccessTestGroup "
  state        = "enabledForReportingButNotEnforced"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["d4b001d2-b7f8-4dfc-8774-13607c9173db"]
      # included_user_actions = []
    }
    platforms {
      excluded_platforms = []
      included_platforms = ["windows"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = ["46715e5a-e742-41be-b742-56b89fe1df26", "604a7d38-d913-4862-81e7-a62fc23c235b"]
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["compliantDevice"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################
resource "azuread_conditional_access_policy" "old_require_MFA_for_azure_management" {
  display_name = "OLD-Require multifactor authentication for Azure management"
  state        = "enabledForReportingButNotEnforced"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["797f4846-ba00-4fd7-ba43-dac1f8f63013"]
      # included_user_actions = []
    }
    users {
      excluded_groups = ["1d09f82e-ba83-4f1d-a83c-7ab7a381fbb1"]
      excluded_roles  = []
      excluded_users  = ["46715e5a-e742-41be-b742-56b89fe1df26"]
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["mfa"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###############
resource "azuread_conditional_access_policy" "old_risky_user_auth" {
  display_name = "OLD-Risky User Auth"
  state        = "enabledForReportingButNotEnforced"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = ["high", "medium"]
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = ["16296eec-82cd-4bde-8a8b-8c5f20654f4f"]
      included_roles  = []
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################
resource "azuread_conditional_access_policy" "microsoft_managed_MFA_for_admins_accessing_microsoft_admin_portals" {
  display_name = "Microsoft-managed: Multifactor authentication for admins accessing Microsoft Admin Portals"
  state        = "enabledForReportingButNotEnforced"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["MicrosoftAdminPortals"]
      # included_user_actions = []
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = ["62e90394-69f5-4237-9190-012177145e10", "194ae4cb-b126-40b2-bd5b-6091b380977d", "f28a1f50-f6e7-4571-818b-6a12f2af6b6c", "29232cdf-9323-42fd-ade2-1d097af3e4de", "b1be1c3e-b65d-4f19-8427-f6fa0d97feb9", "729827e3-9c14-49f7-bb1b-9608f156bbb8", "b0f54661-2d74-4c50-afa3-1ec803f12efe", "fe930be7-5e62-47db-91af-98c3a49a38b1", "c4e39bd9-1100-46d3-8c65-fb160da0071f", "9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3", "158c047a-c907-4556-b7ef-446551a6b5f7", "966707d0-3269-4727-9be2-8c3a10f19b9d", "7be44c8a-adaf-4e2a-84d6-ab2649e08a13", "e8611ab8-c189-46e8-94e1-60213ab1f814"]
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["mfa"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################
resource "azuread_conditional_access_policy" "ca_prod-grant-require_mfa_for_admins_global" {
  display_name = "CA-Prod-GRANT-Require MFA for Admins [Global]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    users {
      excluded_groups = ["1d09f82e-ba83-4f1d-a83c-7ab7a381fbb1"]
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = ["62e90394-69f5-4237-9190-012177145e10", "194ae4cb-b126-40b2-bd5b-6091b380977d", "f28a1f50-f6e7-4571-818b-6a12f2af6b6c", "29232cdf-9323-42fd-ade2-1d097af3e4de", "b1be1c3e-b65d-4f19-8427-f6fa0d97feb9", "729827e3-9c14-49f7-bb1b-9608f156bbb8", "b0f54661-2d74-4c50-afa3-1ec803f12efe", "fe930be7-5e62-47db-91af-98c3a49a38b1", "c4e39bd9-1100-46d3-8c65-fb160da0071f", "9b895d92-2cd3-44c7-9d02-a6ac2d5ea5c3", "158c047a-c907-4556-b7ef-446551a6b5f7", "966707d0-3269-4727-9be2-8c3a10f19b9d", "7be44c8a-adaf-4e2a-84d6-ab2649e08a13", "e8611ab8-c189-46e8-94e1-60213ab1f814", "9f06204d-73c1-4d4c-880a-6edb90606fd8"]
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["mfa"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

##############
resource "azuread_conditional_access_policy" "ca_pilot-grant-mfa_intune_enrolment" {
  display_name = "CA-Pilot-GRANT-MFA Intune Enrolment"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["d4ebce55-015a-49b5-a083-c84d1797ae8c"]
      # included_user_actions = []
    }
    platforms {
      excluded_platforms = ["macOS", "linux"]
      included_platforms = ["all"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = ["ed3c1165-ff94-41a4-8887-180be9c7c823"]
      included_roles  = []
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["mfa"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
  session_controls {
    application_enforced_restrictions_enabled = false
    cloud_app_security_policy                 = null
    disable_resilience_defaults               = false
    persistent_browser_mode                   = null
    sign_in_frequency                         = null
    sign_in_frequency_authentication_type     = "primaryAndSecondaryAuthentication"
    sign_in_frequency_interval                = "everyTime"
    sign_in_frequency_period                  = null
  }
}

###################
resource "azuread_conditional_access_policy" "ca_prod_block_legacy_authentication_global" {
  display_name = "CA-Prod-BLOCK-Legacy Authentication [Global]"
  state        = "enabled"
  conditions {
    client_app_types              = ["exchangeActiveSync", "other"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = ["6d1cd8dd-b75b-4dd2-8c38-97fb7a626ee9"]
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################
resource "azuread_conditional_access_policy" "ca_pilot_grant_required_compliance_devices_o365" {
  display_name = "CA-Pilot-GRANT-Required Compliance devices [O365]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["Office365"]
      # included_user_actions = []
    }
    platforms {
      excluded_platforms = ["windowsPhone", "macOS", "linux"]
      included_platforms = ["all"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = ["47ec28db-660b-4af5-bf63-69df3d7245c1"]
      included_groups = ["ed3c1165-ff94-41a4-8887-180be9c7c823"]
      included_roles  = []
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["mfa", "compliantDevice"]
    custom_authentication_factors     = []
    operator                          = "AND"
    terms_of_use                      = []
  }
}
###################
resource "azuread_conditional_access_policy" "ca_prod_grant_required_mfa_for_risky_sign_in_users_global" {
  display_name = "CA-Prod-GRANT-Require MFA for Risky Sign-In users [Global]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = ["high", "medium"]
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = ["0e60ef6b-11da-4742-b201-f2a50ea2c08e", "b00317a0-a5e9-4ff6-8fbd-bf69dcdd96d2"]
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["mfa"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################
resource "azuread_conditional_access_policy" "ca_prod_block_access_from_unknownos_global" {
  display_name = "CA-Prod-BLOCK-Access from UnknownOS [Global] "
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    platforms {
      excluded_platforms = ["android", "iOS", "windows", "macOS", "linux"]
      included_platforms = ["all"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = ["acd91356-5e9a-48ef-80b7-f3e50338b60b", "6d1cd8dd-b75b-4dd2-8c38-97fb7a626ee9", "b00317a0-a5e9-4ff6-8fbd-bf69dcdd96d2"]
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################

resource "azuread_conditional_access_policy" "ca_pilot_grant_require_re_mfa_for_sensitive_pim_roles_global" {
  display_name = "CA-Pilot-GRANT-Require re-MFA for sensitive PIM roles [Global]"
  state        = "disabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = []
      # included_user_actions = []
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = []
      included_users  = ["8577fba3-6827-488e-8861-51a818109637"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = "/policies/authenticationStrengthPolicies/00000000-0000-0000-0000-000000000002"
    built_in_controls                 = []
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
  session_controls {
    application_enforced_restrictions_enabled = false
    cloud_app_security_policy                 = null
    disable_resilience_defaults               = false
    persistent_browser_mode                   = null
    sign_in_frequency                         = null
    sign_in_frequency_authentication_type     = "primaryAndSecondaryAuthentication"
    sign_in_frequency_interval                = "everyTime"
    sign_in_frequency_period                  = null
  }
}

###################

resource "azuread_conditional_access_policy" "ca_prod_block_svcastrix_zoom_access_to_zoom_from_untrusted_location_macbook" {
  display_name = "CA-Prod-BLOCK- [svcAstrix_Zoom] access to [Zoom] from [Un-Trusted Location][MacBook]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["8ec0f0ec-f4fa-498c-b292-9e2735fa6b40"]
      # included_user_actions = []
    }
    locations {
      excluded_locations = ["063eeaf2-9421-467f-868e-129657bd4e68"]
      included_locations = ["All"]
    }
    platforms {
      excluded_platforms = []
      included_platforms = ["macOS"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = []
      included_users  = ["f28b6f10-9ce1-46f8-9eff-1d143aa2f277"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################

resource "azuread_conditional_access_policy" "ca_prod_block_non_compliant_laptops_linux" {
  display_name = "CA-Prod-BLOCK-Non Compliant Laptops [Linux]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    devices {
      filter {
        mode = "exclude"
        rule = "device.isCompliant -eq True -or device.trustType -eq \"Workplace\""
      }
    }
    platforms {
      excluded_platforms = []
      included_platforms = ["linux"]
    }
    users {
      excluded_groups = ["dca1b343-b4ca-49f8-b9b8-b09489c3af9d", "6c781257-945b-45a1-b0fa-b4131ad4a3df"]
      excluded_roles  = []
      excluded_users  = ["b00317a0-a5e9-4ff6-8fbd-bf69dcdd96d2", "6d1cd8dd-b75b-4dd2-8c38-97fb7a626ee9", "9812bd99-3945-48bb-9776-23747fbcc18d", "375df518-5615-4841-943b-b182295c5eca"]
      included_groups = ["b06178d9-7d80-4456-acf6-e934062b7c41"]
      included_roles  = []
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}
###################

resource "azuread_conditional_access_policy" "ca_prod_block_non_compliant_laptops_macbook" {
  display_name = "CA-Prod-BLOCK-Non Compliant Laptops [MacBook]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = ["7c40ae0c-0a3d-480d-9fd0-117a9b4d2c9f", "c859de61-8a6b-42e6-ba88-f639df33bc72", "3497ce26-74bc-4db0-8b6d-7264bcaacc6e", "0000000a-0000-0000-c000-000000000000", "d4ebce55-015a-49b5-a083-c84d1797ae8c", "b03c10a8-71c7-45f9-b44a-3335ab76e970"]
      included_applications = ["All"]
      # included_user_actions = []
    }
    devices {
      filter {
        mode = "exclude"
        rule = "device.isCompliant -eq True -or device.trustType -eq \"Workplace\""
      }
    }
    platforms {
      excluded_platforms = []
      included_platforms = ["macOS"]
    }
    users {
      excluded_groups = ["6c781257-945b-45a1-b0fa-b4131ad4a3df", "5d56768b-1ff6-4344-af4d-cd91dd68c0c8"]
      excluded_roles  = []
      excluded_users  = ["837862bd-b5c2-4d67-a54b-a4078b3e09bd", "b00317a0-a5e9-4ff6-8fbd-bf69dcdd96d2", "2a3d1456-025e-4461-b34e-5792484bd8ae", "cc4e4132-6b73-485f-9868-97e827c253b6", "f28b6f10-9ce1-46f8-9eff-1d143aa2f277", "c60bfb77-d44e-4451-ac65-3c30085c6bd0", "c930905d-6a75-46c8-aaff-162201d0ad43"]
      included_groups = ["b06178d9-7d80-4456-acf6-e934062b7c41"]
      included_roles  = []
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################

resource "azuread_conditional_access_policy" "CA_prod_block_non_compliant_laptops_windows" {
  display_name = "CA-Prod-BLOCK-Non Compliant Laptops [Windows]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = ["3497ce26-74bc-4db0-8b6d-7264bcaacc6e", "c859de61-8a6b-42e6-ba88-f639df33bc72", "b90d8e05-c7af-469c-b56f-02a38b792f49", "fd127fb1-159d-49ed-bb14-89210d56dee9", "d4ebce55-015a-49b5-a083-c84d1797ae8c", "a5ab63f6-2196-4c96-be9c-ee757e9f547a", "d4b001d2-b7f8-4dfc-8774-13607c9173db"]
      included_applications = ["All"]
      # included_user_actions = []
    }
    devices {
      filter {
        mode = "exclude"
        rule = "device.isCompliant -eq True -or device.trustType -eq \"AzureAD\" -or device.trustType -eq \"Workplace\" -or device.deviceOwnership -eq \"Company\""
      }
    }
    locations {
      excluded_locations = ["098caed4-2cbd-4041-9b9a-b2b04ddb9550"]
      included_locations = ["All"]
    }
    platforms {
      excluded_platforms = []
      included_platforms = ["windows"]
    }
    users {
      excluded_groups = ["6c781257-945b-45a1-b0fa-b4131ad4a3df", "5d56768b-1ff6-4344-af4d-cd91dd68c0c8", "5d42aaa9-3a96-4114-8558-f214340a50bd"]
      excluded_roles  = []
      excluded_users  = ["b00317a0-a5e9-4ff6-8fbd-bf69dcdd96d2", "01cb7393-8135-483c-ac1c-78169a1da536"]
      included_groups = ["b06178d9-7d80-4456-acf6-e934062b7c41"]
      included_roles  = []
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################

resource "azuread_conditional_access_policy" "ca_prod_block_drift_email_global" {
  display_name = "CA-Prod-BLOCK-Drift / Drift Email [Global]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["57aa99b9-8cd2-4c0e-9498-2d6749d33f3b", "d5afd8bd-b39b-477f-94d1-d3c35f5b4867"]
      # included_user_actions = []
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################

resource "azuread_conditional_access_policy" "ca_prod_grant_require_mfa_global" {
  display_name = "CA-Prod-GRANT-Require MFA [Global]"
  state        = "enabled"
  conditions {
    client_app_types              = ["browser", "mobileAppsAndDesktopClients"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = ["3497ce26-74bc-4db0-8b6d-7264bcaacc6e"]
      included_applications = ["All"]
      # included_user_actions = []
    }
    locations {
      excluded_locations = []
      included_locations = ["All"]
    }
    users {
      excluded_groups = ["1d09f82e-ba83-4f1d-a83c-7ab7a381fbb1", "276c55b3-6e70-4173-8b03-dc32d02e660a"]
      excluded_roles  = []
      excluded_users  = ["bffd723c-9993-489b-a29a-6f7dc6df9d6d"]
      included_groups = ["0a35341e-0bb0-4543-947a-895321a89ffa", "e58be873-ebfe-45a4-9df6-3d6aa2297045", "16296eec-82cd-4bde-8a8b-8c5f20654f4f", "01612534-e20d-4e1c-878d-2d2b8aa1585a", "870b0628-c1dd-4866-ad68-4bcb61396306", "07bc2e54-dc6b-42f1-9774-c90327e2d91f", "1b4de305-21ad-4b40-a1c6-9b606bfe756a"]
      included_roles  = []
      included_users  = []
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["mfa"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################

resource "azuread_conditional_access_policy" "ca_prod_block_drift_iocs_and_spray_attack_ips_20250830_global" {
  display_name = "CA-Prod-BLOCK-Drift IOCs and Spray Attack IPs 20250830 [Global]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    locations {
      excluded_locations = []
      included_locations = ["0442adf4-5d4d-4969-9940-ceda0cfa9497"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = ["a1d429ae-c041-4c54-beeb-2c9cd49ddac0", "b00317a0-a5e9-4ff6-8fbd-bf69dcdd96d2"]
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################

resource "azuread_conditional_access_policy" "ca_prod_block_access_from_blacklisted_countries_global" {
  display_name = "CA-Prod-BLOCK-Access from Blacklisted Countries [Global] "
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["All"]
      # included_user_actions = []
    }
    locations {
      excluded_locations = []
      included_locations = ["12fb7025-d992-4ad1-8f1c-dfb28e64d982"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = ["b00317a0-a5e9-4ff6-8fbd-bf69dcdd96d2", "dc508126-061f-45f5-946e-9ad2c14d30f2", "e75acc08-8d27-4c11-ab2f-d095f76e0fbd"]
      included_groups = []
      included_roles  = []
      included_users  = ["All"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["block"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################

resource "azuread_conditional_access_policy" "ca_pilot_grant_require_app_protection_policy_for_mobile_o365_ios_android" {
  display_name = "CA-Pilot-GRANT-Require app protection policy for mobile [O365] [iOS] [Android]"
  state        = "enabled"
  conditions {
    client_app_types              = ["all"]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []
    applications {
      excluded_applications = []
      included_applications = ["Office365"]
      # included_user_actions = []
    }
    platforms {
      excluded_platforms = []
      included_platforms = ["android", "iOS"]
    }
    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = []
      included_users  = ["46715e5a-e742-41be-b742-56b89fe1df26"]
    }
  }
  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls                 = ["compliantApplication"]
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###################
