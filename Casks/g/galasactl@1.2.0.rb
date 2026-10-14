#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@1.2.0" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "06e599e5ee584d8f543131e55c0720dc5ab694df39d83898b4275a49ab1ed402",
         intel: "3e3b1df84b283ef7ade8f623aa03201bcf7082426a59936dc532ca0c7f559413"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 1.2.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
