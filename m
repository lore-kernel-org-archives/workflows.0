Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F42337107;
	Sun,  2 Aug 2026 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702989; cv=none; b=bGVQGnt45JlHhm9l/Rd6lSr6IlW9r6wDeiu6+s3QKalAe7DH/qPatcvn62HttGrWUB2ZzAvrAmnIWTzFNaLxNsgiy2EWjiOdMcVJ6vPhulZJ83Zc8T/Ru4j1gR0uyuKoRrm9FewGrTfE2dLtVuFdFTRYWmEp8y+Z6MbvqcLP9iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702989; c=relaxed/simple;
	bh=1x4tpxFTAiH+je9cZG1X7qLnucoHC85fBVgo/sqgzAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+0fK7Xd3xjrLZeOIq3LVr/TVoLGu2ve3jkC6T557Ju35dapoM3LFUUs3ySjdGhdbnDb3idF6LMBgcnZEHMXT3F+a0ZogCgnOff0Xqw79Jke5ViubP1XnMSzFBeEr/pmvgJq2fGiWiWIdypBW6vRQaHaCLPb8Gvy3/hPh0V0ZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=LPX2vwQd; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="LPX2vwQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785702986; bh=PvfLxAdxMT3vY2Re951yKjeKaKCuN9M/jVDlLgztJAk=;
	h=From:Message-ID:From;
	b=LPX2vwQdV2IkoPhrJAtdgufXGUf3F0jpDDL8q9W0dkp7z4pVMkGwi2FFNWE1zdh5z
	 /63PivO65FszsbkgDPAg/PFH1arCW0RPcNXCh9gcMB1jUG5wHeN8nhQhftUpE9b7SS
	 ykumd+bsV1nriKz9s+6/gMCCRF9sGZPUH8kSXsJk=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1ACCAC0A7D;
	Sun, 02 Aug 2026 22:36:26 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: greg@kroah.com, security@kernel.org, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 4/5] docs: coding-assistant: explain important steps when looking for bugs
Date: Sun,  2 Aug 2026 22:35:39 +0200
Message-ID: <20260802203540.3453-5-w@1wt.eu>
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

Due to the increasing capabilities of available AI models, it's becoming
common to see them used to find bugs anywhere. Unfortunately the quality
of reports (especially when they're believed to be security relevant) is
still lacking a lot.

Let's add a section dedicated to bug finding, explaining the few
mandatory steps (noting commit ID, writing the fix from the session that
found the bug, building and testing, etc). This was tested both against
Qwen3.6-27B-Architect-Polaris2-Fable-B-F451 running under Hermes, and
Opus-5, and both followed the instructions to the letter, verifying
their results and checking threat-model.rst to decline the vulnerability
aspect. At least in the current form it's expected to improve the
situation a little bit.

Cc: Greg KH <greg@kroah.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/coding-assistants.rst | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 899f4459c52d2..e71df7d28467e 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -57,3 +57,40 @@ Basic development tools (git, gcc, make, editors) should not be listed.
 Example::
 
   Assisted-by: Claude:claude-3-opus coccinelle sparse
+
+Procedure for finding and fixing bugs
+=====================================
+
+When an AI assistant is used to find and fix bugs, it **MUST** follow at least
+these steps:
+
+1. Before starting, read the whole process documentation listed above, as well
+   as any other document mentioned in the request. Do not rely on isolated
+   parts found by keyword search.
+2. Note the commit ID and Locate a bug as instructed.
+3. For any bug found that is not trivial, verify that it looks real by
+   attempting to create a reproducer to demonstrate it. Lacking it may cause
+   the report to be ignored, as many unverified bug reports sent to maintainers
+   happen to be invalid. Stop here if it finally looks wrong.
+4. Write a fix for the bug. This part is not optional: except in a few very
+   rare cases, an AI assistant able to find a bug is able to fix it. Note that
+   fixes written in the same session as used to find the bug will generally
+   lead to better and more accurate fixes as the LLM's reasoning context
+   remains present.
+5. Build and verify that the fix works either using the reproducer or by
+   re-running a complete analysis; drop any fix that doesn't work and try
+   another one. The fix must not add build warnings and must pass the
+   checkpatch.pl checks (see submitting-patches.rst).
+6. Commit the working fix with a detailed message describing the problem, the
+   solution and a Fixes tag. Do not add a Signed-off-by tag, and add an
+   Assisted-by tag, as described above.
+7. Identify the maintainers and lists using scripts/get_maintainer.pl.
+   Documentation/process/security-bugs.rst shows how to do that.
+8. Indicate what could not be done. If the fix could not be built or tested, or
+   if no reproducer could be produced, say so explicitly: maintainers currently
+   waste too much time analyzing unverified reports and untested fixes.
+9. Read Documentation/process/threat-model.rst to determine whether the bug is
+   a vulnerability or a regular bug, and leave the result to the reporter for
+   review (the assistant must never send anything itself). Regular bugs are
+   submitted as described in Documentation/process/submitting-patches.rst,
+   vulnerabilities as described in Documentation/process/security-bugs.rst.
-- 
2.52.0

