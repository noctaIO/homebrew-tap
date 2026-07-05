class ObsceneSpinner < Formula
  include Language::Python::Shebang

  desc "The spinner verbs a senior dev actually mutters at 2am"
  homepage "https://github.com/noctaIO/obscene-spinner"
  url "https://github.com/noctaIO/obscene-spinner/archive/refs/tags/v0.3.tar.gz"
  sha256 "cbbbaaffafe2bea7c2923c63739c8e31a577b02dd95c2bc350eed2a12911182e"
  license "MIT"

  depends_on "python@3.13"

  def install
    rewrite_shebang detected_python_shebang, "spin.py"
    bin.install "spin.py" => "obscene-spinner"
    bin.install_symlink bin/"obscene-spinner" => "spin"
  end

  test do
    assert_equal "ok", shell_output("#{bin}/obscene-spinner --selftest").strip
  end
end
