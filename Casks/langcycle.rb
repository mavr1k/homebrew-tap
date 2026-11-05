cask "langcycle" do
  version "1.1.2"
  sha256 "8c26daf3e55dd6c785c7ddd359031e355d1e131c5dc2edba50e9d3af57375c65"

  url "https://github.com/mavr1k/LangCycle/releases/download/v#{version}/LangCycle-#{version}.zip"
  name "LangCycle"
  desc "Cycle keyboard layouts in a fixed order, with a large on-screen indicator"
  homepage "https://mavr1k.github.io/LangCycle/"

  depends_on macos: :ventura

  app "LangCycle.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/LangCycle.app"],
        must_succeed: false
  end

  zap trash: "~/Library/Preferences/com.local.langcycle.plist"
end
