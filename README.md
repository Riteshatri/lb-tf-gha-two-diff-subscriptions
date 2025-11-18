# 🏗️ Terraform Azure Modular Infrastructure (with for_each)

A production-ready **Infrastructure as Code (IaC)** project using **Terraform** to deploy a complete **modular Azure environment**.  
Built with **for_each** to dynamically create resources like **Resource Groups, VNets, NSGs, NICs, VMs, Bastion, SQL Server, Databases, and Load Balancers**.  
Perfect for **DevOps learners** and **cloud engineers** who want to master **modular Terraform + Azure**.

---

## 🔧 Choose Your Setup Path

Depending on how you want to run Terraform, pick one of the two options:

### 🖥️ Option A: **Local Machine (Developer Laptop/PC)**

- Write and run Terraform from your laptop.  
- Push state to Azure Storage backend.  

👉 Go to: [📂 Local Setup](#local-setup)

---

### ☁️ Option B: **Azure DevOps / CI/CD Pipeline**

- Automate provisioning using Azure DevOps Pipelines or GitHub Actions.  
- Store state securely in Azure Blob Storage.  

👉 Go to: [🚀 CI/CD Setup](#cicd-setup)

---

## 📂 Project Structure



```
infra/
├── main.tf               # Root module - calls all child modules
├── variables.tf          # Input variable definitions
├── terraform.tfvars      # Values for input variables
├── provider.tf           # Provider + remote backend config
├── output.tf             # Exported outputs
└── modules/              # Child modules for infra components
    ├── resourceGroup/
    │   └── azurerm_resource_group
    ├── networking/
    │   ├── azurerm_virtual_network
    │   ├── azurerm_nsg
    │   ├── azurerm_nic
    │   ├── azurerm_pip
    │   ├── azurerm_bastion
    │   └── azurerm_nic_nsg_assoc
    ├── virtual_machine/
    ├── database/
    │   ├── azurerm_mssql_server
    │   ├── azurerm_mssql_database
    │   └── azurerm_mssql_firewall_rule
    └── loadBalancer/
        ├── azurerm_lb
        ├── azurerm_backend_address_pool
        ├── azurerm_lb_probe
        ├── azurerm_lb_rule
        └── azurerm_nic_bp_association
```


## ⚙️ Prerequisites

- ✅ [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.6+  
- ✅ [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) (`az login`)  
- ✅ Azure Storage Account + Container for remote state  

---

##  Local Setup

### Step 1: Clone Repo

```bash
git clone https://github.com/<your-username>/terraform-azure-modular-infra.git
cd terraform-azure-modular-infra/infra

```
### Step 2: Initialize Terraform
terraform init

### Step 3: Validate & Plan
terraform validate
terraform plan

### Step 4: Apply Infrastructure
terraform apply -auto-approve

### Step 5: Destroy When Not Needed
terraform destroy -auto-approve

##  CI/CD Setup

Store backend credentials (Storage Account, Container, Key) in Azure DevOps/GitHub Secrets.

Create pipeline with Terraform tasks:

- init
- validate
- plan
- apply

Approve deployments for prod environments.

---

# 🔐 Security Notes

Do not push terraform.tfvars with passwords to GitHub.

# .gitignore

# Local Terraform files
*.tfstate

 `*.tfstate.*`

# Terraform working directory
.terraform/

# Lock files
*.lock.hcl

# Sensitive variable files
terraform.tfvars

---

# 📤 Outputs

- Resource Group names & IDs
- Virtual Network & Subnet IDs
- NIC IDs & IPs
- Load Balancer Probe IDs
- SQL Database IDs

---

# 📃 License

This project is licensed under the **MIT License**. Free to use with attribution.

---

# 👨‍💻 Author

**Ritesh Sharma**  
🔗 [LinkedIn](https://www.linkedin.com/in/riteshatri)