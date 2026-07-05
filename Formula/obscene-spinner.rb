class ObsceneSpinner < Formula
  include Language::Python::Shebang

  desc "The spinner verbs a senior dev actually mutters at 2am"
  homepage "https://github.com/noctaIO/obscene-spinner"
  url "https://github.com/noctaIO/obscene-spinner/archive/refs/tags/v0.7.tar.gz"
  sha256 "9c22126a3fd811d55f143a85ca64c3221185a41ab9f7b6890617162e982bb656"
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
