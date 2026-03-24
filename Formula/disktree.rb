class Disktree < Formula
  desc "Drill-down storage inspector for macOS"
  homepage "https://github.com/VatsalJagani/mac-disktree"
  url "https://github.com/VatsalJagani/mac-disktree/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2614e6ff7684aae4de943a80cf2edaf19b1a1b865ca320e4fb51c16dd2caccca"
  license "MIT"

  depends_on "python@3"

  def install
    virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", *std_pip_args(prefix: libexec), "."
    bin.install_symlink Dir[libexec/"bin/disktree"]
  end

  test do
    assert_match "disktree", shell_output("#{bin}/disktree --help")
  end
end
