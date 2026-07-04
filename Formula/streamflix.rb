class Streamflix < Formula
  include Language::Python::Virtualenv

  desc "Terminal UI to browse, stream, and feed Plex — with live TV providers"
  homepage "https://github.com/noctaIO/streamflix"
  # Private source repo: brew clones it via git using this machine's GitHub
  # credentials (run `gh auth setup-git` once so HTTPS clones carry the token).
  url "https://github.com/noctaIO/streamflix.git",
      using:    :git,
      revision: "a0edb080011792235190fe6958f5ee52415627c9"
  version "0.1.0"

  depends_on "ffmpeg" # remux downloads + stream probing
  depends_on "mpv"    # default player for streaming
  depends_on "python@3.12"

  # Deps are resolved by pip at install time (curl_cffi ships a binary wheel with
  # its bundled libcurl-impersonate). A personal tap favors this over hand-pinned
  # resource stanzas for ~40 transitive deps.
  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "-v", buildpath
    bin.install_symlink libexec/"bin/streamflix"
  end

  test do
    # Import-only: launching the entry point would start the full-screen TUI.
    system libexec/"bin/python", "-c", "import streamflix, streamflix.livetv"
  end
end
