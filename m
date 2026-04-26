Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22A15ECCC;
	Sun, 26 Apr 2026 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777222071; cv=none; b=SrzFtYSOnn0RcnLtKthRmGCChnTnLyDiTeFw9OJuNVGdsYLZ9tgym6Gd2zfIVrNS+96ldNw9Npc4eBHKUoBmEkOhleBQ7+yeoqRY+QZPQMJlWR0C6T5GrB03F5HVy96+bsUwkl7PC5L167A6yRc6HSjdPFJKjakZSLKQc8NyeQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777222071; c=relaxed/simple;
	bh=ADOdS+wFtSL3i+xPICG/Ewhro69cnkRZlRDLuYLKnhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reQYWak35/S8y8D9ygvubVGFoebpUoT2C+x3b4qk8MtnNn5fsIyNBb6phbUo/GadEq924sjsTdi7luurWLYQ2t96VaY18GU1WBQRva8YDFz2T5X862483vA1FU0WeX8TzynQ3plCtboDcxa+xI48JRYJyqc5kTXCFblhN+LuO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=oRaoSSSP; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="oRaoSSSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777221576; bh=YM+ltpPjMBKGJMTdC3V832T2C4ra2+nWzVfbP5aUtKE=;
	h=From:Message-ID:From;
	b=oRaoSSSP9wnyHoHrt2ip4dYe6EFg3UdwCpu6o/ztSs7Np1OH8LhJ4X3MYEmwyoWBp
	 USvuBMSjUVQFTw6j4OOCkvsZgrApqEAFhXXhdeOZPDfnl9FeEkCOwnAY+LTWvS7vUq
	 Q/SY7akygeXSavW1/0RgTDLngAvmkPNCBCdfATG4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 8E8D7C0B0B;
	Sun, 26 Apr 2026 18:39:36 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>, Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH 2/3] Documentation: security-bugs: explain what is and is not a security bug
Date: Sun, 26 Apr 2026 18:39:13 +0200
Message-ID: <20260426163914.19449-3-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260426163914.19449-1-w@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of automated tools to find bugs in random locations of the kernel
induces a raise of security reports even if most of them should just be
reported as regular bugs. This patch is an attempt at drawing a line
between what qualifies as a security bug and what does not, hoping to
improve the situation.

Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>
Suggested-by: Leon Romanovsky <leon@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---

Leon, while we started this list before our discussion, I reused most of
your proposal which was more comprehensive, and merged our initial work
into it. I added you in Suggested-by: but I think that Co-developed-by:
would be more suitable. If so, for this you'll have to also sign-off the
patch. It's as you prefer, I personally don't care.

---
 Documentation/process/security-bugs.rst | 50 +++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index a8a8fc724e8c8..7cc3a1970ca00 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -66,6 +66,56 @@ In addition, the following information are highly desirable:
     the issue appear. It is useful to share them, as they can be helpful to
     keep end users protected during the time it takes them to apply the fix.
 
+What qualifies as a security bug
+--------------------------------
+
+It is important that most bugs are handled publicly so as to involve the widest
+possible audience and find the best solution.  By nature, bugs that are handled
+in closed discussions between a small set of participants are less likely to
+produce the best possible fix (e.g., risk of missing valid use cases, limited
+testing abilities).
+
+It turns out that the majority of the bugs reported to the security team are
+just regular bugs that have been improperly qualified as security bugs due to a
+misunderstanding of the Linux kernel's threat model, and ought to have been
+sent through the normal channels described in
+'Documentation/admin-guide/reporting-issues.rst'.
+
+The security list exists for urgent bugs that grant an attacker a capability
+they are not supposed to have on a correctly configured production system, and
+can be easily exploited, representing an imminent threat to many users.  Before
+reporting, consider whether the issue actually crosses a trust boundary on such
+a system.
+
+In the Linux kernel's threat model, an issue is **not** a security bug, and
+should not be reported to the security list, when triggering it requires the
+reporter to first undermine the system they are attacking.  This includes, but
+is not limited to, behavior that only manifests after the administrator has
+explicitly enabled it (loading a module, setting a sysctl, writing to a debugfs
+knob, or otherwise using an interface documented as privileged or unsafe); bugs
+reachable only through root or CAP_SYS_ADMIN or CAP_NET_ADMIN on a machine the
+actor already fully controls, with no further privilege boundary being crossed;
+prediction of random numbers that only works in a totally silent environment
+(such as IP ID, TCP ports or sequence numbers that can only be guessed in a
+lab), issues that appear only in debug, lockdep, KASAN, fault-injection,
+CONFIG_NOMMU, or other developer-oriented kernel builds that are not intended
+for production use; problems seen only under development simulators, emulators,
+or fuzzing harnesses that present hardware or input states which cannot occur
+on real systems; bugs that require modified or emulated hardware; missing
+hardening or defence-in-depth suggestions with no demonstrable exploit path
+(including local ASLR bypass); mounting file systems that would be fixed or
+rejected by fsck; and bugs in out-of-tree modules or vendor forks, which should
+be reported to the relevant vendor.  Functional and performance regressions,
+and disagreements with documented kernel policy (for example, "root can load
+modules"), are likewise ordinary bugs or feature requests rather than security
+issues, and should be reported via the usual channels.
+
+If you are unsure whether an issue qualifies, err on the side of reporting
+privately: the security team would rather triage a borderline report than miss
+a real vulnerability.  Reporting ordinary bugs to the security list, however,
+does not make them move faster and consumes triage capacity that other reports
+need.
+
 Identifying contacts
 --------------------
 
-- 
2.52.0

