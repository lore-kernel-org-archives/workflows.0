Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C99626C3A2
	for <workflows@vger.kernel.org>; Sat, 28 Mar 2026 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774684119; cv=none; b=pkR65aQC9jjZmVsVkeHcBHMCwQRrphO3sy7IzC5koczrO4ooJ7GRsNN95k2duCs9BNcbvp2mrvikLEDA9lGfS09E3JjR03lDqinVKPRpOHLdjR8+2xwPwp5lzo4BYY6phPBLsxGPygJVAEqFXSM1+PqWgZmyTpsnBoLQNtJn+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774684119; c=relaxed/simple;
	bh=dAMuMyhtsRPnxRv4ojblqSNFrdw1vw9bcev0LsRTLCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7lg//j5siumJ+eVJCvQD0yrsKGWFPgSjXDRE1+/BLg4B3rO4HG39L0hD9z++du5FZWe5r2ZHFIrtyZ0Clgj+t9EJPEnXqyCNCopUgLJ2tK9suYU6qnwHPzzhiiEwjAXwjUO/i3TQnPkfJkgCHhjBT1j84dI6oanI1Cjg+Gc4Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmvJ505Q; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmvJ505Q"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64937edbc9eso2814938d50.2
        for <workflows@vger.kernel.org>; Sat, 28 Mar 2026 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774684117; x=1775288917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFoQZa2dmnnD+JGA9WJFHJi0YQNPX0KSTuaC/bKeOTE=;
        b=DmvJ505QuxRvAnXclvLx1Ryb5/4kspiOIBmKE3FrUjaJfptWKTy23vGmHrFYocMEAF
         Zyktupf2YuOofVVDPVVlPdJNWP8AYKUmfsVJ/NwnzuNtPecl4HNZQCiYB1TjHTIYtyoe
         oD1Gx1hv85BboGqqP+kKLxWKTDWpP48NTKrzgOpyUp8OLCNOSFsIh8NRizKJnSINq0Tc
         39mMExxB7i7p8W2G/wubEzB7uuc63QXLsJpq2Aij9VyYjHBVOKySpCRbGNtaum+21ggw
         Y5BqwxrdiS0vm3feoSCaQ1i11ZFPHalosJHC3rwEfd2V1AwDxuReML7pdobgMFR0lwgT
         d8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774684117; x=1775288917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFoQZa2dmnnD+JGA9WJFHJi0YQNPX0KSTuaC/bKeOTE=;
        b=rZI3JjFT0OqbWA55pSO1YRlRUiKu31NUNmfL1OrQ36X9TJzrCKjmTog4LZ28+TOLLC
         boswlgLI3F3YkqldjeJfGVNqK9I8Uo9j25ftQpr5cnzpDiN9yHWNlrCp3fnqkvvnYtiN
         tqEzgSi5DjV/DBnxRf3hf/AKtY39BMTZnpi+eUVWTX1s99s2SjgFdIlRjyYKOK92+hIL
         mZ1tuKQzDrjiOdWjhpe2A9fjOimCM33VG6Iv91ODl04ftncxg7foFw3U5BY1Uu6Xo7Zd
         4Haz/r8wOdOnB7qwBlptis0/ns/ZKzPSa1zewwifxIFYaQwGYBlcogymmXG15HGfWEeI
         9akA==
X-Forwarded-Encrypted: i=1; AJvYcCXVOuycTzV4oeuzPIPOliofijn+DYLMzXKXvCt/I4pTDmSXppmTHi9dXk40dRImCplW9uMjg1qNfPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxauLzaAX3ZT+q0IwrQyJMgIVt7/uKElHWXfU1RCS/BmJB1a+gC
	i19LsqcYAkGGgli6KfyCgG7xosSVWQHhxZIxMXQwkQR2FtF60lvam/6R
X-Gm-Gg: ATEYQzwF2I6AHa2gAwNSuTO/qnln3ij54AbOPN+qZ/J7lKGmGd8WDeWZrcLz1bWNclA
	MJn7UPMg6mTCsxZjDuLhPzvik37WSe/TvJusp8btq2aCn+sCK7NrMuxTsKGJJiluOBOZ7ZkGCpa
	SNEUNN/cpcuIrAX0mIXG30AP7nW7pAHw8ppHzvdg+HAjds0izxAttlEsvJX+WMZW9DvRlCSDCKI
	jB3rENHQWtE6dWGHk09iAebr5e1Nc1Hx38i1W4eBHPsYt10+1iql6YRBfAG1ja8ZB6zjgE8Qn6J
	qDhFE8nxHCGU3qqEgVPaGYypwx5MTKR0tQ+vDXREkQnn3kKR+euHjYJAEkk02Jp8oGpQW5NDvHU
	OjYL9c1ZvojUHOBs1ir6mhhvejPoWlXrz5Tq24EedEdwCzDPY4+KdaQZD8MBM+ETrjDCR3BDCJ2
	7FzfxCsO0by6Y4KiXd8A==
X-Received: by 2002:a05:690c:38b:b0:79b:dafd:d23 with SMTP id 00721157ae682-79bddcb8e60mr51218457b3.13.1774684117457;
        Sat, 28 Mar 2026 00:48:37 -0700 (PDT)
Received: from Gentoo ([158.173.25.82])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cb9a8f2f3sm6554557b3.30.2026.03.28.00.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 00:48:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Doc: process: Added two important books for Linux Kernel programming and development
Date: Sat, 28 Mar 2026 13:10:42 +0530
Message-ID: <20260328074745.2309736-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These books are very well written and enhance the understanding of the process.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/process/howto.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6f50..c5164a27fc1a 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -34,7 +34,8 @@ experience, the following books are good for, if anything, reference:
  - "The C Programming Language" by Kernighan and Ritchie [Prentice Hall]
  - "Practical C Programming" by Steve Oualline [O'Reilly]
  - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
-
+ - "Linux System Programming" by Robert Love [O'Reilly]
+ - "Linux Kernel Development" By Robert Love [Pearson]
 The kernel is written using GNU C and the GNU toolchain.  While it
 adheres to the ISO C11 standard, it uses a number of extensions that are
 not featured in the standard.  The kernel is a freestanding C
--
2.52.0

