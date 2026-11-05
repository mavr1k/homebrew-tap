cask "langcycle" do
  version "1.1"
  sha256 "2144d1e414d05d33341aa9418a57ccc57eee170bcbcccca6933b6d9f672460c0"

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
