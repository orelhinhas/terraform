resource "null_resource" "main" {
	depends_on = ["${var.depends_on}"]
	provisioner "local-exec" {
		command = "python3 /opt/tools/azure-python-scripts/provision-recovery-services-vault.py --client-id ${var.cli_id} --client-secret ${var.cli_secret} --tenant-id ${var.ten_id} --subscription-id ${var.subs_id} --resource-group-name ${var.rg_name} --vault-name ${var.vault_name} >> backup.log" 
	}
}
