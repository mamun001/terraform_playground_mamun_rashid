provider "google" {
  credentials = file("junk.json")
  project     = "youtube-demo-3-367300"
  region      = "us-central1"
}

# Create new storage bucket in the US
# location with Standard Storage



