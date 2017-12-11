require 'formula'

class I686ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url "https://ftp.gnu.org/gnu/gdb/gdb-8.0.1.tar.xz"
  mirror "https://ftpmirror.gnu.org/gdb/gdb-8.0.1.tar.xz"
  sha256 "3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3"

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
