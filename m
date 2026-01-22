Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [178.154.239.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D11E329369;
	Thu, 22 Jan 2026 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080539; cv=none; b=PC6F+iFu51aj6imAlX3wID+xh+KqsKLptnR/jZQVOnp5mfNyHS89kIlw62Rqfpbquz4wQcBecZn1jTfCpLOMLcBMN3azjJ6JziyTkD8M/2gVV4EwkLIcJACpdSCv499cKrqVe3De87f/zLgjHY7h8cXIzSwbN5J+RzUW5h6+KOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080539; c=relaxed/simple;
	bh=J3Qu7HNH2n8xkIqZcK1J07OiQ46WDGZrjxRjhOeDuKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cp5HK1wHJEBT13SY55w8MhOEDqihV5zL9o+7YoZjQOVGQm8FvBjisew1vcCXE4x5qQTZdX+X64oVnvTgO61gzqnKsJzR3iz466ifWLRppS7dq67pB4OFxqQXFCgxnU3wuEtQ+kEnGj/P673fDX42uUP3epcgSeQR1rqFk/Am4ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=BwIus7oG; arc=none smtp.client-ip=178.154.239.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="BwIus7oG"
Received: from mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:c02d:0:640:f30a:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id C575380B07;
	Thu, 22 Jan 2026 14:15:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id QFaHg9XGv4Y0-qxFwN0Eb;
	Thu, 22 Jan 2026 14:15:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1769080527; bh=4VIx5VpjkvfF3kerdkkGuj1Q8wkUyNFGPG2GRg6jcTU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=BwIus7oGE695jnHdN4oOiJ2AaPqZDUl68KVbCdqDo2ZsyYASDzb+9VbY7xTqkInRD
	 kk9yM4JmueEqWVanOyKBZHWX9JHeRFZ9uWuZ1MSM7n3U1S5WbtWyBJZ+PPF15qbGGy
	 8Sxrqk7M8Nxa7mY0BNl5Rml+xAErDrtqc7oalE8g=
Authentication-Results: mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] doc: development-process: add notice on testing
Date: Thu, 22 Jan 2026 14:15:25 +0300
Message-ID: <20260122111525.1112145-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.52.0
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
 Documentation/process/5.Posting.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 9999bcbdccc9..0271a4dc525e 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -40,7 +40,12 @@ sending patches to the development community.  These include:
  - Test the code to the extent that you can.  Make use of the kernel's
    debugging tools, ensure that the kernel will build with all reasonable
    combinations of configuration options, use cross-compilers to build for
-   different architectures, etc.
+   different architectures, etc. Add tests, likely using an existing
+   testing frameworks like KUnit, and include them as a separate member
+   of your series (see the next section on what about the series is).
+   Note that this may be mandatory when affecting some subsystems. For
+   example, library functions (resides under lib/) are extensively used
+   almost everywhere and expected to be tested appropriately.
 
  - Make sure your code is compliant with the kernel coding style
    guidelines.
-- 
2.52.0

