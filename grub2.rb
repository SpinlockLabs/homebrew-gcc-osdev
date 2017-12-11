require 'formula'

class Grub2 < Formula
  url "https://ftp.gnu.org/gnu/grub/grub-2.02.tar.xz"
  mirror "https://ftpmirror.gnu.org/gnu/grub/grub-2.02.tar.xz"
  sha256 '810b3798d316394f94096ec2797909dbf23c858e48f7b3830826b8daa06b7b0f'

  depends_on 'autoconf'
  depends_on 'automake'
  depends_on 'i686-elf-binutils'
  depends_on 'i686-elf-gcc'

  def install
    system './autogen.sh'
    mkdir 'build' do
      system '../configure', '--disable-werror', 'TARGET_CC=i686-elf-gcc', 'TARGET_OBJCOPY=i686-elf-objcopy',
          'TARGET_STRIP=i686-elf-strip', 'TARGET_NM=i686-elf-nm', 'TARGET_RANLIB=i686-elf-ranlib', '--target=i686-elf', "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end

end
