cask "langcycle" do
  version "1.1.2"
  sha256 "8f32e8e144600c8d6bde571548cf1db8e8f356f4f4125d73d59aec82cf015112"

  url "https://github.com/mavr1k/LangCycle/releases/download/v#{version}/LangCycle-#{version}.zip"
  name "LangCycle"
  desc "Cycle keyboard layouts in a fixed order, with a large on-screen indicator"
  homepage "https://github.com/mavr1k/LangCycle"

  depends_on macos: :ventura

  app "LangCycle.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/LangCycle.app"],
        must_succeed: false
  end

  zap trash: "~/Library/Preferences/com.local.langcycle.plist"
end
