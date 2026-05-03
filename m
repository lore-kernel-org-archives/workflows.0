Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFEF4414;
	Sun,  3 May 2026 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777808131; cv=none; b=fGsA6LPMYmPYmxiIP0Q261hDt1cdBRHT4rGAMF7uRjSC1B97qZyF5+hwJsSk9CggHjMSeg2to8k0Qnadc5jRn3YJwPeq5+ZPHIZkAZ5c0gb5xBvWGL2A1YZHk3YAq9gpMAxlQMtChgsRN2BN4JAHD84HbYwelqGOrfWbPMsu5As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777808131; c=relaxed/simple;
	bh=R5AuOpQ/CttUJov9p3zyQG84rtHv9/B0qumfGziVnzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMCdLlrTuP8XRZoOjdkqGx8KGI5vgOvy6CISP9dElVdXXxIAbEd/tZEqnkpawa5sH7CC8mDYnOiaGCQroE830lc5KZP7D1F6qQHhcj4F2aGL/UdzSkohYNudrrWL6ms+RQv+a+B/n3AQkRi0KDe0Z2amymeK76Dol+vqp2a7R4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=pgIJb0yp; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="pgIJb0yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777808119; bh=GHWcDAo8SKRbZMNLafHKI+K4lNOl3IE2+F6UYcgfLJI=;
	h=From:Message-ID:From;
	b=pgIJb0ypncC6y6n2F2dGFuNsxHNbTUWPkw44R8L4LMSRDQrWGgB4rwxq8mjzhkjCP
	 2AqrQ1VqdwaV8dSvc/MhAnVgtzE4P11Q6LB3k1g8EDeMXouwiMjkoN+/yOW990zthX
	 T9Wkf1c2k6Tx+cu2uddVm3pGK91LsjulGEURLrKs=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 38A1CC0A41;
	Sun, 03 May 2026 13:35:19 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>, Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/3] Documentation: security-bugs: do not systematically Cc the security team
Date: Sun,  3 May 2026 13:35:04 +0200
Message-ID: <20260503113506.5710-2-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260503113506.5710-1-w@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the increase of automated reports, the security team is dealing
with way more messages than really needed. The reporting process works
well with most teams so there is no need to systematically involve the
security team in reports.

Let's suggest to keep it for small lists of recipients and new reporters
only. This should continue to cover the risk of lost messages while
reducing the volume from prolific reporters.

Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 27b028e858610..6dc525858125e 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -148,7 +148,15 @@ run additional tests.  Reports where the reporter does not respond promptly
 or cannot effectively discuss their findings may be abandoned if the
 communication does not quickly improve.
 
-The report must be sent to maintainers, with the security team in ``Cc:``.
+The report must be sent to maintainers.  If there are two or fewer
+recipients in your message, you must also always Cc: the Linux kernel
+security team who will ensure the message is delivered to the proper
+people, and will be able to assist small maintainer teams with processes
+they may not be familiar with.  For larger teams, Cc: the Linux kernel
+security team for your first few reports or when seeking specific help,
+such as when resending a message which got no response within a week.
+Once you have become comfortable with the process for a few reports, it is
+no longer necessary to Cc: the security list when sending to large teams.
 The Linux kernel security team can be contacted by email at
 <security@kernel.org>.  This is a private list of security officers
 who will help verify the bug report and assist developers working on a fix.
-- 
2.52.0

