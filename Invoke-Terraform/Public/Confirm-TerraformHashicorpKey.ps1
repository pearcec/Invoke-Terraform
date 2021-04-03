Function Confirm-TerraformHashicorpKey {
    & gpg --sign-key (Get-TerraformPreference).HashiCorpPGPKeyId
}