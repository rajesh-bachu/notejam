*************************************************
Nordcloud Assignment: Migration of Notejam to AWS
*************************************************

| docker-compose version: 1.6
| docker-image for terraform: hashicorp/terraform:0.12.21
| docker-image for build and push: docker:19.03.5 (docker in docker)


===========
Description
===========
In this assignment Notejam application has been migrated to Amazon Web Services by utilizing container and serverless technologies which is highly available, highly scalable, easy to replicate to multiple regions, fault tolarant.

==========================
Rejoinder for Requirements
==========================

The Application must serve variable amount of traffic. Most users are active during business hours. During big events and conferences the traffic could be 4 times more than typical.
    Reply: Scaling policies has been enabled in ECS Service defination in a way that the application is up and running all the time, and application scales when the load increases.
    
The Customer takes guarantee to preserve your notes up to 3 years and recover it if needed.
    Reply: The storage of Notes is migrated to RDS PostgreSQL with backups enabled so that the storage is isolated and is preserved until the RDS is explicitly deleted.

The Customer ensures continuity in service in case of datacenter failures.
    Reply: The proposed solution is deployed across Availability zones such that even if a data center fails, the traffic would be routed to another AZ.

The Service must be capable of being migrated to any regions supported by the cloud provider in case of emergency.
    Migration of the application to another region is very easy by just updating region parameter in deploy/main.tf file

The Customer is planning to have more than 100 developers to work in this project who want to roll out multiple deployments a day without interruption / downtime.
    CI-CD pipeline has been implemented such that Developers can commit their code to the repository and all the tests and deployments for new features would happen on the fly.
    The same pipeline can be used for multiple environments just by changing terraform workspace.

The Customer wants to see relevant metrics and logs from the infrastructure for quality assurance and security purposes.
    CloudWatch is enabled for almost all the services by default. Monitoring has been enabled explicitly for ECS tasks.


==========================
Installation and launching
==========================

-----
Clone
-----

Clone the repo:

.. code-block:: bash

    $ git clone https://gitlab.com/rajesh68/notejam.git YOUR_PROJECT_DIR/

---------------------------------------
Setup Environmental variables in GitLab
---------------------------------------
Visit deploy/docker-compose.yml for reference

.. code-block:: bash

    $ AWS_ACCESS_KEY_ID
    $ AWS_SECRET_ACCESS_KEY
    $ ECR_REPO



------
Pipeline Stages
------
  - Validate Terraform
  - Build and Push
  - Staging Plan
  - Staging Apply
  - Production Plan
  - Production Apply
  - Destroy


