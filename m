Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06D30BF6D
	for <workflows@vger.kernel.org>; Tue,  7 Jul 2026 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412474; cv=none; b=T3+imC9MapOZsU9uaQzYHPNgCWvKgAw5qXSrVW9qkNS3okvx/63jPvCywICOra0jRj/iGx6x9MW8/J4QCfTKwdQ//+6hvTp2/uf7+eeGjGDNXs5LjPSy8RetWgLkB0t8wr3NvOrltCCu8GCfGp4XiAHRPbrt56e/oAY0RC6iWg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412474; c=relaxed/simple;
	bh=yxyDXZcLno5sE381KVa7TTA1EbuqjfV/GZXgaDAdujk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sbm11h79MJPBPeZKUXiL5LqYOcfF1csTq/P9wLAsvIvO0qU37c3LZoY02W0GBTpQkv1T/a6EfQ3keCGpRqFrKT3NSfSH8TnaF1lMibCHZY/+Dqw7vDYLkjv2ZTpt5ESMOm9YaTDLdU1+Ym2QyhJXz4X4FlU/+k8c7KNYpTxZa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeUL3IUM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeUL3IUM"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2631555a91.3
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783412472; x=1784017272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Fb4S8tu1I2dFGb/une/tIzUUASJq3fORw7QtUUZ71s=;
        b=aeUL3IUMUipvzSBukstYdzKR4Jp0BhFjhXgYI/dnq2NlVOSkcuPDh1n8msDLuwK2xO
         /i/u/aQAXcLUY49/hgxnFV6FESHmC1ernGdPRBY0/u0IFj8uJaPuiuXktv+n7YsUdK3Z
         mND5Iw/sVpOtItPuKaPPKGNs7o8Rmetmi6hS5sBbZXtgQp7ag4Bc6oOpby9AhjIr7Bc6
         60rC3cJ9KF2NY/SkeVsw1ZAGqEbDRNn8p2HCKynsb8oA+dyL2h5IsU8PzXXHDDCb5tpB
         BlI7C7wamCelwhar36hcMinmxL7OnYFoEmBV7StR6bLZLUN1xHvpDULdFk0qownj94UN
         C7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412472; x=1784017272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Fb4S8tu1I2dFGb/une/tIzUUASJq3fORw7QtUUZ71s=;
        b=dI0gbuIujA1GuIfgpreDb6WL1q45ii5HNjpAe/Pku3glg9TpfzEC4W4f3FLawvdVDf
         oi9+o6hUUxrUPate4wixn1pxV0pvLB7VTvMiSFy0qUQ17ei9e9CgVvjH8nX6dn47K6sq
         klt/Ivn99jUR4+twURNEvIbtqGQFIVi1xX83boSOd/0GLUSVj7ity20eXIGuWMCzJq4t
         mfHpvb8Kum7HeSwzGQRYDX9hDuQ2epDI+Z0cejmjCzB+mqEitHJh96P0IZab+FOb8vvP
         iuvsEh4WMKxO9BrKzJG1dFxsDZxji0OR4Vr438YW5szgRgHLKyx+FlufcEcpCuGXhJMA
         yIwA==
X-Forwarded-Encrypted: i=1; AHgh+Rou9qr0yfTIrFxwAH64Bc4C9wdcnTm7rJkgapnhC+r69J9A59ybB83osrHkdfYOxBCss4ivw+nUxA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIO0ymBLKzg91++09u5X55NuYvXOYBNSnh4sc4bNBH5Q8VHGWz
	Wc7e1bQwXwXANEK8vknp/5FibQB7xdvnbx42DQ9F9DaRELbHrNIRfUM=
X-Gm-Gg: AfdE7cl0PC4UmM6rBypcyH+pIEXi4HRf8Fa9lrZ+WC/BjLZSy1G72fuOzDOCcS1h69A
	tq7R2jd6T04CPm11sXB8PIYj6zh3OiX+wOlbY/fFN+p1W7LOzC4H7UkKehYLqPAdUdH4HIS5LwL
	LzUtsX8NnnVjSiFvexQae+8FIZYhm9Ka3ZmzZhdnQHPaZzR+iNvw9wvET4Ql0DBGEMMLQn5QRfS
	NY8qvk0Cy7LUiKt7aOl+OpvZNioc0cW5RqNOJ+LARI5cAOHkM/i+ZwYhpwdAmXFiguxEJ8zhhdk
	lmEWxXZ4UW2uL5XTO6RWXoiHRgAUZwdo1iVDMaRCWLyb2piaZig2fz/wZ1BbEA4PY8J5kU8CbXT
	0jpdar8K832h1JMZJ2AtUejzkJ0t2MCPmAx1GhXs+cDDNrsKNkxH4M2LLpgn29v//gIjdpi15lS
	yXQh/GQ0CH342SgsFQGvzDFhHTyZI6F79XMUkOO5t17Lg0HLY/ML+dfTEGIQ==
X-Received: by 2002:a17:90b:53c3:b0:387:e0db:3d87 with SMTP id 98e67ed59e1d1-387e0db4364mr1903194a91.34.1783412472075;
        Tue, 07 Jul 2026 01:21:12 -0700 (PDT)
Received: from HARICS-M-4G70.cisco.com ([2001:420:5448:1302:7815:d910:e12a:f166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8f521sm5696125eec.22.2026.07.07.01.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Jul 2026 01:21:11 -0700 (PDT)
From: Harish-CS <harish.cs.ss24@gmail.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Harish-CS <harish.cs.ss24@gmail.com>
Subject: [PATCH] checkpatch: warn on Rust unwrap and expect calls
Date: Tue,  7 Jul 2026 13:51:04 +0530
Message-ID: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust panic paths are discouraged in kernel code because panics currently
lead to BUG-like behavior. Add a checkpatch warning for newly added Rust
uses of unwrap(), unwrap_err(), expect() and expect_err() so contributors
notice them during patch review.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1191
Signed-off-by: Harish-CS <harish.cs.ss24@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 4 ++++
 scripts/checkpatch.pl                  | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 6139a08c34cd..afa9787c1b9f 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -303,6 +303,10 @@ API usage
 
     See: https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
 
+  **RUST_PANIC_METHODS**
+    Rust methods that panic, such as unwrap() and expect(), should be
+    avoided.  Handle the error explicitly instead.
+
   **CONSIDER_KSTRTO**
     The simple_strtol(), simple_strtoll(), simple_strtoul(), and
     simple_strtoull() functions explicitly ignore overflows, which
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..5bdb065370ea 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3972,6 +3972,15 @@ sub process {
 			}
 		}
 
+# avoid Rust panicking methods
+		if ($realfile =~ /\.rs$/ &&
+		    $line =~ /^\+.*\.(?:unwrap(?:_err)?|expect(?:_err)?)\s*\(/) {
+			my $msg_level = \&WARN;
+			$msg_level = \&CHK if ($file);
+			&{$msg_level}("RUST_PANIC_METHODS",
+				      "Avoid Rust panicking methods such as unwrap() and expect(); handle the error instead\n" . $herecurr);
+		}
+
 # check for .L prefix local symbols in .S files
 		if ($realfile =~ /\.S$/ &&
 		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
-- 
2.50.1 (Apple Git-155)

