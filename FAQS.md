# Frequently Asked Questions
**Q: How do I setup "Vanity URLs"?**

**A:** Once the IaC code has been deployed use the LoadBalancer's IP address and register it against your domain with your Domain Names Service provider.

---
**Q: How do I update the HTTPS certificate?**

**A:** The infrastructure will be deployed with a self-signed certificate which will result in an warning message when visiting the APEX Application.  A valid certificate, registered against the "Vanity URL", should be applied to the Load Balancer resource before Productionisation.  Details can be found in the [SSL Certificate Management Documenation](https://docs.oracle.com/en-us/iaas/Content/Balance/Tasks/managingcertificates.htm).  Note that LetsEncrypt/CertBot can be used to manage the Load Balancer certificate as per the below Q/A.

--- 
**Q: Can I use LetsEncrypt/CertBot for LoadBalancer Certificate Management?**

**A:** Yes; code and instructions on how can be found in the [oci-lbaas-letsencrypt repository](https://github.com/ukjola/oci-lbaas-letsencrypt)

---
**Q: How do I access the APEX Admin Page?**

**A:** Where yourDomain is the IP Address of the Load Balancer, or the Domain Name after DNS updates:

* Administration Services: https://yourDomain/ords/apex_admin
* Workspace Login:         https://yourDomain/ords/f?p=4550

---
**Q: How do I access the database for development purposes?**

**A:** There are a few ways:

_**Quick Note about Security**_ For Production use, consider IP restricting or blocking both the APEX Workspace and SQL Developer Web methods from public access.  This would be done at the Load Balancer and/or a Web Application Firewall level.  To completely block access, review the "Q" below in regards to blocking APEX/ADB Administration Services.

_<ins>APEX SQL Workshop</ins>_

After creating and logging into an APEX Workspace; the "[SQL Workshop](https://apex.oracle.com/en/learn/getting-started/sql-workshop/)" can be used within APEX itself to create, view, and maintain your database objects.

_<ins> SQL Developer Web</ins>_

A web based version of SQL Developer (SDW) is accessible by the ADMIN user after deployment at: `https://<loadbalancer_ip>/ords/sql-developer`.  To enable your Workspace Schema access:
1. Log into the SQL Developer Web as ADMIN
2. Under Administration; Click "Database Users"
3. Find the Workspace Schema and click the "three-dots" next to the name
4. REST Enable User (Require Authentication)
5. Access SDW as the Workspace User at: `https://<loadbalancer_ip>/ords/<workspace_user>/_sdw/`

_<ins>External Tools (i.e. SQLDeveloper Client, Toad, etc.) via Bastion</ins>_

The OCI Bastion Service can be used to tunnel connections from a desktop client to the Autonomous Database.  There is a great [Blog](https://blogs.oracle.com/cloudsecurity/post/qt-6-connecting-autonomous-database-using-oci-bastion) post outlining the process.  The steps for the 443 port can be ignored as it is being exposed by the Load Balancer.

---
**Q: How do I restrict web access to APEX and Admin Tools?**

**A:** There is a great blog post addressing this question: [Blocking APEX Developer and Administrator Tools](https://blogs.oracle.com/apex/post/adb-vanity-urls-part-2-blocking-tools).

With the exception of the REDIRECT to the default APEX application, the other Load Balancer Rule Sets to block access are part of this IaC.  To enable them, change vars.tf (set false to true):
```
// Block APEX/ORDS Dev and Admin Tools 
variable "enable_lbaas_ruleset" {
  default = "true"
}
```
