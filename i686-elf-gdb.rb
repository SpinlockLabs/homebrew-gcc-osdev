require 'formula'

class I686ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url "https://ftp.gnu.org/gnu/gdb/gdb-8.2.tar.xz"
  mirror "https://ftpmirror.gnu.org/gnu/gdb/gdb-8.2.tar.xz"
  sha256 "c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39"

  depends_on 'i686-elf-binutils'
  depends_on 'i686-elf-gcc'

  def install
    mkdir 'build' do
      system '../configure', '--target=i686-elf', "--prefix=#{prefix}", "--disable-werror"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
      FileUtils.rm_rf share/"info"
    end
  end
end
