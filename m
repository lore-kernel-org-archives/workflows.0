Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E2A28DB54;
	Sat,  4 Apr 2026 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290848; cv=none; b=bqQPOh37lQ0D/IiSvXD4iQJZFFbHHJrKGwVYUSq4uzmcT+lrIOim+a17f8d0fwBPyRJ1zfUGsfbXI3bxboGBswhxKmXRya9eHZEapQIgajcezwzgd9RpmOsreFREyaPDYdLlLp7a/abbd/9LLg02JDmzdhxrO8peGU/dSrIapEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290848; c=relaxed/simple;
	bh=P2MLsZcq6pEdGQ2NqDQTz6SKu3yE8RshMOrdgghmzCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0/geOEPh5M4n5ocfLSN/OO73a3vIrCv7hwM9IMVty8eihyz/1Ply2yBfe+TDDvUH/r4vbzRJGQCWIKmXwDSJi4ATX4eXJN5IicaSntPC37hFXgOLWD8iRq9iMMVSEtQXEuFWARLZuQHNhdGjJWF2XYulcO9rfoQ7zP5su8ySrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=CUN5Yq1z; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="CUN5Yq1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775290837; bh=QKiJny8okHVQOTZq9VvZChOmHdJQVSu4E7fMaDOkXj8=;
	h=From:Message-ID:From;
	b=CUN5Yq1zuPoReUkB3ydpXsONLPCGr4N+nNfUJD+hY0hSZAerYztRY0iXApaHZM6zl
	 fxl4tzs0/TmH63D6t6sK3W0HkxhKFcUUkexS2+sI6EO34StMZYQo9WoownYF/AOAf7
	 SNVbJR3dg4MY4a0GgUv7ot5liwdYHRIG03T72h0g=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 8EB03C0EF2;
	Sat, 04 Apr 2026 10:20:37 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: Documentation: fix two typos in latest update to the security report howto
Date: Sat,  4 Apr 2026 10:20:33 +0200
Message-ID: <20260404082033.5160-1-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In previous patch "Documentation: clarify the mandatory and desirable
info for security reports" I left two typos that I didn't detect in local
checks. One is "get_maintainers.pl" (no 's' in the script name), and the
other one is a missing closing quote after "Reported-by", which didn't
have effect here but I don't know if it can break rendering elsewhere
(e.g. on the public HTML page). Better fix it before it gets merged.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---

Greg, this is a fix for commit a72b832a482372 that is currently pending
in your char-misc-linus branch.
---
 Documentation/process/security-bugs.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 0b1f6d8e3cbe..27b028e85861 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -59,7 +59,7 @@ In addition, the following information are highly desirable:
     immediately merged (see Documentation/process/submitting-patches.rst).
     This will save some back-and-forth exchanges if it is accepted, and you
     will be credited for finding and fixing this issue.  Note that in this case
-    only a ``Signed-off-by:`` tag is needed, without ``Reported-by:` when the
+    only a ``Signed-off-by:`` tag is needed, without ``Reported-by:`` when the
     reporter and author are the same.
 
   * **mitigations**: very often during a bug analysis, some ways of mitigating
@@ -88,7 +88,7 @@ recipients to send a report to.  In the Linux kernel, all official maintainers
 are trusted, so the consequences of accidentally including the wrong maintainer
 are essentially a bit more noise for that person, i.e. nothing dramatic.  As
 such, a suitable method to figure the list of maintainers (which kernel
-security officers use) is to rely on the get_maintainers.pl script, tuned to
+security officers use) is to rely on the get_maintainer.pl script, tuned to
 only report maintainers.  This script, when passed a file name, will look for
 its path in the MAINTAINERS file to figure a hierarchical list of relevant
 maintainers.  Calling it a first time with the finest level of filtering will
-- 
2.52.0

