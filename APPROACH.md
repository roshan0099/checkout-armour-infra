# Problem Understanding

Deploy a cloud-native Flask app using infrastructure automation (Terraform) and continuous deployment (GitHub Actions).

## Approach

- Defined modular Terraform configs for VPC, VM, CloudSQL instance group and LB.

- Built Docker image for app portability.

- Created Artifact Registry for storing container images.

- Set up GitHub Actions for automated test, build, push and deploy on every commit.

- Verified application health via LB and /health endpoint.

## Architectural Decision Highlights


| Decision | Reason |
|---|---|
| GCP | Better familiarity and had to do it quick (can be done on AWS as well) |
| Terraform| Used to provision the whole Infra in a single click |
| Github Action | Faster build pipeline along with the repo with minimal config|
|Docker| Contenarise Application for the ease of deployment|
|Load Balancer| For Scalabiltly|
|Secret Manager| Used to store sensitive info used in the app|
|Github Secrets|Used tpo store cred required for the pipeline|
|Cloudfare| Used as a proxy for ssl and avoid DDOS|


