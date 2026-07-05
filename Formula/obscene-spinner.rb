class ObsceneSpinner < Formula
  include Language::Python::Shebang

  desc "The spinner verbs a senior dev actually mutters at 2am"
  homepage "https://github.com/noctaIO/obscene-spinner"
  url "https://github.com/noctaIO/obscene-spinner/archive/refs/tags/v0.6.tar.gz"
  sha256 "c7027af0d812e7a8557ccdf9220618b05dc5769c06fb99df7bee41887f348eb7"
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
