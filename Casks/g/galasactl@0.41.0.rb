#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@0.41.0" do
  arch arm: "arm64", intel: "x86_64"

  version "0.41.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "0b85263e1811ecfdb81de2af5094c685c43a4f1aafb27db65d2edcfd935e22ac",
         intel: "59e4d2c113db9d2c64742ab5d01c706f81bb734a07cb1b6fb875d5ab829005d4"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 0.41.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
