Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E6F35C1BD
	for <workflows@vger.kernel.org>; Sun, 22 Feb 2026 22:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771800248; cv=none; b=oBEn/vkn5YLcci8ApNpUqkB0nlSrtbyDPQCTQxez+558XhJzmQeLMr+DD1KXIHtldGRh8A0GXBokOtK9R8bUiBgThGRkFl7JFTf4Vzhcnhe7ibwwCjRYdrUOV+ldJ0t81Lh3it2c/5UGFQsQWhMptpwULfLVufqgWRzQ77qsS5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771800248; c=relaxed/simple;
	bh=yEy5EsQdbFtnSNBQk1628iZvFtHJnE6ygVfOQDJynVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8GPKtF/rJU8/8TSe9QOuOy6IOJ55BA9o+IXyyi7JllD923z2+i5XNf8pbxS4pqChajlRuO0mHeA5wOqD7IToZTCsSpklENgL50nt0yfuPbXYC0JlFBeAevuzHu2lkkutwjmsmOetCCHB9Akmca99SVw1X+PI20wU2r2qyOuT5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJq/lxvu; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJq/lxvu"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79801df2524so35326047b3.0
        for <workflows@vger.kernel.org>; Sun, 22 Feb 2026 14:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771800246; x=1772405046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SCWTk+IBh+cv0sTp+5FoJ30T//K04N5n6pJL4hNPgAY=;
        b=aJq/lxvu8qCA8oVXvWQcBmKZY4yo4RZ/pJ6YeddxUNU5e8On32OJUpp422si5LNX7v
         +i2yOen3Vzufh4QI9VbnYqGkijMZuxotAZK+fNBVyNNzRB4DYPr3IDJl3kLb04wdLQBH
         8YkEvyE7Dzr8O5urUfOPVRQt85f/NbPI/hU9qbgliMMa3uGcih/5VpIhkCA9H7jeYrse
         DA6qa3Kt9t8Mlkf3ym/KNkPUKj25rTMtLghH8Of2FSkMRXpRKI+5h51Uk+UpBTrrwmuE
         yg0CMHcLc2vVODigB3leLFDJnu9pnnUXM50WrelkUJoseba5P3kCbQ3qEHv3eA0G6Np+
         Vdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771800246; x=1772405046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCWTk+IBh+cv0sTp+5FoJ30T//K04N5n6pJL4hNPgAY=;
        b=GM9OssAM5cSAhOeFy7tQCG4fac5SRrUYkjY/fAZ+myLdTFcpClDIVtlN3WHvTkhpZj
         7nDMDGuWjhlJgmkQgF/JteEh/VFxQ4djxmt1XmAQWRfAbDPxswX+rHlhYJLg/aWvtIw/
         nxLEz/Sl4D+V+6RqkUACpzaLTcvPTtWvOcRXgEbjgc+tKinXEL0AvEyYzVIZVpqayIRk
         LsCYlAcKQWc5+UZElTqEipnPEoLIdgi7d8HPCU/sR9G6ZrSzAR0X2v9FyNiLvNfQzopb
         Qld1TfslzUIAWwqCuXMMfQks+GBaRgjnb/uThlh6vN/qU+mKOESUPmPxd86MyFQVDAIu
         GrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsUz9MrQzeDT1190hAYF4ZoY/g8+dpeC9FKbx1Ebx8UHZpVXC+SNPod34ac2Utby92cSTj1gaWF/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2rTQFNDE9JbNXNNCFx1vRqTJYSDnON8lY7RQieLDbb+9PYKPJ
	kDXPYsy2VBu1FX/ILGg+zfhKw+kOgfmBrgZ+GHyOkyVMbMnVFV/0pghR
X-Gm-Gg: ATEYQzzTZ3WQZGr25o60OW8ZR6h41J5AuQ79tDwjM5lyGpxYQa4xlHD0suRgeUog4Qb
	xNHwL6cyZCGtiILenehMy4KRl3yhtjyE9PQWzQoaUk3u0ReTnC2/vuOCDpDsmaa8PNcTPvp2mSW
	xvpaO/O/T75k6vXLxN5lRHeXTYfELUwLzuWB+Bgb48yA58fe3jHQDqjs03Ci/wXdnfCNzw+S/Fk
	MFfb8Y1twOX61cAr5cAvsF9zXsYnmY991yBqXY0teDobmi0yEEhXYthZ6a7kRVC1AbftJS3J9WA
	XebTbKBVIsHKxeLSRPRK7TxbMOGR3eyWlWNm+mQAHkv/L1IRu23OrqVkoW77rmElJ/3ugiukG8o
	f1B8x831BVyQ8mtCUliKKmUdD3/3/QgCedjOfqnq9wsr2xsLNZBeEOadRFpoMxydI6sA4YnXwp/
	6BluneUu5uajJfaa+K9M0=
X-Received: by 2002:a05:690c:a75a:b0:796:3787:39b2 with SMTP id 00721157ae682-79829002a28mr49952017b3.30.1771800246204;
        Sun, 22 Feb 2026 14:44:06 -0800 (PST)
Received: from Gentoo ([158.173.25.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982db94565sm24807487b3.6.2026.02.22.14.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 14:44:05 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Julia.Lawall@inria.fr,
	nicolas.palix@imag.fr,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Doc:dev-tools Added Gentoo in Operating System list under Getting Coccinelle
Date: Mon, 23 Feb 2026 03:58:19 +0530
Message-ID: <20260222224320.27797-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added Gentoo in the operating system list under "Getting Coccinelle".

It should be available the package like this : emerge -av dev-tools/coccinelle

Example:

bhaskar_04:11:00_Mon Feb 23: :~>sudo emerge -av dev-util/coccinelle

These are the packages that would be merged, in order:

Calculating dependencies... done!
Dependency resolution took 6.35 s (backtrack: 0/100).

[ebuild  N     ] dev-lang/ocaml-4.14.2:0/4.14.2::gentoo  USE="-emacs -flambda
-latex ocamlopt -xemacs" 5377 KiB
[ebuild  N     ] dev-ml/dune-3.20.2:0/3.20.2::gentoo  USE="-emacs" 2981 KiB
[ebuild  N     ] dev-ml/findlib-1.9.6-r1::gentoo  USE="-doc ocamlopt -tk" 265
KiB
[ebuild  N     ] dev-ml/result-1.5:0/1.5::gentoo  USE="ocamlopt" 3 KiB
[ebuild  N     ] dev-ml/sexplib0-0.16.0:0/0.16.0::gentoo  USE="ocamlopt" 22
KiB
[ebuild  N     ] dev-ml/ocamlbuild-0.15.0:0/0.15.0::gentoo  USE="ocamlopt" 198
KiB
[ebuild  N     ] dev-ml/menhir-20240715:0/20240715::gentoo  USE="ocamlopt"
1217 KiB
[ebuild  N     ] dev-ml/num-1.5::gentoo  USE="ocamlopt" 67 KiB
[ebuild  N     ] dev-ml/camlp4-4.14_p1-r2:0/4.14_p1::gentoo  USE="ocamlopt"
627 KiB
[ebuild  N     ] dev-ml/csexp-1.5.2-r1:0/1.5.2::gentoo  USE="ocamlopt -test"
12 KiB
[ebuild  N     ] dev-ml/uchar-0.0.2-r1:0/0.0.2::gentoo  USE="ocamlopt" 22 KiB
[ebuild  N     ] dev-ml/dune-configurator-3.20.2:0/3.20.2::gentoo
USE="ocamlopt" 0 KiB
[ebuild  N    ~] dev-ml/stdcompat-21.1-r1:0/21.1::gentoo  611 KiB
[ebuild  N     ] dev-ml/base-0.16.3-r1:0/0.16::gentoo  USE="ocamlopt" 433 KiB
[ebuild  N     ] dev-ml/parmap-1.2.5:0/1.2.5::gentoo  USE="ocamlopt" 48 KiB
[ebuild  N     ] dev-ml/stdio-0.16.0:0/0.16::gentoo  USE="ocamlopt" 8 KiB
[ebuild  N     ] dev-ml/parsexp-0.16.0:0/0.16::gentoo  USE="ocamlopt" 56 KiB
[ebuild  N     ] dev-ml/sexplib-0.16.0-r1:0/0.16::gentoo  USE="ocamlopt" 54
KiB
[ebuild  N     ] dev-ml/pcre-ocaml-7.5.0:0/7.5.0::gentoo  USE="-examples
ocamlopt" 41 KiB
[ebuild  N    ~] dev-util/coccinelle-1.3.0::gentoo  USE="-doc -emacs ocamlopt
pcre -python -test" PYTHON_SINGLE_TTotal: 20 packages (20 new), Size of
downloads: 14168 KiB

Would you like to merge these packages? [Yes/No]

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/dev-tools/coccinelle.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 6e70a1e9a3c0..990a049091e1 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -29,6 +29,7 @@ of many distributions, e.g. :
  - Ubuntu
  - OpenSUSE
  - Arch Linux
+ - Gentoo
  - NetBSD
  - FreeBSD

--
2.52.0

