# Terraform a Cloudflare domain for an ephemeral IP of a GCE instance

This repo contains a practical example on how to provision a Compute Engine VM in GCP and attaching a subdomain handled by Cloudflare to the VM's public IP. All automated and orchestrated by Terraform.

# Pre setup
Before begin, you need the following:
1. A [GCP project](https://cloud.google.com/resource-manager/docs/creating-managing-projects) with a linked billing account.
2. A service account of your project, with the proper permissions to create, modify and delete GCE instances.
3. Enable the Compute Engine API on GCP.
4. [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) installed.
5. Cloudflare's API Token and Zone ID.
6. Clone this repo

## Cloudflare API Token
You can create an API Token in Cloudflare, going to the "API Tokens" section in the "My Profile" page. You need permission to handle the DNS on the zone, at least.

The Zone ID could be found in the "Overview" section of your domain. Just in the bottom right part of the section.

## TF variables
First, rename the terraform.tfvars.copy file to terraform.tfvars. Then fill the variables:

```sh
cloud_flare_api_token = "<YOUR_CLOUDFLARE_API_TOKEN>"
cloudflare_zone_id = "<YOUR_CLOUDFLARE_DOMAIN_ZONE_ID>"
domain = "<YOUR_DOMAIN>"
project = "<GCP_PROJECT_ID>"
```

# Run the example
Placed on the root folder of the project, run

```sh
terraform init
```

to download all the needed plugins. Next, run

```sh
terraform apply
```

All is done, review your GCE instance on GCP and the just created record A on Cloudflare.