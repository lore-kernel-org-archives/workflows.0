Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB42F1FED;
	Sun,  2 Aug 2026 20:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702981; cv=none; b=BhoeEb368q9axjhibo6IVfqOkvSAa7IJ1rcWECTLF0M5dZBjTmhcx1W3D0EwP/ZIWgo/G08JgXdz7/4cQULU3nCXhnXj51YbqnM1AUuMtAymNiBwt7kAZ0zfFyAn8TbJmCsOgdIkwzsn1b4LirkGIiCPWznyFKlo7fCBLAn/cbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702981; c=relaxed/simple;
	bh=/ax0l9rScBedUQ4ArUTep6Na7Q3QRH0wX20HyIGC1x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6buzXpkzJvLbS9MMrmbVvPmpuDh2GQSyy49D0JJFd9WiGmXooIM/6tBx6byr43HmH323AAWpOGaHwSEvFqs8WXfVXCjIinxlCiuchHVc7nyABoTrjQmERpo/ROP21zXGGFVhqV9wSKhXPATiWobP2OGCpqW7elPa90VBFlMSvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=V5ZeIQFm; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="V5ZeIQFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785702978; bh=EP2E+BcQxM46wRN+1R6UApkJ5/0ihgYvp/H+1ZpDISY=;
	h=From:Message-ID:From;
	b=V5ZeIQFmBXojW8hnEMAWF9D4hRJornrUUBqcW6njddbBwD1uoajudSKOZcgJa2TkQ
	 k1ov8mYKl1snw4Xo8Dffa4ZriOndxhZJU7QAXru9GMxKFXIwUdb6S36nW2w1KueKIB
	 Qt4V+h1D+Rls9aFJiXBAFkHEBVYXaGFP3SyWBnnQ=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1A0FCC0A7D;
	Sun, 02 Aug 2026 22:36:18 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: greg@kroah.com, security@kernel.org, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 3/5] docs: security-bugs: clarify what counts as a valid version
Date: Sun,  2 Aug 2026 22:35:38 +0200
Message-ID: <20260802203540.3453-4-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260802203540.3453-1-w@1wt.eu>
References: <20260802203540.3453-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Too often we're getting reports saying "still valid in latest mainline"
with no indication of when this was verified, making this indication
pointless. Let's clarify it and insist on having a version or commit ID,
and that the version must necessarily be for a kernel.org kernel and not
a distro one.

Cc: Greg KH <greg@kroah.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 3c51ddde31dd9..6f7c21515e9ea 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -18,6 +18,10 @@ information is helpful.  The following information are absolutely necessary in
 **any** security bug report:
 
   * **affected kernel version range**: with no version indication, your report
+    will not be processed.  Note that a time-dependent version such as "latest
+    mainline" is not acceptable.  A stable identifier such as a commit ID or an
+    exact version is required.  Versions designating kernels not coming from
+    kernel.org (such as distro kernels) are meaningless to maintainers and
     will not be processed.  A significant part of reports are for bugs that
     have already been fixed, so it is extremely important that vulnerabilities
     are verified on recent versions (development tree or latest stable
-- 
2.52.0

