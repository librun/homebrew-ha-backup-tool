class HaBackupTool < Formula
  desc "Tool for work with Home Assistant Backup"
  homepage "https://github.com/librun/ha-backup-tool"
  url "https://github.com/librun/ha-backup-tool/archive/refs/tags/v1.4.4.tar.gz"
  sha256 "a11ccb74921e354cfe4064bf4046f068d9c3508b3950c4a264c152acbf4d1dda"
  license "MIT"

  # on_macos do
  #   if Hardware::CPU.arm?
  #     url "https://github.com/librun/ha-backup-tool/releases/latest/download/ha-backup-tool-darwin-arm64.tar.gz"
  #     sha256 "d711e9107bed674f23538f786d0fc333afa4f0478259c71a7cc7efb4eedd522d"
  #   end

  #   if Hardware::CPU.intel?
  #     url "https://github.com/librun/ha-backup-tool/releases/latest/download/ha-backup-tool-darwin-amd64.tar.gz"
  #     sha256 "35aaf8215ce92588e0d1703c18cf41b0697bb0099edbe5adf9595136de67a29d"
  #   end

  #   def install
  #     bin.install "ha-backup-tool"

  #     generate_completions_from_executable(bin/"ha-backup-tool", "completion", shells: [:bash, :zsh, :fish])
  #   end
  # end

  # on_linux do
  #   url "https://github.com/librun/ha-backup-tool/releases/latest/download/ha-backup-tool-linux-amd64.tar.gz"
  #   sha256 "6f794cf54e09c90cb9f1890066d6aa01e95c537af6240329dcc15a8bf718a046"

  #   def install
  #     bin.install "ha-backup-tool"

  #     generate_completions_from_executable(bin/"ha-backup-tool", "completion", shells: [:bash, :zsh, :fish])
  #   end
  # end


  bottle do
    root_url "https://github.com/librun/ha-backup-tool/releases/download/v1.4.4"
    sha256 cellar: :any_skip_relocation, arm64: "d711e9107bed674f23538f786d0fc333afa4f0478259c71a7cc7efb4eedd522d"
    sha256 cellar: :any_skip_relocation, x86_64: "35aaf8215ce92588e0d1703c18cf41b0697bb0099edbe5adf9595136de67a29d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f794cf54e09c90cb9f1890066d6aa01e95c537af6240329dcc15a8bf718a046"
    sha256 cellar: :any_skip_relocation, arm64_linux: "50e46939caa4abb274a5497200d82b24fb4d0b33b7899d6f598c12c7df2f9038"
  end

  def install
    bin.install "ha-backup-tool"

    generate_completions_from_executable(bin/"ha-backup-tool", "completion", shells: [:bash, :zsh, :fish])
  end

  # depends_on "go" => :build

  # def install
  #   ldflags = %w[
  #     -s -w
  #   ]
  #   tags = %w[extended withdeploy]
  #   system "go", "build", *std_go_args(ldflags:, tags:)

  #   generate_completions_from_executable(bin/"ha-backup-tool", "completion", shells: [:bash, :zsh, :fish])
  # end

  test do
    system bin/"ha-backup-tool", "--version"
  end
end

