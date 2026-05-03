Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A0B30C606;
	Sun,  3 May 2026 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777808146; cv=none; b=UUxkqO+3jIOj7ADT3QxnrW+P9oEX+HLs4s/0g3w2vTGMdG9XGLPKUMIdxpB17X1AzVH53cFKVlke1oL10AXCFe8lGLI0/Bd7hGF5I97WyaoCJf4mZi2yxSkSCt34imtN/xfCSYvkZ7dz6q2q0SzQ3e6hxKX69yCavYc67KH6ZVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777808146; c=relaxed/simple;
	bh=B2l4r4SelBlOsL91lXtv0Iw+gPbn8oFNY++yqQ9t3kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aebGNW4a68I/Qpj6GBPwvEBDmjzC1G57MAtc6ZQ5TRkFhTZiTp1hj8yf6Sp2XrkAumYoOYVluLkW0DfLZyFTwI54a7yxoJ6qVZ8z6gVcDPpyjSerzDdsFWLZSewhMd9kBnQ5G4yINtXOhTux1w6LCkZ+I8PzhDj9gWqoOujN2RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=bfmzuNgm; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="bfmzuNgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777808143; bh=4uJ0V94jxTRiieJHBU7LSyRSoRXbpsCyQIgBHjjpvSs=;
	h=From:Message-ID:From;
	b=bfmzuNgm9O7qD4LYudLybOo2oKIH+HU5ma3SlCmaKbuURvpAmBRDgW8U0c53soTul
	 8F0sjiwZFx2uV9pITv55aG645WxotO5Fcin2eIiMvC3loWcX4xc0baM4aV3uY8Z6BO
	 ZBC+26sk2Dlp0dCvrC3oySbMCayxW+WmSy8rVKH4=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 187C4C0A41;
	Sun, 03 May 2026 13:35:43 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>, Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v2 3/3] Documentation: security-bugs: clarify requirements for AI-assisted reports
Date: Sun,  3 May 2026 13:35:06 +0200
Message-ID: <20260503113506.5710-4-w@1wt.eu>
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

AI tools are increasingly used to assist in bug discovery. While these
tools can identify valid issues, reports that are submitted without
manual verification often lack context, contain speculative impact
assessments, or include unnecessary formatting. Such reports increase
triage effort, waste maintainers' time and may be ignored.

Reports where the reporter has verified the issue and the proposed fix
typically meet quality standards. This documentation outlines specific
requirements for length, formatting, and impact evaluation to reduce
the effort needed to deal with these reports.

Cc: Greg KH <gregkh@linuxfoundation.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 3b44464dd9ba7..bf62469a81266 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -159,6 +159,61 @@ the Linux kernel security team only.  Your message will be triaged, and you
 will receive instructions about whom to contact, if needed.  Your message may
 equally be forwarded as-is to the relevant maintainers.
 
+Responsible use of AI to find bugs
+----------------------------------
+
+A significant fraction of bug reports submitted to the security team are
+actually the result of code reviews assisted by AI tools. While this can be an
+efficient means to find bugs in rarely explored areas, it causes an overload on
+maintainers, who are sometimes forced to ignore such reports due to their poor
+quality or accuracy. As such, reporters must be particularly cautious about a
+number of points which tend to make these reports needlessly difficult to
+handle:
+
+  * **Length**: AI-generated reports tend to be excessively long, containing
+    multiple sections and excessive detail. This makes it difficult to spot
+    important information such as affected files, versions, and impact. Please
+    ensure that a clear summary of the problem and all critical details are
+    presented first. Do not require triage engineers to scan multiple pages of
+    text. Configure your tools to produce concise, human-style reports.
+
+  * **Formatting**: Most AI-generated reports are littered with Markdown tags.
+    These decorations complicate the search for important information and do
+    not survive the quoting processes involved in forwarding or replying.
+    Please **always convert your report to plain text** without any formatting
+    decorations before sending it.
+
+  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
+    the kernel's threat model and go to great lengths inventing theoretical
+    consequences. This adds noise and complicates triage. Please stick to
+    verifiable facts (e.g., "this bug permits any user to gain CAP_NET_ADMIN")
+    without enumerating speculative implications. Have your tool read this
+    documentation as part of the evaluation process.
+
+  * **Reproducer**: AI-based tools are often capable of generating reproducers.
+    Please always ensure your tool provides one and **test it thoroughly**. If
+    the reproducer does not work, or if the tool cannot produce one, the
+    validity of the report should be seriously questioned.
+
+  * **Propose a Fix**: Many AI tools are actually better at writing code than
+    evaluating it. Please ask your tool to propose a fix and **test it** before
+    reporting the problem. If the fix cannot be tested because it relies on
+    rare hardware or almost extinct network protocols, the issue is likely not
+    a security bug. In any case, if a fix is proposed, it must adhere to
+    Documentation/process/submitting-patches.rst and include a 'Fixes:' tag
+    designating the commit that introduced the bug.
+
+Failure to consider these points exposes your report to the risk of being
+ignored.
+
+Use common sense when evaluating the report. If the affected file has not been
+touched for more than one year and is maintained by a single individual, it is
+likely that usage has declined and exposed users are virtually non-existent
+(e.g., drivers for very old hardware, obsolete filesystems). In such cases,
+there is no need to consume a maintainer's time with an unimportant report. If
+the issue is clearly trivial and publicly discoverable, you should report it
+directly to the public mailing lists.
+
 Sending the report
 ------------------
 
-- 
2.52.0

