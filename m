Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AxA+me3i"
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E425194
	for <workflows@vger.kernel.org>; Fri,  1 Dec 2023 10:09:09 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54bfa9b3ffaso3120811a12.1
        for <workflows@vger.kernel.org>; Fri, 01 Dec 2023 10:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701454147; x=1702058947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEIQEfvYkVjuDggg7B/9PPN2YOzTUfNPW/xSLvt+K4s=;
        b=AxA+me3iTAwht8bAtFmBwAT39kUpI08GD5MaWKalWAIwgXNwqnjXIpipUi+fPLQ6YM
         SfB4UhT5ZBpClm8ojG89sQJxc5DptH72fzB55o8HesWTYxlhD3GClSmRWziZcccnHuCj
         PKw8NQ8xM1VT/k/dUU7C9df1xJPTn2UssV1Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701454147; x=1702058947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEIQEfvYkVjuDggg7B/9PPN2YOzTUfNPW/xSLvt+K4s=;
        b=RckNUb1GMVwB7CrUauoZGmt47wFBdQp88AyugSztUOxkyda6YQycH+lJSs3lWIbI/p
         ceMyKGsuoDqFrV+QjVzLbWcD5fTIt0nCawjmnm5CfPEXFz8BV6W+UYHi0oOzWyO1aD0s
         gUE9yb7EX/ttydg6tJIYIDMbkfjTilecATJqr5R0WKdZ2Z+vERPmi84Y2iJB1I9t6JgF
         tMOp/cxJdjjTdujiddCnPy3i8ZINNE5LPX7BFWnrtB3V/DzWCaGUL8XGDonfzqoxqtTn
         ZbUybwq8WCNpy7Cnca3BNAYt983d31KZ3+1/GzbTYNvs3Xd1UB+5qF9d/T1nV5JjoF/4
         hdgw==
X-Gm-Message-State: AOJu0YyQPJomjQ/FSb0CIjq8dXap6iaQ5MxixA+f7l67SavkzdBDNUn9
	jeS5O3CRBl9pLYk0q+A/cgLK5Lu7yjYWnSSm7PfOkw==
X-Google-Smtp-Source: AGHT+IFZTKuH9PdUyL0gQprrafos6u3NTUlb/BhkZKnfCp3f1IpmtoqU828/90jTHuGL3HSwlPcLDoACchDP0koolhc=
X-Received: by 2002:a17:906:5349:b0:a1a:55cd:350d with SMTP id
 j9-20020a170906534900b00a1a55cd350dmr107852ejo.104.1701454147105; Fri, 01 Dec
 2023 10:09:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130203358.879796-1-sjg@chromium.org> <20231130203358.879796-3-sjg@chromium.org>
 <CAK7LNARABFKSqY=f1uDGem2UqkTwGUQ9q3rDZ4NbXyuEAtsLdw@mail.gmail.com>
In-Reply-To: <CAK7LNARABFKSqY=f1uDGem2UqkTwGUQ9q3rDZ4NbXyuEAtsLdw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 1 Dec 2023 11:08:47 -0700
Message-ID: <CAPnjgZ0SaoyCMiZHZ8Hs6iE8pqGz0RMYwv1XQQFZOHe1cpn7YQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] arm64: boot: Support Flat Image Tree
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	U-Boot Mailing List <u-boot@lists.denx.de>, lkml <linux-kernel@vger.kernel.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Nicolas Schier <nicolas@fjasle.eu>, 
	Tom Rini <trini@konsulko.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, 1 Dec 2023 at 10:30, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Dec 1, 2023 at 5:34=E2=80=AFAM Simon Glass <sjg@chromium.org> wro=
te:
> >
> > Add a script which produces a Flat Image Tree (FIT), a single file
> > containing the built kernel and associated devicetree files.
> > Compression defaults to gzip which gives a good balance of size and
> > performance.
> >
> > The files compress from about 86MB to 24MB using this approach.
> >
> > The FIT can be used by bootloaders which support it, such as U-Boot
> > and Linuxboot. It permits automatic selection of the correct
> > devicetree, matching the compatible string of the running board with
> > the closest compatible string in the FIT. There is no need for
> > filenames or other workarounds.
> >
> > Add a 'make image.fit' build target for arm64, as well.
> >
> > The FIT can be examined using 'dumpimage -l'.
> >
> > This features requires pylibfdt (use 'pip install libfdt'). It also
> > requires compression utilities for the algorithm being used. Supported
> > compression options are the same as the Image.xxx files. For now there
> > is no way to change the compression other than by editing the rule for
> > $(obj)/image.fit
> >
> > While FIT supports a ramdisk / initrd, no attempt is made to support
> > this here, since it must be built separately from the Linux build.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v8:
> > - Drop compatible string in FDT node
> > - Correct sorting of MAINTAINERS to before ARM64 PORT
> > - Turn compress part of the make_fit.py comment in to a sentence
> > - Add two blank lines before parse_args() and setup_fit()
> > - Use 'image.fit: dtbs' instead of BUILD_DTBS var
> > - Use '$(<D)/dts' instead of '$(dir $<)dts'
> > - Add 'mkimage' details Documentation/process/changes.rst
> > - Allow changing the compression used
> > - Tweak cover letter since there is only one clean-up patch
> >
> > Changes in v7:
> > - Add Image as a dependency of image.fit
> > - Drop kbuild tag
> > - Add dependency on dtbs
> > - Drop unnecessary path separator for dtbs
> > - Rebase to -next
> >
> > Changes in v5:
> > - Drop patch previously applied
> > - Correct compression rule which was broken in v4
> >
> > Changes in v4:
> > - Use single quotes for UIMAGE_NAME
> >
> > Changes in v3:
> > - Drop temporary file image.itk
> > - Drop patch 'Use double quotes for image name'
> > - Drop double quotes in use of UIMAGE_NAME
> > - Drop unnecessary CONFIG_EFI_ZBOOT condition for help
> > - Avoid hard-coding "arm64" for the DT architecture
> >
> > Changes in v2:
> > - Drop patch previously applied
> > - Add .gitignore file
> > - Move fit rule to Makefile.lib using an intermediate file
> > - Drop dependency on CONFIG_EFI_ZBOOT
> > - Pick up .dtb files separately from the kernel
> > - Correct pylint too-many-args warning for write_kernel()
> > - Include the kernel image in the file count
> > - Add a pointer to the FIT spec and mention of its wide industry usage
> > - Mention the kernel version in the FIT description
> >
> >  Documentation/process/changes.rst |   9 +
> >  MAINTAINERS                       |   7 +
> >  arch/arm64/Makefile               |   7 +-
> >  arch/arm64/boot/.gitignore        |   1 +
> >  arch/arm64/boot/Makefile          |   9 +-
> >  scripts/Makefile.lib              |  13 ++
> >  scripts/make_fit.py               | 291 ++++++++++++++++++++++++++++++
> >  7 files changed, 334 insertions(+), 3 deletions(-)
> >  create mode 100755 scripts/make_fit.py
> >
> > diff --git a/Documentation/process/changes.rst b/Documentation/process/=
changes.rst
> > index bb96ca0f774b..cad51bd5bd62 100644
> > --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -62,6 +62,7 @@ Sphinx\ [#f1]_         1.7              sphinx-build =
--version
> >  cpio                   any              cpio --version
> >  GNU tar                1.28             tar --version
> >  gtags (optional)       6.6.5            gtags --version
> > +mkimage (optional)     2017.01          mkimage --version
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> >  .. [#f1] Sphinx is needed only to build the Kernel documentation
> > @@ -189,6 +190,14 @@ The kernel build requires GNU GLOBAL version 6.6.5=
 or later to generate
> >  tag files through ``make gtags``.  This is due to its use of the gtags
> >  ``-C (--directory)`` flag.
> >
> > +mkimage
> > +-------
> > +
> > +This tool is used when building a Flat Image Tree (FIT), commonly used=
 on ARM
> > +platforms. The tool is available via the ``u-boot-tools`` package or c=
an be
> > +built from the U-Boot source code. See the instructions at
> > +https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-=
linux
> > +
> >  System utilities
> >  ****************
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 14587be87a33..9f3eb476ece4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3037,6 +3037,13 @@ F:       drivers/mmc/host/sdhci-of-arasan.c
> >  N:     zynq
> >  N:     xilinx
> >
> > +ARM64 FIT SUPPORT
> > +M:     Simon Glass <sjg@chromium.org>
> > +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscri=
bers)
> > +S:     Maintained
> > +F:     arch/arm64/boot/Makefile
> > +F:     scripts/make_fit.py
> > +
> >  ARM64 PORT (AARCH64 ARCHITECTURE)
> >  M:     Catalin Marinas <catalin.marinas@arm.com>
> >  M:     Will Deacon <will@kernel.org>
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 1bd4fae6e806..6b893dc454b7 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -150,7 +150,7 @@ libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/fir=
mware/efi/libstub/lib.a
> >  # Default target when executing plain make
> >  boot           :=3D arch/arm64/boot
> >
> > -BOOT_TARGETS   :=3D Image vmlinuz.efi
> > +BOOT_TARGETS   :=3D Image vmlinuz.efi image.fit
> >
> >  PHONY +=3D $(BOOT_TARGETS)
> >
> > @@ -162,7 +162,9 @@ endif
> >
> >  all:   $(notdir $(KBUILD_IMAGE))
> >
> > -vmlinuz.efi: Image
> > +image.fit: dtbs
> > +
> > +vmlinuz.efi image.fit: Image
> >  $(BOOT_TARGETS): vmlinux
> >         $(Q)$(MAKE) $(build)=3D$(boot) $(boot)/$@
> >
> > @@ -215,6 +217,7 @@ virtconfig:
> >  define archhelp
> >    echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/=
Image.gz)'
> >    echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boo=
t/Image)'
> > +  echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fi=
t)'
> >    echo  '  install       - Install uncompressed kernel'
> >    echo  '  zinstall      - Install compressed kernel'
> >    echo  '                  Install using (your) ~/bin/installkernel or=
'
> > diff --git a/arch/arm64/boot/.gitignore b/arch/arm64/boot/.gitignore
> > index af5dc61f8b43..abaae9de1bdd 100644
> > --- a/arch/arm64/boot/.gitignore
> > +++ b/arch/arm64/boot/.gitignore
> > @@ -2,3 +2,4 @@
> >  Image
> >  Image.gz
> >  vmlinuz*
> > +image.fit
> > diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
> > index 1761f5972443..62efb533a9bc 100644
> > --- a/arch/arm64/boot/Makefile
> > +++ b/arch/arm64/boot/Makefile
> > @@ -16,7 +16,8 @@
> >
> >  OBJCOPYFLAGS_Image :=3D-O binary -R .note -R .note.gnu.build-id -R .co=
mment -S
> >
> > -targets :=3D Image Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo I=
mage.zst
> > +targets :=3D Image Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo \
> > +       Image.zst image.fit
> >
> >  $(obj)/Image: vmlinux FORCE
> >         $(call if_changed,objcopy)
> > @@ -39,6 +40,12 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
> >  $(obj)/Image.zst: $(obj)/Image FORCE
> >         $(call if_changed,zstd)
> >
> > +# Use this to override the compression algorithm
> > +FIT_COMPRESS ?=3D gzip
> > +
> > +$(obj)/image.fit: $(obj)/Image FORCE
> > +       $(call cmd,fit,$(FIT_COMPRESS))
>
>
>
> Again, $(FIT_COMPRESS) is not used anywhere.
>
>
> Please fix it to
>
>       $(call cmd,fit)
>
>
>
>
> See your code.
>
>
>    cmd_fit =3D $(MAKE_FIT) -f $@ --arch $(UIMAGE_ARCH) --os linux \
>                      --name '$(UIMAGE_NAME)' \
>                      --compress $(UIMAGE_COMPRESSION) -k $< \
>                      $(<D)/dts
>
>
> cmd_fit does not take any argument.
>
>
> The compression is determined by $(UIMAGE_COMPRESSION).

This references argument 2, which is how it works. I have tested this,
for example:

ARCH=3Darm64 CROSS_COMPILE=3D... make FIT_COMPRESS=3Dlzma image.fit

I do want to support different algorithms, if possible. Is there a
better way to do this?

Regards,
Simon
