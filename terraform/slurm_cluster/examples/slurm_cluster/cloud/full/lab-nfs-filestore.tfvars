/**
 * Copyright (C) SchedMD LLC.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

###########
# GENERAL #
###########

project_id = "wayne-eda-demo-service"

slurm_cluster_name = "depa"

region = "asia-east1"

# *NOT* intended for production use
# enable_devel = true

enable_bigquery_load         = false
enable_cleanup_compute       = true
enable_cleanup_subscriptions = false
enable_reconfigure           = false

###########
# NETWORK #
###########

# @Wayne: Skip subnet creation
#subnets = [
#  {
#    subnet_ip     = "10.0.0.0/24"
#    subnet_region = "us-central1"
#  },
#]

mtu = 0

#################
# CONFIGURATION #
#################

# cloudsql = {
#   server_ip = "<SERVER_IP>:<PORT>"
#   user      = "<USERNAME>"
#   password  = "<PASSWORD>"
#   db_name   = "<DB_NAME>"
# }

# Network storage
network_storage = [
   {
     server_ip     = "192.168.250.2"
     remote_mount  = "/enttw/nfs-home"
     local_mount   = "/home"
     fs_type       = "nfs"
     mount_options = "hard,timeo=600,retrans=3,rsize=1048576,wsize=1048576,resvport,async"
   },
]
login_network_storage = [
   {
     server_ip     = "192.168.250.2"
     remote_mount  = "/enttw/nfs-shared"
     local_mount   = "/shared"
     fs_type       = "nfs"
     mount_options = "hard,timeo=600,retrans=3,rsize=1048576,wsize=1048576,resvport,async"
   },
]

# Slurm config
cgroup_conf_tpl   = null
slurm_conf_tpl    = null
slurmdbd_conf_tpl = null
cloud_parameters = {
  resume_rate     = 0
  resume_timeout  = 300
  suspend_rate    = 0
  suspend_timeout = 300
}

# scripts
controller_startup_scripts_timeout = 300
controller_startup_scripts = [
  #   {
  #     filename = "hello_controller.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
login_startup_scripts_timeout = 300
login_startup_scripts = [
  #   {
  #     filename = "hello_login.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
compute_startup_scripts_timeout = 300
compute_startup_scripts = [
  #   {
  #     filename = "hello_compute.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
prolog_scripts = [
  #   {
  #     filename = "hello_prolog.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]
epilog_scripts = [
  #   {
  #     filename = "hello_epilog.sh"
  #     content  = <<EOF
  # #!/bin/bash
  # set -ex
  # echo "Hello, $(hostname) from $(dirname $0) !"
  #     EOF
  #   },
]

##############
# CONTROLLER #
##############

controller_instance_config = {
  subnetwork_project = "way-eda-demo-host"
  subnetwork = "dep-a"
  service_account = {email: "hpcdemo-controller@wayne-eda-demo-service.iam.gserviceaccount.com", scopes: ["https://www.googleapis.com/auth/cloud-platform"]}
  # Template By Definition
  additional_disks = [
    # {
    #   disk_name    = null
    #   device_name  = null
    #   disk_size_gb = 128
    #   disk_type    = "pd-standard"
    #   disk_labels  = {}
    #   auto_delete  = true
    #   boot         = false
    # },
  ]
  can_ip_forward   = null
  disable_smt      = false
  disk_auto_delete = true
  disk_labels = {
    # label0 = "value0"
    # label1 = "value1"
  }
  disk_size_gb           = 32
  disk_type              = "pd-ssd"
  enable_confidential_vm = false
  enable_oslogin         = true
  enable_shielded_vm     = true
  gpu                    = null
  labels = {
    # label0 = "value0"
    # label1 = "value1"
  }
  machine_type = "n1-standard-4"
  metadata = {
    block-project-ssh-keys = "TRUE"
    # metadata0 = "value0"
    # metadata1 = "value1"
  }
  min_cpu_platform    = null
  on_host_maintenance = null
  preemptible         = false
  region              = null
  shielded_instance_config = {
    enable_integrity_monitoring = true
    enable_secure_boot          = true
    enable_vtpm                 = true
  }
  source_image_family  = "schedmd-v5-slurm-22-05-4-hpc-centos-7-1665675565"
  source_image_project = "projects/wayne-eda-demo-service/global/images"
  source_image         = null
  tags = [
    # "tag0",
    # "tag1",
  ]

  # Template By Source
  instance_template = null

  # Instance Definition
  access_config = [
    # {
    #   nat_ip       = "<NAT_IP>"
    #   network_tier = "STANDARD"
    # },
  ]
  network_ip = null
  static_ip  = null
  zone       = "asia-east1-a"
}

#########
# LOGIN #
#########

login_nodes = [
  {
    # Group Definition
    group_name = "l0"

    # Template By Definition
    additional_disks         = []
    can_ip_forward           = false
    disable_smt              = false
    disk_auto_delete         = true
    disk_labels              = {}
    disk_size_gb             = 32
    disk_type                = "pd-standard"
    enable_confidential_vm   = false
    enable_oslogin           = true
    enable_shielded_vm       = true
    gpu                      = null
    labels                   = {}
    machine_type             = "n1-standard-2"
    metadata                 = {
      block-project-ssh-keys = "TRUE"
    }
    min_cpu_platform         = null
    on_host_maintenance      = null
    preemptible              = false
    shielded_instance_config = {
       enable_integrity_monitoring = true
       enable_secure_boot          = true
       enable_vtpm                 = true
    }
    source_image_family  = "schedmd-v5-slurm-22-05-4-hpc-centos-7-1665675565"
    source_image_project = "projects/wayne-eda-demo-service/global/images"
    source_image             = null
    tags                     = []

    # Template By Source
    instance_template = null

    # Instance Definition
    access_config = []
    network_ips   = []
    num_instances = 1
    static_ips    = []
    region        = "asia-east1"
    zone          = "asia-east1-a"
    subnetwork_project = "way-eda-demo-host"
    subnetwork = "dep-a"
    service_account = {email: "hpcdemo-head@wayne-eda-demo-service.iam.gserviceaccount.com", scopes: ["https://www.googleapis.com/auth/cloud-platform"]}
  },
]

##############
# PARTITIONS #
##############

partitions = [
  {
    enable_job_exclusive    = false
    enable_placement_groups = false
    network_storage         = []
    partition_conf = {
      Default     = "YES"
      SuspendTime = 300
    }
    partition_startup_scripts_timeout = 300
    partition_startup_scripts = [
      # {
      #   filename = "hello_part_debug.sh"
      #   content  = <<EOF
      # #!/bin/bash
      # set -ex
      # echo "Hello, $(hostname) from $(dirname $0) !"
      #   EOF
      # },
    ]
    partition_name = "debug"
    partition_nodes = [
      {
        # Group Definition
        group_name             = "degug"
        service_account = {email: "hpcdemo-compute@wayne-eda-demo-service.iam.gserviceaccount.com", scopes: ["https://www.googleapis.com/auth/cloud-platform"]}
        node_count_dynamic_max = 20
        node_count_static      = 0
        node_conf = {
          Features = "test"
        }

        # Template By Definition
        additional_disks         = []
        can_ip_forward           = false
        disable_smt              = true
        disk_auto_delete         = true
        disk_labels              = {}
        disk_size_gb             = 32
        disk_type                = "pd-standard"
        enable_confidential_vm   = false
        enable_oslogin           = true
        enable_shielded_vm       = true
        gpu                      = null
        labels                   = {}
        machine_type             = "n2-standard-32"
        metadata                 = {
          block-project-ssh-keys = "TRUE"
        }
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = true
        shielded_instance_config = {
          enable_integrity_monitoring = true
          enable_secure_boot          = false
          enable_vtpm                 = true
    	}
        source_image_family  = "schedmd-v5-slurm-22-05-4-hpc-centos-7-1665675565"
        source_image_project = "projects/wayne-eda-demo-service/global/images"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        access_config = [
          # {
          #   network_tier = null
          # },
        ]
        bandwidth_tier = "tier_1_enabled"
        enable_spot_vm = true
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
    ]
    region             = "asia-east1"
    subnetwork_project = "way-eda-demo-host"
    subnetwork = "dep-a"
    zone_policy_allow = []
    zone_policy_deny  = []
  },
  {
    enable_job_exclusive    = false
    enable_placement_groups = false
    network_storage         = []
    partition_conf = {
      ResumeTimeout  = 300
      SuspendTimeout = 300
      SuspendTime    = 300
    }
    partition_startup_scripts_timeout = 300
    partition_startup_scripts         = []
    partition_name                    = "debug2"
    partition_nodes = [
      {
        # Group Definition
        group_name             = "debug2"
        service_account = {email: "hpcdemo-compute@wayne-eda-demo-service.iam.gserviceaccount.com", scopes: ["https://www.googleapis.com/auth/cloud-platform"]}
        node_count_dynamic_max = 10
        node_count_static      = 0
        node_conf              = {}

        # Template By Definition
        additional_disks       = []
        can_ip_forward         = false
        disable_smt            = false
        disk_auto_delete       = true
        disk_labels            = {}
        disk_size_gb           = 32
        disk_type              = "pd-standard"
        enable_confidential_vm = false
        enable_oslogin         = true
        enable_shielded_vm     = true
        gpu                    = null
        #gpu = {
        #  count = 1
        #  type  = "nvidia-tesla-v100"
        #}
        labels                   = {}
        machine_type             = "n2-standard-32"
        metadata                 = {
          block-project-ssh-keys = "TRUE"
        }
        min_cpu_platform         = null
        on_host_maintenance      = null
        preemptible              = true
        shielded_instance_config = {
          enable_integrity_monitoring = true
          enable_secure_boot          = false
          enable_vtpm                 = true
        }
        source_image_family  = "schedmd-v5-slurm-22-05-4-hpc-centos-7-1665675565"
        source_image_project = "projects/wayne-eda-demo-service/global/images"
        source_image             = null
        tags                     = []

        # Template By Source
        instance_template = null

        # Instance Definition
        access_config  = []
        bandwidth_tier = "tier_1_enabled"
        enable_spot_vm = true
        spot_instance_config = {
          termination_action = "STOP"
        }
      },
    ]
    region            = null
    zone_policy_allow = []
    zone_policy_deny  = []
    subnetwork_project = "way-eda-demo-host"
    subnetwork = "dep-a"
  },
]
