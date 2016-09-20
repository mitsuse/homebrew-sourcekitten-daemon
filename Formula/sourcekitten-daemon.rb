class SourcekittenDaemon < Formula
  desc "Swift Auto Completions for any Text Editor"
  homepage "https://github.com/terhechte/SourceKittenDaemon"
  url "https://github.com/terhechte/SourceKittenDaemon.git",
    :tag => "0.1.5",
    :revision => "2a8eef4e376daadf17c3e5c6eb346579be6c132a",
    :shallow => false
  head "https://github.com/terhechte/SourceKittenDaemon.git"

  depends_on :xcode => ["7.3", :build]
  depends_on "carthage" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    command = "#{bin}/sourcekittendaemon start 2>&1"
    expectation = "Please provide a project"
    assert_match expectation, shell_output(command, 1)
  end
end
