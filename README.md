## 🎬 Watch Me Build This Lab!

# Lab 01 — Hosting Your First Static Website in Azure

---

## Overview

In this lab you'll deploy a public-facing static website using **Azure Blob Storage** — no web server required. This is your introduction to PaaS (Platform as a Service) and serverless hosting: you supply the content, Azure manages the infrastructure.

---

## Architecture

```
User (Browser)
     │
     │  HTTPS
     ▼
Public Primary Endpoint
(https://stlab01[yourname].z13.web.core.windows.net)
     │
     │  Routes to
     ▼
┌─────────────────────────────────────────┐
│       Azure Storage Account             │
│       (stlab01[yourname])               │
│                                         │
│   ┌─────────────────────────────────┐   │
│   │       $web Container            │   │
│   │   Static Website Hosting: ON    │   │
│   │                                 │   │
│   │   📄 index.html                 │   │
│   │   📄 404.html                   │   │
│   └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

**Key insight:** There are no virtual machines, no web servers, and no app runtimes involved. Azure Blob Storage serves your HTML file directly to the internet via a built-in static website endpoint.

---

## Prerequisites

- [ ] Active Azure Subscription (Free Tier works fine)
- [ ] Completed Week 1 Video Modules
- [ ] A text editor (Notepad, TextEdit, or VS Code)

---

## Naming Conventions

Use these exact values throughout the lab to stay consistent.

| Resource | Value |
|---|---|
| Resource Group | `rg-lab01-[yourname]` |
| Storage Account | `stlab01[yourname]` |
| Region | East US |

> **Note:** Storage account names must be globally unique, all lowercase, and contain only letters and numbers — no hyphens or special characters.

---

## Step-by-Step Instructions

### Phase 1 — Create the Resource Group

1. Log in to the [Azure Portal](https://portal.azure.com).
2. Search for **Resource Groups** in the top search bar and click **+ Create**.
3. Fill in the **Basics** tab:
   - **Subscription:** Select your subscription.
   - **Resource group:** `rg-lab01-[yourname]`
   - **Region:** `(US) East US`
4. Click **Review + create** → **Create**.

---

### Phase 2 — Create the Storage Account

1. Search for **Storage accounts** in the search bar and click **+ Create**.
2. Fill in the **Basics** tab:
   - **Resource group:** `rg-lab01-[yourname]`
   - **Storage account name:** `stlab01[yourname]` *(e.g., `stlab01jhante`)*
   - **Region:** `(US) East US`
   - **Performance:** Standard
   - **Redundancy:** Locally-redundant storage (LRS)
3. Click **Review + create**. Wait for validation, then click **Create**.
4. Once deployment completes (~30 seconds), click **Go to resource**.

---

### Phase 3 — Enable Static Website Hosting

1. In the left-hand menu of your Storage Account, scroll to the **Data management** section.
2. Click **Static website**.
3. Toggle the switch from **Disabled** to **Enabled**.
4. Set the following values:
   - **Index document name:** `index.html`
   - **Error document path:** `404.html` *(optional but recommended)*
5. Click **Save**.

> ✅ **Important:** After saving, a **Primary endpoint** URL will appear (e.g., `https://stlab01jhante.z13.web.core.windows.net/`). **Copy this URL** — it is your website's public address.

---

### Phase 4 — Create the Website File

Open your text editor and paste the following HTML:

```html
<!DOCTYPE html>
<html>
<head>
    <title>My First Cloud Site</title>
    <style>
        body { font-family: sans-serif; text-align: center; margin-top: 50px; background-color: #f0f0f0; }
        h1 { color: #0078d4; }
    </style>
</head>
<body>
    <h1>Hello from the Cloud!</h1>
    <p>This site is hosted on Azure Blob Storage.</p>
    <p>Deployed by: [Your Name]</p>
</body>
</html>
```

Save the file to your Desktop as **`index.html`**.

---

### Phase 5 — Upload Content to Azure

1. Return to the Azure Portal on your Storage Account.
2. In the left menu, click **Containers** (under **Data storage**).
3. Open the **`$web`** container — this was created automatically when you enabled static hosting.
4. Click **Upload** at the top.
5. Browse for your `index.html` file and click **Upload**.

---

### Phase 6 — Validate the Deployment

1. Open a new browser tab.
2. Paste the **Primary endpoint URL** you saved in Phase 3.
3. Press Enter.

You should see the **"Hello from the Cloud!"** page. Congratulations — you've deployed a serverless website on Azure. 🎉

---

## Troubleshooting

| Symptom | Likely Cause | Fix |
|---|---|---|
| `404 - The requested content does not exist.` | Filename mismatch | Ensure the file is named exactly `index.html` (case-sensitive). `Index.html` or `index.txt` will not resolve. |
| `404` after correct upload | Wrong container | Confirm the file was uploaded to `$web`, not a different container. |
| `Storage account name is already taken` | Name collision | Storage names are globally unique across all of Azure. Append numbers to your name (e.g., `stlab01jhante99`). |

---

## Clean Up

> Always delete lab resources when you're done to avoid unnecessary charges.

1. Go to **Resource Groups** in the Azure Portal.
2. Click `rg-lab01-[yourname]`.
3. Click **Delete resource group**.
4. Type the resource group name to confirm.
5. Click **Delete**.

---

## What You Learned

- How to create an **Azure Resource Group** and **Storage Account** via the portal.
- How to enable **Static Website Hosting** on Azure Blob Storage.
- How Azure automatically provisions the **`$web` container** as the origin for your static site.
- The difference between traditional server hosting and **serverless/PaaS delivery**.

---

## Related Labs

| Lab | Topic |
|---|---|
| Lab 02 | *(Coming soon)* |

---

*Part of the Azure Cloud Foundations lab series.*
