class HaBackupTool < Formula
  desc "Tool for work with Home Assistant Backup"
  homepage "https://github.com/librun/ha-backup-tool"
  url "https://github.com/librun/ha-backup-tool/archive/refs/tags/v1.4.4.tar.gz"
  sha256 "a11ccb74921e354cfe4064bf4046f068d9c3508b3950c4a264c152acbf4d1dda"
  license "MIT"
  head "https://github.com/librun/ha-backup-tool.git", branch: "master"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0f01f097b3c7f458e5d8503b2842d386bc1e08c8c845c3b865d097aecc4cc1df"
  end

  depends_on "go" => :build

  def install
    ldflags = %w[
      -s -w
    ]
    tags = %w[extended withdeploy]
    system "go", "build", *std_go_args(ldflags:, tags:)

    generate_completions_from_executable(bin/"ha-backup-tool", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    system bin/"ha-backup-tool", "--version"
  end
end

