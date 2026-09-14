#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@1.1.1" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.1"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "7059f60ebb201278fbbe707014c9df9651bbf33297cf6e3cadbdf8c91766a3a2",
         intel: "bee933b79cac400fbf2a71fdf405e865607d1668ebd468c6523973ad8679da11"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 1.1.1"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
