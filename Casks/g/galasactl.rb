#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "eb1e93acf9f860834cce7a09613d51a146902335d33e139d548a6e0d1674f570",
         intel: "ed2f2b045a298b898cc422d8074350f58eb9c8180e5f69f7214b7b5674256c7f"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Latest version"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
