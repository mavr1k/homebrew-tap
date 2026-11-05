cask "langcycle" do
  version "1.0"
  sha256 "703e105c8c861878206aea6d3df726a47874e0ae2d04efc8d907bb4b433b57bb"

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
