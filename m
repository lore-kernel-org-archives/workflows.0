Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292751A704B
	for <workflows@vger.kernel.org>; Sun, 22 Feb 2026 22:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771800969; cv=none; b=isMPDkGRdZIoJm5bbvd46NUEY9FLBVGgNjMbZMoHvkToMbHPkHYal6ZI70chDxNHHbfGAMxuEQSygAgGGMXkG51kja0rYroflKvzSe+uhoW1+LgbBP65ad8Fsu0eyzCpEi1F9YXpXqUzmIu0M6dI15pF30l97OkVbx7Q4HCy5+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771800969; c=relaxed/simple;
	bh=vH24ygl0lUP9kYNQreLnnxLpHLeGUIr0F19K0nZzQ6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kV9RxIpp+Q1gxNN+KKpTn4Hle7VopurWIBbSN+MKC+PSNNl6Ct6trtbSgrdulDmt8B/BJjpBvPYSp7gED1cowIr6mCtUppylKpl3S3y8nE83M3il+wZJiZoCRNUedRQJZlrk7FkzpU8YQrtmadxWa1xCcGa9IrF3+i7SI7cieMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gShPXYpS; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gShPXYpS"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7964fb9ae3dso31863977b3.0
        for <workflows@vger.kernel.org>; Sun, 22 Feb 2026 14:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771800967; x=1772405767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DstXTFOjjOc95Qmzr+SeIQriKKg0cVXhchBEqikS0w=;
        b=gShPXYpSHniqp7AECv2sgmnAMF8AcqjLOq/ZPQWVc8CH5LaREDykC3RlWyIN1UcHRX
         Vvkn7oK9DVihmCbUCTveOdUKJwZv3DrDl1tAwP6NKr0C/UuLgWuQ6QGWEZbgbA146Nev
         Pw9DrBF3Fr4VIjXhWSp92JJgcrxH4B2BPHm3BaRVDFDdgqOw17cglFNUWZkRLLEbuA47
         SFW0XKjJG0AagxURiMiyLjbZcFjELANpBqau1eMiEX74aogVt/Qj4LkLafMcXcM5d9ns
         +1AaYo2gaudLKDO3YI4vWy9rV9oQO0fInvznLRxwb07iySFb4nGWvMSzbGyinKt03C9I
         3/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771800967; x=1772405767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DstXTFOjjOc95Qmzr+SeIQriKKg0cVXhchBEqikS0w=;
        b=ooe2P+wVzwzi/eDy2NoWZ9EhAX6IRqaNSvKFqwZf80c4XXpLvCgo3h+nwwkIjfNmPi
         5ugPy9gEdYZDFY4nQg4ZMewOBUZU1rwGViRwuTFyLNzd3E26AD5BLdSM+EoDuMZnz0KH
         C5wiFHIK5fiC0dNkfhYrHvpDvDo8s/6+Lq5DaoyK0Bb3Wzhz3faUMdA2QdcorHB5HPYG
         S/pCWrYalzPTNNjT/JBw/viL0bEiFe1ljsM+bPMJZa8UhpeKSBET4oRXcrtmqs290ueD
         htJbFRjMExaWjD8ktCxamQnWrzc/8Tul7BpC1VbUZnzkZ2Ldc/8O6ecOEzVYGbKJxPyL
         ahcA==
X-Forwarded-Encrypted: i=1; AJvYcCXt1w//oWTRGD6usmEXiRMbA3iogg2BhhmJ+3+SVRm6WB17D8ZW2K058pCtREJt3DNkwiIbq9pKFrg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xlT/5JxaXSur0zGc7+qWYy3p+gcdvlKp8uZYU/ez4Pm6DT+T
	nElp0gcl5sw6mtJLUd3fo0C9NmtrdOz4z6qXRpMX+b8EGEX2jbybp8vR
X-Gm-Gg: ATEYQzxKAKm3NgLHtWRGd6GhRkAi4I+tx2T1QvLE9g0OrlDGFXB5ahmMFqa7NDnvQ0t
	lOlbG2JJr6OTgVjUUXpv51lBLfmRfOv6AvWUFOOEsSFjn5VjT203dqvfCTD+nJG3kAAx7EOW27C
	2zZ7eq85GCHV2Vqh1JyF/LebzwXlDd9jv7xksV8YBVNxOg5FrXCRSOfsBauQ7bnEiJh8FbZzayG
	jOvx2CX9jey9B0jxOk8Y6STyJuMdYFO4KKdvpEjt7Uj51J5ltTj3GsX6XzF/89lUFz58U15Oa0c
	UuBvvXAE8GaIheKGwzYUQxNp1CSJfX9RVCmvMgn3rRlJ5gzrESFDaWFdrgP6FMBPXPDLitjApc0
	CfxSAuXVwnGko5Hy+wp/vlgOOHgETJZFKEZc7T8dPQv0yf2AczRDn7a6TdqQ3RFuMjS534o0dIc
	jwBUZiasnneX6abIDtXy4=
X-Received: by 2002:a05:690c:2701:b0:798:1adc:6804 with SMTP id 00721157ae682-79828ff1c5cmr56780367b3.43.1771800967149;
        Sun, 22 Feb 2026 14:56:07 -0800 (PST)
Received: from Gentoo ([158.173.25.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982de1a659sm24518477b3.52.2026.02.22.14.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 14:56:06 -0800 (PST)
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
Subject: [PATCH V2] Doc: dev-tools:  Added Gentoo in the Operating system list under Getting Coccinelle
Date: Mon, 23 Feb 2026 04:19:56 +0530
Message-ID: <20260222225536.19196-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Adding Gentoo in the operating system list under "Getting Coccinelle".

 This is the correct way:

 Example:

 bhaskar_04:20:50_Mon Feb 23: :~>sudo emerge -av dev-util/coccinelle
 Password:

 These are the packages that would be merged, in order:

 Calculating dependencies... done!
 Dependency resolution took 7.99 s (backtrack: 0/100).

 [ebuild  N     ] dev-lang/ocaml-4.14.2:0/4.14.2::gentoo  USE="-emacs -flambda
 -latex ocamlopt -xemacs" 5377 KiB
 [ebuild  N     ] dev-ml/dune-3.20.2:0/3.20.2::gentoo  USE="-emacs" 2981 KiB
 [ebuild  N     ] dev-ml/findlib-1.9.6-r1::gentoo  USE="-doc ocamlopt -tk" 265
 KiB
 [ebuild  N     ] dev-ml/result-1.5:0/1.5::gentoo  USE="ocamlopt" 3 KiB
 [ebuild  N     ] dev-ml/sexplib0-0.16.0:0/0.16.0::gentoo  USE="ocamlopt" 22
 KiB
 [ebuild  N     ] dev-ml/ocamlbuild-0.15.0:0/0.15.0::gentoo  USE="ocamlopt"
 198 KiB
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
 Changes from V1: Package name mismatched, corrected
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

