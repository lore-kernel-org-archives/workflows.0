Received: from forward201d.mail.yandex.net (forward201d.mail.yandex.net [178.154.239.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8A361676;
	Fri, 23 Jan 2026 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152558; cv=none; b=l5zVO2IsZXQxVWsnrO2lDrISYR9FgjYSOFpvUnNyl1Ql23t8KRgzf0JMTvpIXxpnMLuFrJBthoSvQn5b+ewRgjhsUX5r8xeC20BCj+f9TrAKfxOB59k17WO0qa5laGDxhYxx3uI8upjLpy+3y0nhVI62TMWQnhdfzLUr2uW2HYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152558; c=relaxed/simple;
	bh=yruQGztw+Uk6JOJzabUK/CM+m6G/Vo7AI/dzJIww/4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sA8/YNiCmmdSPrscnkW0Ti6lRWou+ZIdQWnb19DaZcvAi7xh9WzDNO1r7zk/tDYqbelCIPA5TaaO8A9V8wAKY17YaMrsei7VthT5mYAjQT9GAas9EpUY4mKMaGsIc1wI1XlfR4w/P/e/SskgBFDLmIb+Ao2Ai8AvNy242D7MLI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=nQEfy+PC; arc=none smtp.client-ip=178.154.239.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="nQEfy+PC"
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d103])
	by forward201d.mail.yandex.net (Yandex) with ESMTPS id B95C681A5B;
	Fri, 23 Jan 2026 10:15:42 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id DFBA8C46DF;
	Fri, 23 Jan 2026 10:15:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id XFXe9q6GKKo0-k9H1c3RR;
	Fri, 23 Jan 2026 10:15:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1769152534; bh=BYpLKvEhaHW+MgE8qDE7QPga6s3IKhwvOyWulm+8daw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=nQEfy+PCfK13izzMIoECt5UAw8qkghhoWZ3+3g+hpb17IZYi/MAv9BmXL+KqEuieP
	 V6T/oXJiykZOJyxbK66iOGhfFM1TjhRFJcG2k28zfcqn4bnZfNBrJ4GTbbLOeQ9OYd
	 gFgZBFT5Ca2OVHEej/qYqVe9Env9xEncuACr4ldA=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2] doc: development-process: add notice on testing
Date: Fri, 23 Jan 2026 10:15:23 +0300
Message-ID: <20260123071523.1392729-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <658caf3b-aeb6-49c7-9e5a-1eab175dd1b3@infradead.org>
References: <658caf3b-aeb6-49c7-9e5a-1eab175dd1b3@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add testing notice to "Before creating patches" section.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: adjust spelling and wording according to Randy
---
 Documentation/process/5.Posting.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 9999bcbdccc9..07d7dbed13ec 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -40,7 +40,12 @@ sending patches to the development community.  These include:
  - Test the code to the extent that you can.  Make use of the kernel's
    debugging tools, ensure that the kernel will build with all reasonable
    combinations of configuration options, use cross-compilers to build for
-   different architectures, etc.
+   different architectures, etc. Add tests, likely using an existing
+   testing framework like KUnit, and include them as a separate member
+   of your series (see the next section for more about patch series).
+   Note that this may be mandatory when affecting some subsystems. For
+   example, library functions (resides under lib/) are extensively used
+   almost everywhere and expected to be tested appropriately.
 
  - Make sure your code is compliant with the kernel coding style
    guidelines.
-- 
2.52.0

