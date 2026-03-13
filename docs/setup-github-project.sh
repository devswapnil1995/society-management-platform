#!/bin/bash

REPO="devswapnil1995/society-management-platform"

echo "Setting up GitHub Project..."

############################
# CREATE LABELS
############################

echo "Creating labels..."

gh label create backend --repo $REPO --color 1d76db --description "Backend work" || true
gh label create frontend --repo $REPO --color 0e8a16 --description "Frontend work" || true
gh label create database --repo $REPO --color 5319e7 --description "Database work" || true
gh label create devops --repo $REPO --color fbca04 --description "Infrastructure & CI/CD" || true
gh label create auth --repo $REPO --color d93f0b --description "Authentication module" || true
gh label create tenant --repo $REPO --color c5def5 --description "Multi-tenant system" || true
gh label create society --repo $REPO --color 0052cc --description "Society management" || true
gh label create residents --repo $REPO --color 1abc9c --description "Resident module" || true
gh label create billing --repo $REPO --color f9d0c4 --description "Maintenance billing" || true
gh label create payments --repo $REPO --color ff9f1c --description "Payments integration" || true
gh label create complaints --repo $REPO --color e99695 --description "Complaint module" || true
gh label create visitors --repo $REPO --color 84b6eb --description "Visitor management" || true
gh label create booking --repo $REPO --color 0b7285 --description "Facility booking" || true
gh label create communication --repo $REPO --color bfdadc --description "Announcements & notifications" || true
gh label create accounting --repo $REPO --color 6f42c1 --description "Accounting module" || true
gh label create documents --repo $REPO --color c2e0c6 --description "Document management" || true
gh label create analytics --repo $REPO --color fef2c0 --description "Analytics & reporting" || true
gh label create security --repo $REPO --color b60205 --description "Security improvements" || true
gh label create performance --repo $REPO --color 5319e7 --description "Performance optimization" || true

############################
# CREATE MILESTONES
############################

echo "Creating milestones..."

gh api repos/$REPO/milestones -f title="Phase 0 - Platform Setup" || true
gh api repos/$REPO/milestones -f title="Phase 1 - SaaS Core" || true
gh api repos/$REPO/milestones -f title="Phase 2 - Society Management" || true
gh api repos/$REPO/milestones -f title="Phase 3 - Resident Management" || true
gh api repos/$REPO/milestones -f title="Phase 4 - Maintenance Billing" || true
gh api repos/$REPO/milestones -f title="Phase 5 - Complaints & Visitors" || true
gh api repos/$REPO/milestones -f title="Phase 6 - Communication & Booking" || true
gh api repos/$REPO/milestones -f title="Phase 7 - Accounting & Documents" || true
gh api repos/$REPO/milestones -f title="Phase 8 - Analytics" || true
gh api repos/$REPO/milestones -f title="Phase 9 - Optimization" || true

############################
# CREATE ISSUES
############################

echo "Creating issues..."

gh issue create \
--repo $REPO \
--title "Setup .NET 10 Clean Architecture Solution" \
--body "Create backend solution with Api, Application, Domain, Infrastructure projects." \
--label backend --label devops \
--milestone "Phase 0 - Platform Setup"

gh issue create \
--repo $REPO \
--title "Configure PostgreSQL Database" \
--body "Install PostgreSQL and configure EF Core connection with migrations." \
--label backend --label database \
--milestone "Phase 0 - Platform Setup"

gh issue create \
--repo $REPO \
--title "Setup Angular 21 Nx Workspace" \
--body "Create Nx monorepo with resident portal, admin portal and security app." \
--label frontend \
--milestone "Phase 0 - Platform Setup"

gh issue create \
--repo $REPO \
--title "Setup Angular Material and Tailwind" \
--body "Configure UI libraries and global theme." \
--label frontend \
--milestone "Phase 0 - Platform Setup"

gh issue create \
--repo $REPO \
--title "Setup Docker Compose Environment" \
--body "Create docker-compose setup for backend, frontend, postgres and redis." \
--label devops \
--milestone "Phase 0 - Platform Setup"

gh issue create \
--repo $REPO \
--title "Setup CI/CD Pipeline" \
--body "Create GitHub Actions pipeline for build, test and deployment." \
--label devops \
--milestone "Phase 0 - Platform Setup"

############################
# SAAS CORE
############################

gh issue create \
--repo $REPO \
--title "Implement Tenant (Society) Model" \
--body "Create Tenant entity and middleware for tenant isolation." \
--label backend --label tenant \
--milestone "Phase 1 - SaaS Core"

gh issue create \
--repo $REPO \
--title "Create Subscription Plan System" \
--body "Create SubscriptionPlans entity and logic for SaaS plans." \
--label backend \
--milestone "Phase 1 - SaaS Core"

gh issue create \
--repo $REPO \
--title "Implement Authentication (JWT)" \
--body "Implement login, register and token refresh APIs." \
--label backend --label auth \
--milestone "Phase 1 - SaaS Core"

############################
# SOCIETY MANAGEMENT
############################

gh issue create \
--repo $REPO \
--title "Create Society APIs" \
--body "Implement CRUD APIs for societies." \
--label backend --label society \
--milestone "Phase 2 - Society Management"

gh issue create \
--repo $REPO \
--title "Implement Buildings Management" \
--body "Create building entity and APIs." \
--label backend --label society \
--milestone "Phase 2 - Society Management"

gh issue create \
--repo $REPO \
--title "Implement Flats Management" \
--body "Create flat entity and APIs." \
--label backend --label society \
--milestone "Phase 2 - Society Management"

############################
# RESIDENT MANAGEMENT
############################

gh issue create \
--repo $REPO \
--title "Create Resident Entity and APIs" \
--body "Implement resident management APIs." \
--label backend --label residents \
--milestone "Phase 3 - Resident Management"

############################
# BILLING
############################

gh issue create \
--repo $REPO \
--title "Implement Maintenance Billing System" \
--body "Generate monthly maintenance bills." \
--label backend --label billing \
--milestone "Phase 4 - Maintenance Billing"

gh issue create \
--repo $REPO \
--title "Integrate Razorpay Payment Gateway" \
--body "Allow residents to pay maintenance online." \
--label backend --label payments \
--milestone "Phase 4 - Maintenance Billing"

############################
# COMPLAINTS & VISITORS
############################

gh issue create \
--repo $REPO \
--title "Implement Complaint Management System" \
--body "Create complaint entity APIs and workflows." \
--label backend --label complaints \
--milestone "Phase 5 - Complaints & Visitors"

gh issue create \
--repo $REPO \
--title "Implement Visitor Entry System" \
--body "Create visitor check-in and check-out APIs." \
--label backend --label visitors \
--milestone "Phase 5 - Complaints & Visitors"

############################
# COMMUNICATION
############################

gh issue create \
--repo $REPO \
--title "Implement Announcement Module" \
--body "Allow admin to send announcements to residents." \
--label backend --label communication \
--milestone "Phase 6 - Communication & Booking"

############################
# ACCOUNTING
############################

gh issue create \
--repo $REPO \
--title "Implement Expense Tracking Module" \
--body "Create accounting APIs for expenses." \
--label backend --label accounting \
--milestone "Phase 7 - Accounting & Documents"

############################
# ANALYTICS
############################

gh issue create \
--repo $REPO \
--title "Create Analytics Dashboard APIs" \
--body "Create APIs for analytics and reports." \
--label backend --label analytics \
--milestone "Phase 8 - Analytics"

############################
# OPTIMIZATION
############################

gh issue create \
--repo $REPO \
--title "Optimize API Performance" \
--body "Add caching and query optimization." \
--label backend --label performance \
--milestone "Phase 9 - Optimization"

gh issue create \
--repo $REPO \
--title "Security Hardening" \
--body "Add rate limiting, headers and vulnerability scans." \
--label backend --label security \
--milestone "Phase 9 - Optimization"

echo "GitHub Project Setup Completed!"