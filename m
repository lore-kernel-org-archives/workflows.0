Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312CD38F97
	for <workflows@vger.kernel.org>; Fri, 29 Mar 2024 03:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711682947; cv=none; b=AZ5l0mgRZAgMMWYkqQY8mnOqL9XXizOrjHgDdBjH6FsPXeoDdQuPX/9MdF++LIQKuWZTJ4Ta0lUE2e5PoOboCSCHOp2nt1eysfd1uvuy1DFrqd62Y/Gokl5yVGGocQ5LzKUB6EisDy1EidsQYBXKW/42G56qvKtA4RgU419KFUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711682947; c=relaxed/simple;
	bh=zxKmzxnSx9PjVgeDbZCPKKdWSiAMc87p77knFPKdQWI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=StGs5W3vWChj4fVOvHS+5nWQREZd4RWyL05OQNNEu6Tzf7tlczqHdMdlhTbL/iPwaG6I525SjV6DrYdsv4Y8jlYa3oOzyXzfUDfRYRJSTTDRgzCCG/mhX3BpHodP/bBxGcrgyDtrAvrQ2Sf0OCGe90ZKWF8jp3W886cUA3EFXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DXQHNkM9; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DXQHNkM9"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3666affcb59so6133305ab.2
        for <workflows@vger.kernel.org>; Thu, 28 Mar 2024 20:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711682944; x=1712287744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4UbQsk5JfCEGbuiJGPYChkxKlb06kKR5FuZVR4mueQ=;
        b=DXQHNkM9AUszNS/1MVcK8YGOP3Zhw73zLOzXEUeo7VACaMxrGFpzC/lJ48sd3omrz1
         8VtuPn6orqM1fYmFav0pk1ElipPcSOVUZYMCggIcGg1U2IcrStt3HR7J/F67qOMN5u8i
         t4jrvFOIPOHp0ruEahD5sALok3NtXxvu1A17w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711682944; x=1712287744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4UbQsk5JfCEGbuiJGPYChkxKlb06kKR5FuZVR4mueQ=;
        b=RhquoqVEAoBeHacRvuUGtD3dBQiZzhPRFabHhjv9S0l4AHo4+LLXozIP7/uOdRDlQr
         1hBmohLwE60BZJ2YRq6Bc6YFwL1uCumMi6OnnulbO6EGLJHrUTbfqBOnek8Q/VP0woIo
         8/o8tpllmxtkal0ONQ/02K0H8RAYtXIYBARH++8E9LklMz5gcaMW7NvcvMV29zTa2vsu
         AezR5HLHl7zEXK+MYkyT9MNy3SUuVmwqeXfS6XjPAfgii8n3w6LweChakhKM6cccj1hf
         T7rFzNW9SUKEKJhZ77LwNLhipTm9sHOEVKjbvoRnUBRRLri2IzbP4Y4lKjYKceUoCpLW
         r2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF+TTNuqAGQ+H2ksjTdEfGORzoctXmOpjw09Un2sFAVwt88SR4GBQ+YrsB7sPrmpl6EGyLz+bpgFgIf3hmOrpjAC7CnbMJGj6q
X-Gm-Message-State: AOJu0YyfMkGRsG01pFjCqlUBe7EvkcKHlmW22pW4R/xxAe4oZFgqXrcz
	Ah/ePegjyqKASQNx05il7tIpJNb9Vp7FKoxSFdzwqFC3lsgYefuC9nQYvE6YuQ==
X-Google-Smtp-Source: AGHT+IGqWxBBoE3CxFg/cl5Fd1n0LDcdDA7ZaQ+Cun7xZlmWrNgimznfOIOY+KlqexqgjDjjC38tDg==
X-Received: by 2002:a92:ca4e:0:b0:366:ab6f:f6a with SMTP id q14-20020a92ca4e000000b00366ab6f0f6amr1050509ilo.24.1711682944447;
        Thu, 28 Mar 2024 20:29:04 -0700 (PDT)
Received: from chromium.org ([75.104.105.200])
        by smtp.gmail.com with ESMTPSA id l7-20020a056e021aa700b003685b574968sm815717ilv.51.2024.03.28.20.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 20:29:04 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Simon Glass <sjg@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v12 0/2] arm64: Add a build target for Flat Image Tree
Date: Fri, 29 Mar 2024 16:28:34 +1300
Message-Id: <20240329032836.141899-1-sjg@chromium.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Flat Image Tree (FIT) is a widely used file format for packaging a
kernel and associated devicetree files[1]. It is not specific to any
one bootloader, as it is supported by U-Boot, coreboot, Linuxboot,
Tianocore and Barebox.

This series adds support for building a FIT as part of the kernel
build. This makes it easy to try out the kernel - just load the FIT
onto your tftp server and it will run automatically on any supported
arm64 board.

The script is written in Python, since it is easy to build a FIT using
the Python libfdt bindings. For now, no attempt is made to compress
files in parallel, so building the 900-odd files takes a while, about
6 seconds with my testing.

The series also includes a minor clean-up patch.

[1] https://github.com/open-source-firmware/flat-image-tree

Changes in v12:
- Avoid showing FIT message if V=0

Changes in v11:
- Use dtbslist file in image.fit rule
- Update cmd_fit rule as per Masahiro
- Don't mention ignoring files without a .dtb prefix
- Use argparse fromfile_prefix_chars feature
- Add a -v option and use it for output (with make V=1)
- rename srcdir to dtbs
- Use -o for the output file instead of -f

Changes in v10:
- Make use of dtbs-list file
- Mention dtbs-list and FIT_COMPRESSION
- Update copyright year
- Update cover letter to take account of an applied patch

Changes in v9:
- Move the compression control into Makefile.lib

Changes in v8:
- Drop compatible string in FDT node
- Correct sorting of MAINTAINERS to before ARM64 PORT
- Turn compress part of the make_fit.py comment in to a sentence
- Add two blank lines before parse_args() and setup_fit()
- Use 'image.fit: dtbs' instead of BUILD_DTBS var
- Use '$(<D)/dts' instead of '$(dir $<)dts'
- Add 'mkimage' details Documentation/process/changes.rst
- Allow changing the compression used
- Tweak cover letter since there is only one clean-up patch

Changes in v7:
- Drop the kbuild tag
- Add Image as a dependency of image.fit
- Drop kbuild tag
- Add dependency on dtbs
- Drop unnecessary path separator for dtbs
- Rebase to -next

Changes in v6:
- Drop the unwanted .gz suffix

Changes in v5:
- Drop patch previously applied
- Correct compression rule which was broken in v4

Changes in v4:
- Use single quotes for UIMAGE_NAME

Changes in v3:
- Drop temporary file image.itk
- Drop patch 'Use double quotes for image name'
- Drop double quotes in use of UIMAGE_NAME
- Drop unnecessary CONFIG_EFI_ZBOOT condition for help
- Avoid hard-coding "arm64" for the DT architecture

Changes in v2:
- Drop patch previously applied
- Add .gitignore file
- Move fit rule to Makefile.lib using an intermediate file
- Drop dependency on CONFIG_EFI_ZBOOT
- Pick up .dtb files separately from the kernel
- Correct pylint too-many-args warning for write_kernel()
- Include the kernel image in the file count
- Add a pointer to the FIT spec and mention of its wide industry usage
- Mention the kernel version in the FIT description

Simon Glass (2):
  arm64: Add BOOT_TARGETS variable
  arm64: boot: Support Flat Image Tree

 Documentation/process/changes.rst |   9 +
 MAINTAINERS                       |   7 +
 arch/arm64/Makefile               |  11 +-
 arch/arm64/boot/.gitignore        |   1 +
 arch/arm64/boot/Makefile          |   6 +-
 scripts/Makefile.lib              |  16 ++
 scripts/make_fit.py               | 290 ++++++++++++++++++++++++++++++
 7 files changed, 337 insertions(+), 3 deletions(-)
 create mode 100755 scripts/make_fit.py

-- 
2.34.1

