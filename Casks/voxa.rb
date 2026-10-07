cask "voxa" do
  version "0.1.11"
  sha256 "fd1e7de6b9e8397bef4049054e7e23bb60736a9a02c0562273315ec588e284fe"

  url "https://github.com/ArnavBallinCode/voxa/releases/download/v#{version}/Voxa_#{version}_aarch64.dmg"
  name "Voxa"
  desc "On-device AI meeting and interpretation console (VoxBento Local)"
  homepage "https://voxbento.org/local"

  auto_updates false
  depends_on macos: :sonoma

  app "Voxa.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Voxa.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.arnav.voxa",
    "~/Library/Caches/com.arnav.voxa",
    "~/Library/Preferences/com.arnav.voxa.plist",
    "~/Library/Saved Application State/com.arnav.voxa.savedState",
  ]
end
