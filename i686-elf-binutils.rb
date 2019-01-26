require 'formula'

class I686ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url "http://ftp.gnu.org/gnu/binutils/binutils-2.31.tar.gz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.31.1.tar.gz"
  sha256 '5a9de9199f22ca7f35eac378f93c45ead636994fc59f3ac08f6b3569f73fcf6f'

  def install
    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i686-elf',
                             '--enable-gold=yes',
                             '--disable-werror',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end

end
