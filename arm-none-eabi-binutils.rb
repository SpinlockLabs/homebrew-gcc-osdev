require 'formula'

class ArmNoneEabiBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.29.1.tar.gz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.29.1.tar.gz"
  sha256 '0d9d2bbf71e17903f26a676e7fba7c200e581c84b8f2f43e72d875d0e638771c'

  def install
    mkdir 'build' do
      system '../configure', '--disable-nls',
                             '--disable-werror',
                             '--with-gnu-as',
                             '--with-gnu-ld',
                             '--enable-ld=default',
                             '--enable-gold',
                             '--enable-plugins',
                             '--enable-deterministic-archives',
                             '--target=arm-none-eabi',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'

      FileUtils.rm_rf share/"info"
    end
  end

end
