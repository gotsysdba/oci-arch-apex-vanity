# Frequently Asked Questions
**Q: How do I setup "Vanity URLs"**

**A:** Once the IaC code has been deployed use the LoadBalancer's IP address and register it against your domain with your Domain Names Service provider.

---
**Q: How do I update the HTTPS certificate**

**A:** The infrastructure will be deployed with a self-signed certificate which will result in an warning message when visiting the APEX Application.  A valid certificate, registered against the "Vanity URL", should be applied to the Load Balancer resource before Productionisation.  Details can be found in the [SSL Certificate Management Documenation](https://docs.oracle.com/en-us/iaas/Content/Balance/Tasks/managingcertificates.htm).  Note that LetsEncrypt/CertBot can be used to manage the Load Balancer certificate as per the below Q/A.

--- 
**Q: Can I use LetsEncrypt/CertBot for LoadBalancer Certificate Management?**

**A:** Yes; code and instructions on how can be found in the [oci-lbaas-letsencrypt repository](https://github.com/ukjola/oci-lbaas-letsencrypt)

---
**Q: How do I access the APEX Admin Page**

**A:** Where yourDomain is the IP Address of the Load Balancer, or the Domain Name after DNS updates:

* Administration Services: https://yourDomain/ords/apex_admin
* Workspace Login:         https://yourDomain/ords/f?p=4550

