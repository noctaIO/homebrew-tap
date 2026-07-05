class ObsceneSpinner < Formula
  include Language::Python::Shebang

  desc "The spinner verbs a senior dev actually mutters at 2am"
  homepage "https://github.com/noctaIO/obscene-spinner"
  url "https://github.com/noctaIO/obscene-spinner/archive/refs/tags/v0.5.tar.gz"
  sha256 "4b566e3d1de7ba50b20efb272f4f67e3fd3008551def1c8c87cb809323b5bf4d"
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
