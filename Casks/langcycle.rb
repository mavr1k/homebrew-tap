cask "langcycle" do
  version "1.1.1"
  sha256 "ac3c7086c3db76bf9d0ab25c1dec2ad0bc66067a099afbefdc86fb7d438971bc"

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
