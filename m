Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4A232E6B4;
	Sun,  2 Aug 2026 20:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702997; cv=none; b=IWD7VWnUda/IaldiFU/ih0C/C1mL5ZIhEJr0HkucyZ69/ZFVCfv/GIR0GLVrit/22O+3og98WhkQqFh3JOeAUPgOedmlSu4iLV1qj7NTzGhaoHEzFtMIfzjtse5rLStkU51o9FaoJyyiXqDL6Y8gAx4FJz+NB2+zaxaCkPMVtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702997; c=relaxed/simple;
	bh=civuMLuOfvRxGC/7AMGzlxoLMrrD/qXjD5Glt6SQlC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+82zxa6K8HiUS6014xhCSDl17FKRH8HpcX7G9zREdhVquH9+OJTrKuGPnMJXPzjHUtA1z4fwrskseKgd191NDGCym51fHi4EU6T+UrXJvA6dgNFa8sOKNCuOCoXl9Jxhbp/bwqzqIA8NRBVPtN1IRZTRmrobXHz8ngeLPlx3vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=fI9wXiZl; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="fI9wXiZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785702994; bh=Il8upSbhflz90D/cHN3ACePK3pJEfC3UUul8QIo+Iqs=;
	h=From:Message-ID:From;
	b=fI9wXiZln3uXDd9Z/ItVPZjnRwBhdDQCmOhZfhz0RYecsqCK5jF03MsRSSlL5zIkB
	 P5aNLn5mif14dA4FY2iSlFwmOX+Gdr1shHb4tPKVRDzidze36EcHx/yzKG6qqkxcqg
	 jGcotuZ/B0wNcfBc/7iW7TKYXF6Y2co9jIsiKNcg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 202A9C0A7D;
	Sun, 02 Aug 2026 22:36:34 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: greg@kroah.com, security@kernel.org, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>,
        Chris Mason <clm@meta.com>
Subject: [PATCH 5/5] docs: security-bugs: clarify some mandatory steps for AI reports
Date: Sun,  2 Aug 2026 22:35:40 +0200
Message-ID: <20260802203540.3453-6-w@1wt.eu>
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

The security team is still seeing a lot of reports lacking a full patch
and showing missing contents and formatting issues. Since AI assistants
tend to be better than humans at following instructions, let's defer to
coding-assistants.rst to follow mandatory steps, and insist on the plain
text format, as well as asking for recipient addresses and an e-mail
client setup hint to be mentioned early in the report for the reporter.

Also add a link to https://github.com/masoncl/kres.git which contains
way more advanced and detailed steps for those willing to go further.

Tested with Opus-5 and Qwen3.6-27B-Architect-Polaris2-Fable-B-F451, both
of which proceeded according to instructions.

Cc: Greg KH <greg@kroah.com>
Cc: Chris Mason <clm@meta.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 6f7c21515e9ea..c7dfecc87764c 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -229,6 +229,28 @@ there is no need to consume a maintainer's time with an unimportant report. If
 the issue is clearly trivial and publicly discoverable, you should report it
 directly to the public mailing lists.
 
+At the very least, when using an AI assistant to find and report bugs, make the
+assistant read this file and threat-model.rst before proceeding, and have it
+follow the procedure described in coding-assistants.rst: work on an up-to-date
+mainline tree and note the commit ID, verify the bug is real, write a fix,
+build it warning-free and checkpatch-clean, commit it with a Fixes tag, and
+identify the maintainers with get_maintainer.pl.
+
+On top of that procedure, the AI assistant **MUST**:
+
+1. Prepare a plain-text report explaining the problem. It must contain the
+   four items listed at the top of this file as absolutely necessary: the
+   affected version or commit ID noted while following the procedure above,
+   the description of the problem, the reproducer or its status, and the
+   triggering conditions.
+2. Start the report with a temporary section listing the recipients' addresses
+   (maintainers+list for the patch, maintainers only for the report and
+   reproducer), and with instructions reminding the reporter to check that
+   their email client is properly setup (see email-clients.rst), and leave it
+   to the reporter to remove that temporary section.
+
+A more detailed process is covered at https://github.com/masoncl/kres.git.
+
 Sending the report
 ------------------
 
-- 
2.52.0

