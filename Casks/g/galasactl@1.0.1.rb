#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@1.0.1" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.1"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "bccaf5990b92a5867be472a5fc8253aa88106b1f875a54a2a103a30e752b1ef2",
         intel: "afe1dbe9282302bc52408243f0d5f9bce1a44968d80417e5187b14a6fd1e75c1"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 1.0.1"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
