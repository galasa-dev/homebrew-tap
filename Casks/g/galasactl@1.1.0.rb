#
# Copyright contributors to the Galasa project
#
# SPDX-License-Identifier: EPL-2.0
#

cask "galasactl@1.1.0" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.0"
  # Create the sha256 using shasum --algorithm 256 <file>
  sha256 arm:   "f3a0f5185f97df250b250ae039610704c42a8aad4799a1a24a63aeb4e9ab7d8f",
         intel: "94d2dbfd6c5432a6e1d6da4a59716d53da903444afff93529f04e34dfdc7af0b"

  url "https://github.com/galasa-dev/galasa/releases/download/v#{version}/galasactl-darwin-#{arch}",
      verified: "github.com/galasa-dev/galasa/releases/"
  name "Galasa Client"
  desc "Client to launch Galasa tests on a Galasa service or locally. Version 1.1.0"
  homepage "https://galasa.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "galasactl-darwin-#{arch}", target: "galasactl"
end
