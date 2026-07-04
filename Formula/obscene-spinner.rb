class ObsceneSpinner < Formula
  include Language::Python::Shebang

  desc "The spinner verbs a senior dev actually mutters at 2am"
  homepage "https://github.com/noctaIO/obscene-spinner"
  url "https://github.com/noctaIO/obscene-spinner/archive/refs/tags/v0.2.tar.gz"
  sha256 "b36217eb3b8bec0f60b117bbe770cf11f7abafe6df24213da266f4592d56ad68"
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
