

#  Create Stackdriver Log-based metric
#    roundtrip time of a Kubernetes Application



resource "google_logging_metric" "gw_roundtrip" {
    description      = "Total roundtrip time it takes to fetch 1 gop from a hybrid gateway"
    filter           = "resource.type=\"${local.resource_type}\" resource.labels.project_id=\"${local.project}\" resource.labels.location=\"${local.zone}\" resource.labels.cluster_name=\"${local.cluster}\" resource.labels.namespace_name=\"${local.namespace}\" labels.k8s-pod/app=\"${local.app}\" labels.k8s-pod/cluster=\"${local.app}\" \"mbps\""
    label_extractors = {
        "channel_id"    = "EXTRACT(jsonPayload.data.channel)"
        "gateway_id"    = "EXTRACT(jsonPayload.data.gateway)"
        "location_type" = "EXTRACT(jsonPayload.data.locationType)"
        "org_id"        = "EXTRACT(jsonPayload.data.orgId)"
    }
    #name             = "test_gw_roundtrip"
    name             = "${local.env_prefix}gw_roundtrip"
    project          = local.project
    value_extractor  = "EXTRACT(jsonPayload.data.totalTime)"

    bucket_options {

        linear_buckets {
            num_finite_buckets = 200
            offset             = 0
            width              = 0
        }
    }

    metric_descriptor {
        metric_kind = "DELTA"
        value_type  = "DISTRIBUTION"

        labels {
            key        = "channel_id"
            value_type = "STRING"
        }
        labels {
            key        = "gateway_id"
            value_type = "STRING"
        }
        labels {
            key        = "location_type"
            value_type = "STRING"
        }
        labels {
            key        = "org_id"
            value_type = "STRING"
        }
    }

    timeouts {}
}
