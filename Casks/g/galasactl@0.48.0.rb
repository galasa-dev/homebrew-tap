#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.48.0" do
  arch arm: "arm64", intel: "x86_64"

  version "0.48.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "3e67548ae98072edfade0cd84950fe9524dae96a9b010f58138fd6da22cab651",
         intel: "82dfdabfa86d7b8fd7eaa1ba93ac46cb04f9cd43c4c9ad0e966e29133610a191"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.48.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
