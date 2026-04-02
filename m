Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEFB3C4569;
	Thu,  2 Apr 2026 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154446; cv=none; b=fAeHsWmK58scw6cUPSThzGETgNg0jWAx9nLDP6U12n3yxIrSLsOnfXG7AJOATSHCU3MysYmlGfl8RVlpifkJ/by85q6dDgFyAXHz9xEQHtaXEqglFZYwscqjYPO/8GetikusOtABWjVs5Wl3Eku3j3swMRE9bxHyXihhbPFH8CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154446; c=relaxed/simple;
	bh=lYbGhSOqqQUEwZE0acX2UVUvqowOH0oH6Xm9dt/EAm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0d7GyrMUYzLONZw7fFrLzd0mHz2F1MwFCAW2NLIgfDngTowIF+PzX9V+ycNbH2y26uzvBC8HGeHUtffZxVcKNMi25V1BmL2/zPjLWbcEuBIi3G9kofRMtkLyQSD+06+ESOwRLKL+bWyjC7jqQqoVUiEhTsSBs3LZu+JnKwuI1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=OGGz3fKR; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="OGGz3fKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775154429; bh=FV+TU1qQ5cdhGH80pRimkZ1mbKexd6nCcdrKQzpzcW0=;
	h=From:Message-ID:From;
	b=OGGz3fKRJhJRrUVJDKq5Ox4F7QIm4Uh0Len6SM8HQyrtMRcq0R5jlE8v7Sj2v4ON7
	 SxC8F3pp64sKX8CA3D+CWKvFDgkKxjnzpnpOtImi7kZ0jtt2RpWwVWeKQo9DDxzJz3
	 O932D5peO0AXtT/0TGQ+spaVZB4nUYSDgLAnAnxA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 0D9B8C0A98;
	Thu, 02 Apr 2026 20:27:09 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: edumazet@google.com, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>
Subject: [PATCH 1/3] Documentation: minor updates to the security contacts
Date: Thu,  2 Apr 2026 20:26:53 +0200
Message-ID: <20260402182655.8636-2-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260402182655.8636-1-w@1wt.eu>
References: <20260402182655.8636-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This clarifies the fact that the bug reporters must use a valid
e-mail address to send their report, and that the security team
assists developers working on a fix but doesn't always produce
fixes on its own.

Cc: Eric Dumazet <edumazet@google.com>
Cc: Greg KH <greg@kroah.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index c0cf93e11565..da7937fd59df 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -8,6 +8,10 @@ like to know when a security bug is found so that it can be fixed and
 disclosed as quickly as possible.  Please report security bugs to the
 Linux kernel security team.
 
+Reports are to be sent over e-mail exclusively.  Please use a working e-mail
+address, preferably the same that you want to appear in ``Reported-by`` tags
+if any.  If unsure, send your report to yourself first.
+
 The security team and maintainers almost always require additional
 information beyond what was initially provided in a report and rely on
 active and efficient collaboration with the reporter to perform further
@@ -27,11 +31,9 @@ made public.
 
 The Linux kernel security team can be contacted by email at
 <security@kernel.org>.  This is a private list of security officers
-who will help verify the bug report and develop and release a fix.
-If you already have a fix, please include it with your report, as
-that can speed up the process considerably.  It is possible that the
-security team will bring in extra help from area maintainers to
-understand and fix the security vulnerability.
+who will help verify the bug report and assist developers working on a fix.
+It is possible that the security team will bring in extra help from area
+maintainers to understand and fix the security vulnerability.
 
 Please send **plain text** emails without attachments where possible.
 It is much harder to have a context-quoted discussion about a complex
-- 
2.52.0

