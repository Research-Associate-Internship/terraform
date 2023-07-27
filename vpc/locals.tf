locals {
    tags = merge(
        {
            "Name" = "nex-ue1-dev-vpc"
            "Department" = "DevSecOps Associate"
            "project"    = "interns"
            "Creation"   = "terraform"
            "kubernetes.io/role/internal-elb" = "1"
            "kubernetes.io/role/elb" = "1"
            "kubernetes.io/cluster/NextGenDS-cluster"  = "owned"
        }
    )
}